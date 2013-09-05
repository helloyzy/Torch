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
#import "MGTableBox.h"

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

    MGTableBox *table = [MGTableBox boxWithSize:self.view.size];

    DDProgressView *progressBar = [[DDProgressView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, self.view.bounds.size.width - 30.0f, 100.0f)];
    progressBar.outerColor = [UIColor clearColor];
    progressBar.emptyColor = TCColorProgressLtBlue;
    progressBar.progress = 0.5f;
    progressBar.innerColor = TCColorProgressBlue;

    UILabel *progressText = [[UILabel alloc] initWithFrame:(CGRect) {0, 5, progressBar.bounds.size.width, progressBar.bounds.size.height-5}];
    progressText.adjustsFontSizeToFitWidth = NO;
    progressText.textAlignment = NSTextAlignmentCenter;
    progressText.numberOfLines = 1;
    progressText.textColor = [UIColor whiteColor];
    progressText.backgroundColor = [UIColor clearColor];
    progressText.text = @"8 of 10";
    progressText.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
    [progressBar addSubview:progressText];

    [table.topLines addObject:mgline(progressBar)];
    [table layout];
    [self.view addSubview:table];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
