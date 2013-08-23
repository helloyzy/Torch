//
//  UIViewController+Torch.h
//  Torch
//
//  Created by Whitman Yang on 8/22/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Torch)

- (void) decorateNavBar;
- (void) decorateNavBar:(UINavigationBar *)navBar needRightItem:(BOOL)flag;

+ (UINavigationController *) customNavCtr:(UIViewController *)rootVwCtl;

@end
