//
//  TCProfileController.m
//  SingleView
//
//  Created by Whitman Yang on 8/26/13.
//  Copyright (c) 2013 Whitman Yang. All rights reserved.
//

#import "TCProfileController.h"
#import "YIInnerShadowView.h"
#import "GraphicsUtils.h"
#import "IIViewDeckController.h"
#import "TCDataStatusController.h"
#import "TCUtils.h"
#import "TCLoginViewController.h"
#import "TCSysRes.h"
#import "Order.h";

@interface TCProfileController ()

@end

@implementation TCProfileController

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
//    vwLeftShadow.bounds = CGRectMake(0, 0, 3, self.view.bounds.size.height);
//    vwLeftShadow.bounds = CGRectMake(0, 0, 15, self.view.bounds.size.height);
//    vwLeftShadow.backgroundColor = [UIColor clearColor];
//    vwLeftShadow.shadowMask = YIInnerShadowMaskLeft;
//    vwLeftShadow.shadowColor = [UIColor darkGrayColor];
//    vwLeftShadow.shadowRadius = 10;
    vwLeftShadow.hidden = YES;
    
    lblName.font = TCFont_HNLTComBd(17);
    lblUserDetailed.font = TCFont_HNLTComMd(12);
    lblMyDay.font = TCFont_HNLTComMd(17);
    lblMyDay.text = [self localString:@"profile.myday"];
    lblDataStatus.font = TCFont_HNLTComMd(17);
    lblDataStatus.text = [self localString:@"profile.datastatus"];
    lblLogout.font = TCFont_HNLTComMd(17);
    lblLogout.text = [self localString:@"profile.logout"];

    [self setupClickRecognizerForView:imgVwMyDay action:@selector(toMyDay)];
    [self setupClickRecognizerForView:imgVwDataStatus action:@selector(toDataStatus)];
    [self setupClickRecognizerForView:imgVwLogout action:@selector(logout)];
}

- (void)setupClickRecognizerForView:(UIView *)view action:(SEL)action{
    UITapGestureRecognizer * clickRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [clickRecognizer setNumberOfTapsRequired:1];
    [clickRecognizer setNumberOfTouchesRequired:1];
    clickRecognizer.cancelsTouchesInView = NO;
    [view setUserInteractionEnabled:YES];
    [view addGestureRecognizer:clickRecognizer];
}

- (void)toMyDay {
    IIViewDeckController * deckCtl = self.viewDeckController;
    if (deckCtl) {
        [deckCtl toggleRightViewAnimated:YES];
        UINavigationController *navController = (UINavigationController *)deckCtl.centerController;
        if (navController) {
            [navController popToRootViewControllerAnimated:YES];
        }
    }
}

- (void)toDataStatus {
    IIViewDeckController * deckCtl = self.viewDeckController;
    if (deckCtl) {
        [deckCtl toggleRightViewAnimated:YES];
        UINavigationController *navController = (UINavigationController *)deckCtl.centerController;
        if (navController) {
            [navController popToRootViewControllerAnimated:NO];
            TCDataStatusController * dataController = [[TCDataStatusController alloc]init];
            [navController pushViewController:dataController animated:YES];
        }
    }
}

- (void)logout {
    if ([Order activeOrderCount] > 0) {
        showAlert(nil, [self localString:@"profile.logout.warning"], self);
        return;
    } else {
        [self toLogin];
    }   
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // alert view is shown in a window different from our main window;
    [self toLogin];
}

- (void)toLogin {
    UIWindow *mainWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    mainWindow.rootViewController = [[TCLoginViewController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpToDataStatus:(id)sender {
    [self toDataStatus];
}

- (IBAction)logoutAction:(id)sender {
    [self logout];
}

@end
