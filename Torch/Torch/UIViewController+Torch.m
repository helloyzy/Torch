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
#import "TCSysRes.h"
#import <IBFunctions.h>
#import <objc/runtime.h>
#import "TCStoreHomeView.h"
#import "Store.h"

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
    if (nextView && [self isViewAllVisible:nextView]) {
        [nextView becomeFirstResponder];
        return;
    }
    [curEditingView resignFirstResponder];
}


#pragma mark - customized navigation bar

#define JUMP_BTN_TAG 101

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
    [jump addTarget:self action:@selector(jumpToCallInProgress:) forControlEvents:UIControlEventTouchUpInside];
    jump.hidden = YES;
    jump.tag = JUMP_BTN_TAG;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMyDayWillShow:) name:MYDAY_WILLAPPEAR_NOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMyDayWillHide:) name:MYDAY_WILLDISAPPEAR_NOTIFICATION object:nil];
    [navBar addSubview:jump];
//    UIView * bottomSeparator = [[UIView alloc] initWithFrame:CGRectMake(0, navBar.bounds.size.height - 1, navBar.bounds.size.width, 1)];
//    bottomSeparator.userInteractionEnabled = NO;
//    bottomSeparator.backgroundColor = [UIColor colorWithRed:134/255.0f green:134/255.0f blue:134/255.0f alpha:1];
//    [navBar addSubview:bottomSeparator];

}

+ (UINavigationController *)findGlobalNavController {
    UIViewController *root = WINDOW().rootViewController;
    if ([root isKindOfClass:[IIViewDeckController class]]) {
        IIViewDeckController *rootDeck = (IIViewDeckController *)root;
        return (UINavigationController *)rootDeck.centerController;
    }
    return nil;
}

+ (UIButton *)findJumpBtn {
    UINavigationBar *bar = [self findGlobalNavController].navigationBar;
    return (UIButton *)[bar viewWithTag:JUMP_BTN_TAG];
}

+ (void)onMyDayWillShow:(NSNotification *)noti {
    if (storeInCall()) {
        [self findJumpBtn].hidden = NO;
    }
}

+ (void)onMyDayWillHide:(NSNotification *)noti {
    [self findJumpBtn].hidden = YES;
}

+ (void)jumpToCallInProgress:(id)sender {
    Store *store = storeInCall();
    if (store) {
        UINavigationController *nav = [self findGlobalNavController];
        [nav popToRootViewControllerAnimated:NO];
        TCStoreHomeView *controller = [[TCStoreHomeView alloc] init];
        controller.currentStore = store;
        controller.currentIndex =  store.sequenceNum;
        [nav pushViewController:controller animated:YES];
    }
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

#define KEYBOARD_HEIGHT_LANDSCAPE 140.0
#define KEYBOARD_HEIGHT_PORTRAIT 216.0

static UITextField *CURRENT_EDITING_TEXTFIELD = nil;

- (BOOL)shouldRegisterNotificationForTextField {
    return NO;
}

- (void)registerNotificationForTextFieldIfNecessary {
    if (! [self shouldRegisterNotificationForTextField]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTextFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)removeNotificationForTextFieldIfNecessary {
    if (! [self shouldRegisterNotificationForTextField]) {
        return;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)onTextFieldDidBeginEditing:(NSNotification *)aNotification {
    UITextField *textField = [aNotification object];
    CURRENT_EDITING_TEXTFIELD = textField;
    [self moveToVisibleIfNecessary:textField];
}

- (void)onKeyboardWillHide:(NSNotification *)aNotification {
    if (CURRENT_EDITING_TEXTFIELD) {
        [self backToOriginalPlaceIfNecessary:CURRENT_EDITING_TEXTFIELD];
        CURRENT_EDITING_TEXTFIELD = nil;
    }
}

- (CGFloat)keyboardHeight {
    if (isDeviceOrientationLandscape()) {
        return KEYBOARD_HEIGHT_LANDSCAPE;
    } else {
        return KEYBOARD_HEIGHT_PORTRAIT;
    }
}

- (UIView *)superViewThatMove:(UIView *)view {
    // return [[UIApplication sharedApplication] keyWindow];
    // find the first scroll view
    UIView *superVw = view.superview;
    while (superVw) {
        if ([superVw isKindOfClass:[UIScrollView class]]) {
            return superVw;
        }
        superVw = superVw.superview;
    }
    NSLog(@"Error, cannot find a super view which fits in moving!");
    return nil;
}

- (BOOL)isViewAllVisible:(UIView *)view {
    UIScrollView *sMoveView = (UIScrollView *)[self superViewThatMove:view];
    if (!sMoveView) {
        return NO;
    }
    CGPoint location = [view convertPoint:view.bounds.origin toView:sMoveView];
    return location.y + view.bounds.size.height < sMoveView.contentOffset.y + sMoveView.bounds.size.height;
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
    UIScrollView * sMoveView = (UIScrollView *)[self superViewThatMove:view];
    if (!sMoveView) {
        return;
    }
    // visible area (in Window) should be from 0 to (Window.height - keyboard.height)
    // CGFloat relMinY_Visible = [WINDOW() convertPoint:CGPointMake(0, 0) toView:sMoveView].y;
    CGFloat relMinY_Visible = sMoveView.contentOffset.y;
    CGFloat kbHeight = [self keyboardHeight];
    CGFloat maxY = WINDOW_HEIGHT() - kbHeight - VIEW_B_H(view); // in window coordinates
    CGFloat relMaxY_Visible = [WINDOW() convertPoint:CGPointMake(0, maxY) toView:sMoveView].y;
    CGFloat relY = [view convertPoint:view.bounds.origin toView:sMoveView].y;
    CGFloat move = 0;
    if (relY > relMaxY_Visible) {
        move = relY - relMaxY_Visible;
        CGSize newSize = CGSizeMake(sMoveView.contentSize.width, sMoveView.contentSize.height + move);
        sMoveView.contentSize = newSize;
    } else if (relY < relMinY_Visible) {
        move = relY - relMinY_Visible;
    }
    CGPoint newOffset = CGPointMake(sMoveView.contentOffset.x, sMoveView.contentOffset.y + move);
    [sMoveView setContentOffset:newOffset animated:YES];
//    if (! [self isViewAllVisible:view]) {
//        [self scrollToVisible:view];
//    }
//    CGFloat kbHeight = [self keyboardHeight];
//    CGFloat maxVisibleY = sMoveView.bounds.size.height - kbHeight - view.bounds.size.height;
//    CGFloat relativeLocY = [view convertPoint:view.bounds.origin toView:sMoveView].y;
//    CGFloat y = 0;
//    if (relativeLocY > maxVisibleY) {
//        y = relativeLocY - maxVisibleY;
//    }
//    CGRect newFrame = IB_RECT_WITH_Y(sMoveView.frame, -y);
//    [UIView animateWithDuration:.3f animations:^{
//        sMoveView.frame = newFrame;
//    }];
}

- (void)backToOriginalPlaceIfNecessary:(UIView *)view {
    UIScrollView * sMoveView = (UIScrollView *)[self superViewThatMove:view];
    if (!sMoveView) {
        return;
    }
    CGFloat contentHeight = sMoveView.contentSize.height;
    CGSize fitSize = [sMoveView sizeThatFits:sMoveView.contentSize];
    CGFloat fitSizeHeight = fitSize.height;
    if (contentHeight > fitSizeHeight) {
        CGFloat maxOffsetY = fitSizeHeight - VIEW_B_H(sMoveView);
        if (sMoveView.contentOffset.y > maxOffsetY) {
            [sMoveView setContentOffset:CGPointMake(sMoveView.contentOffset.x, maxOffsetY) animated:YES];
        }
        [sMoveView setContentSize:fitSize];
    }
    
//    CGRect newFrame = IB_RECT_WITH_Y(sMoveView.frame, 0);
//    [UIView animateWithDuration:.3f animations:^{
//        sMoveView.frame = newFrame;
//    }];
}

@end
