//
//  UIViewController+Torch.h
//  Torch
//
//  Created by Whitman Yang on 8/22/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Torch)

// section for dismiss keyboard 
- (UIView *) viewForTapToDismissKeyboard;
- (void) registerDismissKeyboardOnContainerView;

// section for handle editing view/control
- (void) viewFinishEditing:(UIView *)editingView;

// section for customize navigation bar -- start
- (void) decorateNavBar;
- (void) decorateNavBar:(UINavigationBar *)navBar needRightItem:(BOOL)flag;

+ (UINavigationController *) customNavCtr:(UIViewController *)rootVwCtl;
// section for customize navigation bar -- end

@end
