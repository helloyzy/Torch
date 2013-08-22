//
//  UIViewController+Torch.m
//  Torch
//
//  Created by Whitman Yang on 8/22/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "UIViewController+Torch.h"

@implementation UIViewController (Torch)

#pragma mark - customized navigation bar

+ (UINavigationController *) customNavCtr:(UIViewController *)rootVwCtl {
    UINavigationController * result = nil;
    if (rootVwCtl) {
        result = [[UINavigationController alloc] initWithRootViewController:rootVwCtl];
    } else {
        result = [[UINavigationController alloc] init];
    }
    UIImage * navBgImg = [UIImage imageNamed:@"navbar_bg.png"];
    [result.navigationBar setBackgroundImage:navBgImg forBarMetrics:UIBarMetricsDefault];
    [result.navigationBar setBackgroundImage:navBgImg forBarMetrics:UIBarMetricsLandscapePhone];
    return result;
}

+ (UIImageView *) navBarTitleView {
    static UIImageView * navBarTitleView = nil;
    if (!navBarTitleView) {
        UIImage * image = [UIImage imageNamed:@"HersheysLogo.png"];
        navBarTitleView = [[UIImageView alloc] initWithImage:image];
    }
    return navBarTitleView;
}

+ (UIBarButtonItem *) navBarRightItem {
    static UIBarButtonItem * navBarRightItem = nil;
    if (!navBarRightItem) {
        UIImage * image = [UIImage imageNamed:@"navbar_righticon.png"];
        navBarRightItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleBordered target:nil action:nil];
    }
    return navBarRightItem;
}

- (void) decorateNavBar {
    if (self.navigationController) {
        self.navigationItem.titleView = [UIViewController navBarTitleView];
        self.navigationItem.rightBarButtonItem = [UIViewController navBarRightItem];
        self.navigationItem.backBarButtonItem.title = @"Back";
    }
}



@end
