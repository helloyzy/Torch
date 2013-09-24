//
//  UIViewController+Torch.m
//  Torch
//
//  Created by Whitman Yang on 8/22/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "UIViewController+Torch.h"
#import "TCViewController.h"
#import "IIViewDeckController.h"
#import "TCProfileController.h"
#import "TCMyDayController.h"
#import "TCRouteMapViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TCUtils.h"
#import <IBFunctions.h>
#import <objc/runtime.h>

@implementation UIViewController (Torch)

#pragma mark - dismiss keyboard 

- (UIView *) viewForTapToDismissKeyboard {
    return nil;
}

- (void) dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void) registerDismissKeyboardOnContainerView {
    UIView * viewForTapToDismissKeyboard = [self viewForTapToDismissKeyboard];
    if (viewForTapToDismissKeyboard) {
        UITapGestureRecognizer * clickRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
        [clickRecognizer setNumberOfTapsRequired:1];
        [clickRecognizer setNumberOfTouchesRequired:1];
        clickRecognizer.cancelsTouchesInView = NO;
        [viewForTapToDismissKeyboard addGestureRecognizer:clickRecognizer];
    }
}


#pragma mark - editing view finish editing

- (void) viewFinishEditing:(UIView *)editingView {
    if (editingView.tag == END_EDIT_VIEW_TAG) {
        [self dismissKeyboard:nil];
        return;
    } else {
        [self switchToNextEditingView:editingView];
    }
}

- (UIView *) findView:(int)tag {
    return [self.view viewWithTag:tag];
}

- (UIView *) findNextEditingView:(UIView *) curEditingView {
    UIView * result = nil;
    if (curEditingView.tag >= START_EDIT_VIEW_TAG && curEditingView.tag < END_EDIT_VIEW_TAG) {
        result = [self findView:(curEditingView.tag + 1)];
        if (!result) {
            // find the last editing control
            result = [self findView:END_EDIT_VIEW_TAG];
        }
    }
    return result;
}

- (void) switchToNextEditingView:(UIView *) curEditingView {
    UIView * nextView = [self findNextEditingView:curEditingView];
    [curEditingView resignFirstResponder];
    if (nextView) {
        [nextView becomeFirstResponder];
    }
}


#pragma mark - customized navigation bar

+ (void) setNavbarBgImg:(UINavigationBar *)navBar {
    // need a image sized 320 * 44 (or even bigger)
    UIImage * navBgImg = [UIImage imageNamed:@"navbar_bg.png"];
    [navBar setBackgroundImage:navBgImg forBarMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:navBgImg forBarMetrics:UIBarMetricsLandscapePhone];
    
    // block the bottom gray line
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, navBar.bounds.size.height - 4, navBar.bounds.size.width, 4)];
    bottomView.userInteractionEnabled = NO;
    bottomView.backgroundColor = [UIColor colorWithRed:36/255.0f green:36/255.0f blue:36/255.0f alpha:1];
    [navBar addSubview:bottomView];
    UIButton* jump = [UIButton buttonWithType:UIButtonTypeCustom];
    jump.layer.cornerRadius = 8.0;    
    jump.frame = (CGRect) {50, -8, 220, 45};
    jump.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.5 alpha:0.5];
    jump.titleLabel.font = [UIFont systemFontOfSize:13];
    [jump setTitle:@"Tap to return to  call in progress" forState:UIControlStateNormal];
    [navBar addSubview:jump];
    [navBar bringSubviewToFront:jump];
//    UIView * bottomSeparator = [[UIView alloc] initWithFrame:CGRectMake(0, navBar.bounds.size.height - 1, navBar.bounds.size.width, 1)];
//    bottomSeparator.userInteractionEnabled = NO;
//    bottomSeparator.backgroundColor = [UIColor colorWithRed:134/255.0f green:134/255.0f blue:134/255.0f alpha:1];
//    [navBar addSubview:bottomSeparator];

}

+ (UINavigationController *) customNavCtr:(UIViewController *)rootVwCtl {
    UINavigationController * result;
    if (rootVwCtl) {
        result = [[UINavigationController alloc] initWithRootViewController:rootVwCtl];
    } else {
        result = [[UINavigationController alloc] init];
    }
    [self setNavbarBgImg:result.navigationBar];    
//    result.navigationBar.clipsToBounds = YES;
//    [result.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    return result;
}

- (void) toggleProfileView:(id)sender {
    // we have a deckViewController sitting on top of the nav controller
    IIViewDeckController * deckCtl = self.navigationController.viewDeckController;
    if (deckCtl) {
        [deckCtl toggleRightViewAnimated:YES];
    }
}

- (UIBarButtonItem *) navBarRightItem {
    UIImage * image = [UIImage imageNamed:@"navbar_righticon.png"];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 33, 30);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    if ([self respondsToSelector:@selector(toggleProfileView:)]) {
        [btn addTarget:self action:@selector(toggleProfileView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void) decorateNavItem:(UINavigationItem *)navItem isDecorateBkItem:(BOOL)bkItemFlag isDecorateRtItem:(BOOL)rtItemFlag {
    if (bkItemFlag) {
        navItem.backBarButtonItem.title = NSLocalizedString(@"Back", nil);
    }
    if (rtItemFlag) {
        navItem.rightBarButtonItem = [self navBarRightItem];
    }
}

- (void) decorateNavBar {
    if (self.navigationController) {
        [self decorateNavItem:self.navigationItem isDecorateBkItem:YES isDecorateRtItem:YES];
    }
}

- (void) decorateNavBar:(UINavigationBar *)navBar {
    [UIViewController setNavbarBgImg:navBar];
}

# pragma mark - deck view controllers

+ (UIViewController *) rootDeckView:(UIViewController *)firstCtl {
    // construct a deck view ctl as the window's rootViewController, and then set its center ctl as a nav ctl, right ctl as a profile ctl
    UINavigationController * navCtr = [UIViewController customNavCtr:firstCtl];
    UIViewController * profile = [[TCProfileController alloc] init];
    IIViewDeckController * result = [[IIViewDeckController alloc] initWithCenterViewController:navCtr rightViewController:profile];
    result.panningMode = IIViewDeckNoPanning;
    result.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    return result;
}

+ (UIViewController *) myDayDeckAsRoot {
    UIViewController * left = [[TCRouteMapViewController alloc] initWithNibName:@"TCRouteMapView" bundle:nil];
    TCMyDayController * center = [[TCMyDayController alloc] initWithNibName:@"TCRouteTableView" bundle:nil];
    
    IIViewDeckController * controller = [[IIViewDeckController alloc] initWithCenterViewController:center leftViewController:left rightViewController:nil];
    [controller decorateNavItem:controller.navigationItem isDecorateBkItem:YES isDecorateRtItem:YES];
    
    UIViewController * result = [self rootDeckView:controller];
    
    return result;
}

#pragma mark - textfield and keyboard interactions

static CGFloat _keyBoardHeight;

- (BOOL)shouldObserveKeyboardInfo {
    return NO;
}

- (void)registerNotificationForKeyboardInfo {
    if (! [self shouldObserveKeyboardInfo]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)removeNotificationForKeyboardInfo {
    if (! [self shouldObserveKeyboardInfo]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)onKeyboardWillShow:(NSNotification *)aNotification {
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    _keyBoardHeight = keyboardRect.size.height;
}

- (CGFloat)keyboardHeight {
    if (_keyBoardHeight > 0) {
        return _keyBoardHeight;
    }
    if (isDeviceOrientationLandscape()) {
        return 140;
    } else {
        return 216;
    }
}

- (UIView *)findRootSuperView:(UIView *)view {
    UIView *preSuperVw = nil;
    UIView *superVw = view.superview;
    while (superVw) {
        if ([superVw isKindOfClass:[UIWindow class]]) {
            return preSuperVw;
        }
        preSuperVw = superVw;
        superVw = superVw.superview;
    }
    return nil;
}

- (CGPoint)positionInGlobalWindow:(UIView *)view {
//    CGPoint result = view.frame.origin;
//    UIView *superView = view.superview;
//    UIView *s_superView = superView.superview;
//    while (s_superView) {
//        CGPoint temp = superView.frame.origin;
//        result.x = result.x + temp.x;
//        result.y = result.y + temp.y;
//        // NSLog(@"When in %@, the position %f, %f", [s_superView class], origin.x, origin.y);
//        superView = s_superView;
//        s_superView = superView.superview;
//    }
//    return result;
    CGPoint result = view.frame.origin;
    UIView *superView = view.superview;
    while (superView) {
        CGPoint temp = superView.frame.origin;
        result.x = result.x + temp.x;
        result.y = result.y + temp.y;
        if ([superView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollVw = (UIScrollView *)superView;
            // subtract the offset
            result.x = result.x - scrollVw.contentOffset.x;
            result.y = result.y - scrollVw.contentOffset.y;
            NSLog(@"When in %@, the position %f, %f", [superView class], result.x, result.y);
            NSLog(@"ContentOffSet x %f, y %f", scrollVw.contentOffset.x, scrollVw.contentOffset.y);
        }
        // NSLog(@"When in %@, the position %f, %f", [superView class], result.x, result.y);
        superView = superView.superview;
    }
    return result;
}

static const char * KEY_MOVE_SPACE;

- (void)moveToVisibleIfNecessary:(UIView *)view {
    CGPoint location = [self positionInGlobalWindow:view];
    CGFloat kbHeight = [self keyboardHeight];
    CGFloat maxVisibleY = [[UIApplication sharedApplication] keyWindow].bounds.size.height - kbHeight;
    CGFloat moveY = 0.0;
    if (location.y > maxVisibleY) {
        moveY = location.y - maxVisibleY + view.bounds.size.height + 20;
    }
    if (moveY > 0) {
        [UIView animateWithDuration:.3f animations:^{
            UIView *viewToMove = [self findRootSuperView:view];
            CGRect frame = viewToMove.frame;
            frame.origin.y = frame.origin.y - moveY;
            viewToMove.frame = frame;
            
        }];
    }
    objc_setAssociatedObject(self, KEY_MOVE_SPACE, [NSNumber numberWithDouble:moveY], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)backToOriginalPlace:(UIView *)view {
    NSNumber *moveY = objc_getAssociatedObject(self, KEY_MOVE_SPACE);
    objc_setAssociatedObject(self, KEY_MOVE_SPACE, nil, OBJC_ASSOCIATION_ASSIGN);
    if (moveY) {
        CGFloat moveYVal = [moveY doubleValue];
        if (moveYVal > 0) {
            [UIView animateWithDuration:.3f animations:^{
                UIView *viewToMove = [self findRootSuperView:view];
                CGRect frame = viewToMove.frame;
                frame.origin.y = frame.origin.y + moveYVal;
                viewToMove.frame = frame;
            }];
        }
    }
}

@end
