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

#pragma mark - customized navigation bar

+ (void) setNavbarBgImg:(UINavigationBar *)navBar {
    // need a image sized 320 * 44 (or even bigger)
    UIImage * navBgImg = [UIImage imageNamed:@"navbar_bg.png"];
    [navBar setBackgroundImage:navBgImg forBarMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:navBgImg forBarMetrics:UIBarMetricsLandscapePhone];
    
    // block the bottom gray line
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, navBar.bounds.size.height - 4, navBar.bounds.size.width, 2)];
    bottomView.userInteractionEnabled = NO;
    bottomView.backgroundColor = [UIColor blackColor];
    [navBar addSubview:bottomView];
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
