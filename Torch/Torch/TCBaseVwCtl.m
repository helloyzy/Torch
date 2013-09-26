//
// Created by Yang Whitman on 13-8-21.
// Copyright (c) 2013 Hershey. All rights reserved.
//
//


#import "TCBaseVwCtl.h"

@implementation TCBaseVwCtl

#pragma mark - view related

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerDismissKeyboardOnContainerView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerNotificationForTextFieldIfNecessary];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self removeNotificationForTextFieldIfNecessary];
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self viewFinishEditing:textField];
    return YES;
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    [self moveToVisibleIfNecessary:textField];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    [self backToOriginalPlaceIfNecessary:textField];
//}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return NO;
//}

@end