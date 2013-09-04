//
//  TCSurveyController.m
//  Torch
//
//  Created by Yuan Mai on 9/4/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSurveyController.h"
#import "DDProgressView.h"
#import "GraphicsUtils.h"

@interface TCSurveyController ()

@end

@implementation TCSurveyController

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

    DDProgressView *progressView = [[DDProgressView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, self.view.bounds.size.width - 40.0f, 100.0f)];
    progressView.outerColor = [UIColor clearColor];
    progressView.emptyColor = TCColorProgressLtBlue;
    progressView.progress = 0.5f;
    progressView.innerColor = TCColorProgressBlue;
    [self.view addSubview: progressView];

    UILabel *storeLabel = [[UILabel alloc] initWithFrame:progressView.frame];
    storeLabel.adjustsFontSizeToFitWidth = NO;
    storeLabel.alpha = 1.000;
    storeLabel.autoresizesSubviews = YES;
    storeLabel.contentMode = UIViewContentModeCenter;
    storeLabel.numberOfLines = 1;
    storeLabel.backgroundColor = [UIColor clearColor];
    storeLabel.opaque = NO;
    storeLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    storeLabel.text = @"Store Name Here";
    storeLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];
    [progressView addSubview:storeLabel];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
