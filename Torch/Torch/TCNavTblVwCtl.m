//
//  TCNavTblVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 8/27/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCNavTblVwCtl.h"
#import "UIViewController+Torch.h"

@interface TCNavTblVwCtl ()

@end

@implementation TCNavTblVwCtl

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self decorateNavBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
