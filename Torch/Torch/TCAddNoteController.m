//
//  TCAddNoteController.m
//  Torch
//
//  Created by Yuan Mai on 9/25/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCAddNoteController.h"

@interface TCAddNoteController ()

@end

@implementation TCAddNoteController

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
    UIView *sepertor = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 2)];
    sepertor.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    [self.view addSubview:sepertor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
