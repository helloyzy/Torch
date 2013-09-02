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

#import "TCMyDayController.h"
#import "TCRouteMapViewController.h"
#import "IIViewDeckController.h"

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
    btnSignIn.titleLabel.text = [self localString:@"login.signIn"];
    btnReadMore.titleLabel.text = [self localString:@"login.readMore"];
    
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
    [self jumpToMyDay];
}

#pragma mark - navigation between controllers

- (void)jumpToMyDay
{
    UIViewController* left = [[TCRouteMapViewController alloc] initWithNibName:@"TCRouteMapView" bundle:nil];
    UIViewController* center = [[TCMyDayController alloc] initWithNibName:@"TCRouteTableView" bundle:nil];
    IIViewDeckController * deckController = [[IIViewDeckController alloc] initWithCenterViewController:center leftViewController:left rightViewController:nil];
    // UINavigationController * navCtr = [UIViewController customNavCtr:deckController];
    
    UIViewController * rootVwCtl = [UIViewController rootDeckView:deckController];
    [self.view.window setRootViewController:rootVwCtl];
}


#pragma mark - override super

- (UIView *) viewForTapToDismissKeyboard {
    return self.view;
}

@end
