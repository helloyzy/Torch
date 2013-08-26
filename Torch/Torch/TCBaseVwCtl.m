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
    UIView * viewForTapToDismissKeyboard = [self viewForTapToDismissKeyboard];
    if (viewForTapToDismissKeyboard) {
        UITapGestureRecognizer * clickRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
        [clickRecognizer setNumberOfTapsRequired:1];
        [clickRecognizer setNumberOfTouchesRequired:1];
        [viewForTapToDismissKeyboard addGestureRecognizer:clickRecognizer];
    }
}

#pragma mark - defined protected methods

- (UIView *) viewForTapToDismissKeyboard {
    return nil;
}

#pragma mark - private methods

- (void) dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
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

- (void) handleEditingView:(UIView *) editingView {
    if (editingView.tag == END_EDIT_VIEW_TAG) {
        [self dismissKeyboard:nil];
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