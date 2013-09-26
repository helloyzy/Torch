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

// static CGFloat TEXTFIELD_MOVESPACE = 0.0;
static bool TEXTFIELD_MOVEBACK_FLAG = YES;

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
    if (nextView) {
        if ([self isViewAllVisible:nextView]) {
            if ([self shouldRegisterNotificationForTextField]) {
                TEXTFIELD_MOVEBACK_FLAG = NO;
            }
            [curEditingView resignFirstResponder];
            [nextView becomeFirstResponder];
            return;
        }
//        if (! [self isViewAllVisible:nextView]) {
//            [self scrollToVisible:nextView];
//            [curEditingView resignFirstResponder];
//            [self performSelector:@selector(switchToNextEditingView:) withObject:curEditingView afterDelay:.3f];
//            return;
//        }
    }
    [curEditingView resignFirstResponder];
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

/**
static CGFloat _keyBoardHeight;
- (BOOL)shouldObserveKeyboardInfo {
    return NO;
}
- (void)registerNotificationForKeyboardInfoIfNecessary {
    if (! [self shouldObserveKeyboardInfo]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}
- (void)removeNotificationForKeyboardInfoIfNecessary {
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
 - (CGPoint)positionInGlobalWindow:(UIView *)view includeWindow:(BOOL)flag {
 CGPoint result = view.frame.origin;
 UIView *superView = view.superview;
 while (superView) {
 if ((! flag) && [superView isKindOfClass:[UIWindow class]]) { // not calculate position in Window
 break;
 }
 CGPoint temp = superView.frame.origin;
 result.x = result.x + temp.x;
 result.y = result.y + temp.y;
 if ([superView isKindOfClass:[UIScrollView class]]) {
 UIScrollView *scrollVw = (UIScrollView *)superView;
 // subtract the offset
 result.x = result.x - scrollVw.contentOffset.x;
 result.y = result.y - scrollVw.contentOffset.y;
 // NSLog(@"When in %@, the position %f, %f", [superView class], result.x, result.y);
 // NSLog(@"ContentOffSet x %f, y %f", scrollVw.contentOffset.x, scrollVw.contentOffset.y);
 }
 superView = superView.superview;
 }
 return result;
 }
 
 - (CGPoint)positionInScreen:(UIView *)view {
 CGPoint result = [self positionInWindow:view];
 UIWindow *window = [[UIApplication sharedApplication] keyWindow];
 result.x = result.x + window.frame.origin.x;
 result.y = result.y + window.frame.origin.y;
 // NSLog(@"The position relative to screen is %f, %f", result.x, result.y);
 return result;
 }
 
 - (CGPoint)positionInWindow:(UIView *)view {
 CGPoint result = [view convertPoint:view.bounds.origin toView:[[UIApplication sharedApplication] keyWindow]];
 // NSLog(@"The position relative to window is %f, %f", result.x, result.y);
 return result;
 }
 
 - (CGFloat)screenHeight {
 return [UIScreen mainScreen].bounds.size.height;
 }
 
 */

#define KEYBOARD_HEIGHT_LANDSCAPE 140.0
#define KEYBOARD_HEIGHT_PORTRAIT 216.0

- (BOOL)shouldRegisterNotificationForTextField {
    return NO;
}

- (void)registerNotificationForTextFieldIfNecessary {
    if (! [self shouldRegisterNotificationForTextField]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTextFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTextFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)removeNotificationForTextFieldIfNecessary {
    if (! [self shouldRegisterNotificationForTextField]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
    // [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)onTextFieldDidBeginEditing:(NSNotification *)aNotification {
    UITextField *textField = [aNotification object];
    [self moveToVisibleIfNecessary:textField];
}

- (void)onTextFieldDidEndEditing:(NSNotification *)aNotification {
    UITextField *textField = [aNotification object];
    [self backToOriginalPlaceIfNecessary:textField];
}

- (CGFloat)keyboardHeight {
    if (isDeviceOrientationLandscape()) {
        return KEYBOARD_HEIGHT_LANDSCAPE;
    } else {
        return KEYBOARD_HEIGHT_PORTRAIT;
    }
}

- (UIView *)superViewThatMove:(UIView *)view {
    return [[UIApplication sharedApplication] keyWindow];
}

- (BOOL)isViewAllVisible:(UIView *)view {
    UIView *sMoveView = [self superViewThatMove:view];
    CGPoint location = [view convertPoint:view.bounds.origin toView:sMoveView];
    // NSLog(@"View position is %f", locationInGlobalWindow.y + view.bounds.size.height);
    return location.y + view.bounds.size.height < sMoveView.bounds.size.height;
}

- (void)scrollToVisible:(UIView *)view {
    UIView *sView = view.superview;
    while(! [sView isKindOfClass:[UIScrollView class]]) {
        sView = sView.superview;
    }
    if (sView) {
        UIScrollView *sScrollVw = (UIScrollView *)sView;
        CGPoint relativeLoc = [view convertPoint:view.bounds.origin toView:sScrollVw];
        CGPoint offsetPoint = CGPointMake(0, relativeLoc.y + view.bounds.size.height - sScrollVw.bounds.size.height);
        [sScrollVw setContentOffset:offsetPoint animated:NO];
    } else {
        NSLog(@"Error! no scroll view as super view!");
    }
}

- (void)moveToVisibleIfNecessary:(UIView *)view {
    UIView * sMoveView = [self superViewThatMove:view];
    if (! [self isViewAllVisible:view]) {
        [self scrollToVisible:view];
    }
    CGFloat kbHeight = [self keyboardHeight];
    CGFloat maxVisibleY = sMoveView.bounds.size.height - kbHeight - view.bounds.size.height;
    CGFloat relativeLocY = [view convertPoint:view.bounds.origin toView:sMoveView].y;
    if (relativeLocY > maxVisibleY) {
        CGFloat y = relativeLocY - maxVisibleY;
        CGRect newFrame = IB_RECT_WITH_Y(sMoveView.frame, -y);
        [UIView animateWithDuration:.3f animations:^{
            sMoveView.frame = newFrame;
        }];
    }
    TEXTFIELD_MOVEBACK_FLAG = YES;
}

- (void)backToOriginalPlaceIfNecessary:(UIView *)view {
    if (TEXTFIELD_MOVEBACK_FLAG) {
        UIView * sMoveView = [self superViewThatMove:view];
        CGRect newFrame = IB_RECT_WITH_Y(sMoveView.frame, 0);
        [UIView animateWithDuration:.3f animations:^{
            sMoveView.frame = newFrame;
        }];
    }
    // reset
    TEXTFIELD_MOVEBACK_FLAG = YES;
}

@end
