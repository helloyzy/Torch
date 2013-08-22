//
// Created by Yang Whitman on 13-8-21.
// Copyright (c) 2013 Hershey. All rights reserved.
//
//


#import "TCBaseVwCtl.h"


@implementation TCBaseVwCtl

static int START_EDIT_VIEW_TAG = 1900;
// tag for the last editing view, should dismiss keyboard when click
static int END_EDIT_VIEW_TAG = 1999;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self bgViewForEvents] && [self shouldRegisterDismissKeyboardOnClick]) {
        UIView * view = [self bgViewForEvents];
        UITapGestureRecognizer * clickRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard:)];
        [clickRecognizer setNumberOfTapsRequired:1];
        [clickRecognizer setNumberOfTouchesRequired:1];
        [view addGestureRecognizer:clickRecognizer];
    }
}

#pragma mark - defined protected methods

- (UIView *) bgViewForEvents {
    return nil;
}

- (BOOL) shouldRegisterDismissKeyboardOnClick {
    return YES;
}

#pragma mark - private methods

- (void) dismissKeyBoard:(id)sender {
    [self.view endEditing:YES];
}

- (UIView *) findNextEditingView:(UIView *) curEditingView {
    UIView * result = nil;
    if (curEditingView.tag >= START_EDIT_VIEW_TAG && curEditingView.tag < END_EDIT_VIEW_TAG) {
        result = [curEditingView.superview viewWithTag:(curEditingView.tag + 1)];
        if (!result) {
            // find the last editing control
            result = [curEditingView.superview viewWithTag:END_EDIT_VIEW_TAG];
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

- (void) handleEditingView:(UIView *) editingView {
    if (editingView.tag == END_EDIT_VIEW_TAG) {
        [self dismissKeyBoard:nil];
        return;
    } else {
        [self switchToNextEditingView:editingView];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self handleEditingView:textField];
    return YES;
}

@end