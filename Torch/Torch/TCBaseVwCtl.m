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
    /**
    if ([self shouldRegisterDismissKeyboardOnClick] && [self.view isKindOfClass:[UIControl class]]) {
        [((UIControl *) self.view) addTarget:self action:@selector(backgroundTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
     */
}

- (BOOL)shouldRegisterDismissKeyboardOnClick {
    return YES;
}

- (IBAction) backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // [textField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}

@end