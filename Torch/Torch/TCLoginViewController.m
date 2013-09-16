//
//  TCLoginViewController.m
//  Torch
//
//  Created by Whitman Yang on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCLoginViewController.h"
#import "TCDisclaimerVwCtl.h"
#import <QuartzCore/QuartzCore.h>
#import "YIInnerShadowView.h"
#import "UIViewController+Torch.h"
#import "HersheySSOUtils.h"
#import "TCUtils.h"

@interface TCLoginViewController ()

@end

@implementation TCLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lblUsername.text = [self localString:@"login.username"];
    lblPwd.text = [self localString:@"login.password"];
    txtUsername.placeholder =[self localString:@"login.username.placeholder"];
    txtPwd.placeholder = [self localString:@"login.password"];
    [btnSignIn setTitle:[self localString:@"login.signIn"] forState:UIControlStateNormal];
    [btnReadMore setTitle:[self localString:@"login.readMore"] forState:UIControlStateNormal];
    
    [self initTextFields];
}

- (void)addInnerShadow:(YIInnerShadowView *) view {
    view.shadowMask = YIInnerShadowMaskTop;
    view.shadowColor = [UIColor blackColor];
    view.shadowRadius = 5;
    view.layer.borderColor = [[UIColor colorWithRed:97/255.0f green:116/255.0f blue:142/255.0f alpha:1] CGColor];
    [view.layer setCornerRadius:8];
    [view.layer setBorderWidth:2.5];
}

- (void)initTextFields {
    [self addInnerShadow:bgVwUsername];
    [self addInnerShadow:bgVwPwd];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayDisclaimView:(id)sender {
    TCDisclaimerVwCtl * disclaimerVwCtl = [[TCDisclaimerVwCtl alloc] init];
    [self presentViewController:disclaimerVwCtl animated:YES completion:nil];
    
}

- (IBAction)signIn:(id)sender {
#ifdef TC_DEBUG
    if (txtUsername.text.length>0) {
        if ([HersheySSOUtils setKeychainWithUsername:txtUsername.text andPassword:txtPwd.text]) {
            [self jumpToMyDay];
        }
    }
#else
    [self jumpToMyDay];
#endif
}

#pragma mark - navigation between controllers

- (void)jumpToMyDay
{
    [self.view.window setRootViewController:[UIViewController myDayDeckAsRoot]];
}


#pragma mark - override super

- (UIView *) viewForTapToDismissKeyboard {
    return self.view;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [super textFieldShouldReturn:textField];
    if (textField.returnKeyType == UIReturnKeyDone) {
        [self signIn:nil];
    }
    return YES;
}

@end
