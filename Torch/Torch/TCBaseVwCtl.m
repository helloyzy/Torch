//
// Created by Yang Whitman on 13-8-21.
// Copyright (c) 2013 Hershey. All rights reserved.
//
//


#import "TCBaseVwCtl.h"

@implementation TCBaseVwCtl

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerDismissKeyboardOnContainerView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerNotificationForKeyboardInfo];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self removeNotificationForKeyboardInfo];
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self viewFinishEditing:textField];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self moveToVisibleIfNecessary:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self backToOriginalPlace:textField];
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return NO;
//}

//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    NSLog(@"Did begin");
//}

@end