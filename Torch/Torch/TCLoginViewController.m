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
#import "TCLoginCredential.h"
#import "TCDBUtils.h"
#import "TCSvcUtils.h"

@interface TCLoginViewController () {
    BOOL syncDataFlag;
}

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
    lblDisclaim.text = [self localString:@"login.disclaimation"];
    
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
    [self jumpToMyDay];
    // [self _signIn];
#else
    if (txtUsername.text.length>0) {
        if ([HersheySSOUtils setKeychainWithUsername:txtUsername.text andPassword:txtPwd.text]) {
            [self _signIn];
        }
    }
#endif
}

//- (void)hideDelayed {
//    hideProgressIndicator();
//}

// invoked after credential info has been stored in local keychain
- (void)_signIn {
    [self setSharedLoginCredential];
    [TCDBUtils resetDB];
    [self syncData];
}

- (void)syncData {
    syncDataFlag = NO;
    [self.view setUserInteractionEnabled:NO];
    showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncData"]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self syncDataSuccess];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure];
        };
        [TCSvcUtils syncDataService:success failure:failure];
        
//        [NSThread sleepForTimeInterval:2];
//        [self syncDataFailure];
    });
}

- (void)syncDataSuccess {
    syncDataFlag = YES;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        hideProgressIndicator();
        showAlert([self localString:@"login.syncData.title"], [self localString:@"login.syncDataSuccess"], self);
    });
}

- (void)syncDataFailure {
    syncDataFlag = NO;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        hideProgressIndicator();
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:[self localString:@"login.syncData.title"]
                                                         message:[self localString:@"login.syncDataFailure"]
                                                        delegate:self
                                               cancelButtonTitle:[self localString:@"Cancel"]
                                               otherButtonTitles:[self localString:@"Retry"], nil];
        [alert show];
    });
}

- (void)setSharedLoginCredential {
    TCLoginCredential *credential = [TCLoginCredential sharedInstance];
//    credential.username = txtUsername.text;
//    credential.password = txtPwd.text;
    credential.username = @"HCTMM300";
    credential.password = @"Welcome1";
}

#pragma mark - alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (syncDataFlag) {
        [self jumpToMyDay];
    } else {
        if (buttonIndex == 1) { // click retry
            [self performSelector:@selector(syncData) withObject:nil afterDelay:.5];
        } else { // click cancel
            [self.view setUserInteractionEnabled:YES];
        }
    }
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
