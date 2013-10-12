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
#import <RestKit/RestKit.h>


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
    txtUsername.placeholder =  @""; // [self localString:@"login.username.placeholder"];
    txtPwd.placeholder = @""; // [self localString:@"login.password"];
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
    //[self jumpToMyDay];
    [self _signIn];
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

//This beins the sync data process. If we get a 202 we try again, if we fail we go to the failure handler, if we are successful we fetch the mexico data
- (void)syncData {
    syncDataFlag = NO;
    [self.view setUserInteractionEnabled:NO];
    showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncData"]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self syncDataSuccess:operation];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure:operation withError:error];
        };
        [TCSvcUtils syncDataService:success failure:failure];
        
//        [NSThread sleepForTimeInterval:2];
//        [self syncDataFailure];
    });
}

//Success Handler for initial fetch. If we get a 202, we try again after 5 seconds. Otherwise, we go on and sync the mexican specific data
- (void)syncDataSuccess:(RKObjectRequestOperation *)operation {
    syncDataFlag = YES;
    if (operation.HTTPRequestOperation.response.statusCode == 202) {
        //TODO: Change the syncDataService call to be able to customize the header with "Refresh:True" values if we need to refesh the cache after a 202 response.
        double delayInSeconds = 5.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self syncData];
        });
    }
    else{
        
        [self syncMexicoData];
    }
    
    
//Instead of hiding the progress indicator, after the first service is sucessful I'm calling the FetchMexico service
//    dispatch_async(dispatch_get_main_queue(), ^(void) {
//        hideProgressIndicator();
//        showAlert([self localString:@"login.syncData.title"], [self localString:@"login.syncDataSuccess"], self);
//    });
}

//Calls the service to sync the mexican specifc data. If that fails, show the failure alert view
- (void)syncMexicoData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self mexicoSyncSuccess:operation];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure: operation withError:error];
        };
        [TCSvcUtils fetchMexicoDataService:success failure:failure];
        
        //        [NSThread sleepForTimeInterval:2];
        //        [self syncDataFailure];
    });

}

//Handles the sucess for the mexico specfic data. If 202, retry in 5 seconds, otherwise sync the order request data
- (void)mexicoSyncSuccess:(RKObjectRequestOperation *)operation{
    syncDataFlag = YES;
    if (operation.HTTPRequestOperation.response.statusCode == 202) {
        //TODO: Change the syncDataService call to be able to customize the header with "Refresh:True" values if we need to refesh the cache after a 202 response.
        double delayInSeconds = 5.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self syncMexicoData];
        });
    }
    else{
        [self syncOrderRequestData];
        
    }
}

//Handles the syncing of the order request data. If sucess, check for 202, if failure, display failure message for the failure.
- (void)syncOrderRequestData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self orderRequestSyncSuccess:operation];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure:operation withError:error];
        };
        //[TCSvcUtils fetchMexicoDataService:success failure:failure];
        
        [TCSvcUtils orderRequestService:success failure:failure];
        
        //        [NSThread sleepForTimeInterval:2];
        //        [self syncDataFailure];
    });

}

//Handles the sucess of the orderRequest service. If we get a 202, wait 5 seconds and retry. Otherwise, jump to the my day screen
- (void)orderRequestSyncSuccess:(RKObjectRequestOperation *)operation{
    syncDataFlag = YES;
    if (operation.HTTPRequestOperation.response.statusCode == 202) {
        //TODO: Change the syncDataService call to be able to customize the header with "Refresh:True" values if we need to refesh the cache after a 202 response.
        //If we get a 202 response, wait 5 seconds and try again
        double delayInSeconds = 5.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self syncMexicoData];
        });
    }
    else{
        [self jumpToMyDay];
        
    }
}

//Handles faliure messages for syncs. These are tied to the HTTP response codes
//400: Bad Request
//401: Unauthorized (we should change this handler to have them log in again instead of just re-syncing
//405: Method Not Supported (This should not happen in production)
//500: Internal Server Error
- (void)syncDataFailure: (RKObjectRequestOperation *)operation withError:(NSError *)error {
    NSLog(@"Handling Data Sync Failure for operation: %@ with error: %@", operation, error);
    syncDataFlag = NO;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        hideProgressIndicator();
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:[self localString:@"login.syncData.title"]
                                                         message:[self localString:@"login.syncDataFailure"]
                                                        delegate:self
                                               cancelButtonTitle:[self localString:@"Cancel"]
                                               otherButtonTitles:[self localString:@"Retry"], nil];
        switch (operation.HTTPRequestOperation.response.statusCode) {
            case 400:
                [alert setTitle:@"Bad Request"];
                [alert setMessage:@"Unfortunately, the server didn't understand our request. Please try again"];
                break;
            case 401:
                //TODO: Have the user authenticate again before retrying
                [alert setTitle:@"Unauthorized"];
                [alert setMessage:@"We're sorry, we are unable to authenticate you. Please try again"];
                break;
            case 405:
                [alert setTitle:@"Not Allowed"];
                [alert setMessage:@"Unfortunately, the server does not allow the method we tried. Please try again"];
                break;
            case 500:
                [alert setTitle:@"Server Error"];
                [alert setMessage:@"Unfortunately, the server had an internal error while processing your request. Please try again"];
            default:
                break;
        }
        
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
