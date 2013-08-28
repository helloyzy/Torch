//
//  TCDeckViewCtl.m
//  Torch
//
//  Created by Whitman Yang on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCDeckViewCtl.h"
#import "UIViewController+Torch.h"

@interface TCDeckViewCtl ()

@end

@implementation TCDeckViewCtl

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
	[self decorateNavBar];
    self.panningMode = IIViewDeckNoPanning;
}

- (void)toggleProfileView:(id)sender {
    NSLog(@"show profile");
    [self toggleRightViewAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
