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

#define LOGIN_AUTHENTICATION_ERROR -1012
#define NO_NETWORK_ERROR -1009

typedef void (^login_retry_block)(void);

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
    // lblDisclaim.text = [self localString:@"login.disclaimation"];
    NSString * fileName = [self localString:@"disclaimation.fileName"];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSString * content = [[NSString alloc]initWithContentsOfFile:filePath  encoding:NSUTF8StringEncoding error:nil];
    lblDisclaim.text = content;
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
        [self _signIn];
    }
#endif
}

//- (void)hideDelayed {
//    hideProgressIndicator();
//}

// invoked after credential info has been stored in local keychain
- (void)_signIn {
    //This now sets to the credentials entered on the screen
    [self setSharedLoginCredential];
    [TCDBUtils resetDB];
    [self syncData];
    //!!!:Since the services are not returing data, instead of syncing on login, we now go straight to the myday screen
    //[self jumpToMyDay];
}

//This beins the sync data process. If we get a 202 we try again, if we fail we go to the failure handler, if we are successful we fetch the mexico data
- (void)syncData {
    syncDataFlag = NO;
    [self.view setUserInteractionEnabled:NO];
    showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncData.fetch"]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self syncDataSuccess:operation];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure:operation withError:error];
        };
        [TCSvcUtils syncDataService:success failure:failure];
    });
}

//Success Handler for initial fetch. If we get a 202, we try again after 5 seconds. Otherwise, we go on and sync the mexican specific data
- (void)syncDataSuccess:(RKObjectRequestOperation *)operation {
    login_retry_block retryBlock = ^(void) {
        [self syncData];
    };
    if ([self checkSuccessResponseCode:operation callback:retryBlock]) {
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
        showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncData.fetchMexico"]);
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self mexicoSyncSuccess:operation];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure: operation withError:error];
        };
        [TCSvcUtils fetchMexicoDataService:success failure:failure];
    });

}

//Handles the sucess for the mexico specfic data. If 202, retry in 5 seconds, otherwise sync the order request data
- (void)mexicoSyncSuccess:(RKObjectRequestOperation *)operation{
    login_retry_block retryBlock = ^(void) {
        [self syncMexicoData];
    };
    if ([self checkSuccessResponseCode:operation callback:retryBlock]) {
        [self syncProductData];
    }
}

//Handles the syncing of the order request data. If sucess, check for 202, if failure, display failure message for the failure.
- (void)syncProductData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncData.product"]);
        TC_SVC_BLOCK_SUCCESS success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            [self productSyncSuccess:operation];
        };
        TC_SVC_BLOCK_FAILURE failure = ^(RKObjectRequestOperation * operation, NSError * error) {
            [self syncDataFailure:operation withError:error];
        };        
        [TCSvcUtils syncProductData:success failure:failure];
    });

}

//Handles the sucess of the orderRequest service. If we get a 202, wait 5 seconds and retry. Otherwise, jump to the my day screen
- (void)productSyncSuccess:(RKObjectRequestOperation *)operation{
    login_retry_block retryBlock = ^(void) {
        [self syncProductData];
    };
    if ([self checkSuccessResponseCode:operation callback:retryBlock]) {
        syncDataFlag = YES;
        hideProgressIndicator();
        [HersheySSOUtils setKeychainWithUsername:txtUsername.text andPassword:txtPwd.text];
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:[self localString:@"login.syncData.title"]
                                                         message:[self localString:@"login.syncDataSuccess"]
                                                        delegate:self
                                               cancelButtonTitle:[self localString:@"OK"]
                                               otherButtonTitles:nil];
        [alert show];
    }
}

- (BOOL)checkSuccessResponseCode:(RKObjectRequestOperation *)operation callback:(login_retry_block)retryBlock{
    if (operation.HTTPRequestOperation.response.statusCode == 202) {
        showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncDataResponse202"]);
        [self loginRetry:retryBlock];
        return NO;
    } else if (operation.HTTPRequestOperation.response.statusCode == 204) {
        showProgressIndicator([self localString:@"login.syncData.title"],[self localString:@"login.syncDataResponse204"]);
        [self loginRetry:retryBlock];
        return NO;
    }
    return YES;
}

- (void)loginRetry:(login_retry_block)retryBlock {
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), retryBlock);
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
        // NSLog(@"status code:%d", operation.HTTPRequestOperation.response.statusCode);
        NSLog(@"error code:%d", error.code);
        switch (operation.HTTPRequestOperation.response.statusCode) {
            case 400:
                [alert setMessage:[self localString:@"login.syncDataResponse400"]];
                break;
            case 401:
                //TODO: Have the user authenticate again before retrying
                [alert setMessage:[self localString:@"login.syncDataResponse401"]];
                break;
            case 403:
                [alert setMessage:[self localString:@"login.syncDataResponse403"]];
                break;
            case 405:
                [alert setMessage:[self localString:@"login.syncDataResponse405"]];
                break;
            case 408:
                [alert setMessage:[self localString:@"login.syncDataResponse408"]];
                break;
            case 500:
                [alert setMessage:[self localString:@"login.syncDataResponse500"]];
                break;
            case 501:
                [alert setMessage:[self localString:@"login.syncDataResponse501"]];
                break;
            case 503:
                [alert setMessage:[self localString:@"login.syncDataResponse503"]];
                break;
            default:
                break;
        }
        if (error.code == LOGIN_AUTHENTICATION_ERROR) {
            [alert setMessage:[self localString:@"login.syncData.error.auth"]];
        } else if (error.code == NO_NETWORK_ERROR) {
            [alert setMessage:[self localString:@"login.syncData.error.nonetwork"]];
        }
        
        [alert show];
    });
}

- (void)setSharedLoginCredential {
    TCLoginCredential *credential = [TCLoginCredential sharedInstance];
    credential.username = txtUsername.text;
    credential.password = txtPwd.text;
    //credential.username = @"HCTMM300";
   // credential.password = @"Welcome1";
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
