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
    
    CALayer* btnLayer = [btnSignin layer];
    [btnLayer setCornerRadius:8.0f];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setBorderWidth:1.0f];
    
    CALayer * txtLayer = [txtUsername layer];
    [txtLayer setCornerRadius:8.0f];
    [txtLayer setMasksToBounds:YES];
    [txtLayer setBorderWidth:2.0f];
    UIColor * borderColor = [UIColor colorWithRed:97/255.0f green:116/255.0f blue:142/255.0f alpha:1];
    // UIColor grayColor
    [txtLayer setBorderColor:[borderColor CGColor]];
    txtLayer.shadowColor = [[UIColor blackColor] CGColor];
    txtLayer.shadowOpacity = 0.8f;
    txtLayer.shadowOffset = CGSizeMake(0, 3);
    
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

@end
