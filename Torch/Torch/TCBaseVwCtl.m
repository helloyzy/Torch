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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self viewFinishEditing:textField];
    return YES;
}

@end