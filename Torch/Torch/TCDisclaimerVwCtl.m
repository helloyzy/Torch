//
//  TCDisclaimerVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCDisclaimerVwCtl.h"
#import "UIViewController+Utils.h"
#import "UIViewController+Torch.h"

@interface TCDisclaimerVwCtl ()

@end

@implementation TCDisclaimerVwCtl

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
    btnDone.title = [self localString:@"Done"];
    [self decorateNavBar:navBar];
    NSString * fileName = [self localString:@"disclaimation.fileName"];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSString * content = [[NSString alloc]initWithContentsOfFile:filePath  encoding:NSUTF8StringEncoding error:nil];
    txtVw.text = content; // [self localString:@"disclaimation.content"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissView:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
