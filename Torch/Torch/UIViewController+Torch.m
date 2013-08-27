//
//  UIViewController+Torch.m
//  Torch
//
//  Created by Whitman Yang on 8/22/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "UIViewController+Torch.h"
#import "TCViewController.h"

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
        [viewForTapToDismissKeyboard addGestureRecognizer:clickRecognizer];
    }
}

#pragma mark - editing view finish editing

static int START_EDIT_VIEW_TAG = 1900;
// tag for the last editing view, should dismiss keyboard when click
static int END_EDIT_VIEW_TAG = 1999;

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

- (UIBarButtonItem *) navBarRightItem {
    static UIBarButtonItem * navBarRightItem = nil;
    if (!navBarRightItem) {
        UIImage * image = [UIImage imageNamed:@"navbar_righticon.png"];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 33, 30);
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        // [btn addTarget:self action:@selector(testJump) forControlEvents:UIControlEventTouchUpInside];
        navBarRightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return navBarRightItem;
}

- (void) decorateNavItem:(UINavigationItem *)navItem needRightItem:(BOOL)flag {
    if (flag) {
        navItem.rightBarButtonItem = [self navBarRightItem];
    }
    navItem.backBarButtonItem.title = NSLocalizedString(@"Back", nil);
}

- (void) decorateNavBar {
    if (self.navigationController) {
        [self decorateNavItem:self.navigationItem needRightItem:YES];
    }
}

- (void) decorateNavBar:(UINavigationBar *)navBar needRightItem:(BOOL)flag {
    [UIViewController setNavbarBgImg:navBar];
    UINavigationItem * item = [[UINavigationItem alloc] init];
    [self decorateNavItem:item needRightItem:flag];
}



@end
