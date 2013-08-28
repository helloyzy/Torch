//
//  TCSummaryViewController.m
//  Torch
//
//  Created by Yuan Mai on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSummaryViewController.h"
#import <MGBox2/MGBox.h>
#import <MGLine.h>
#import <MGScrollView.h>
#import <MGTableBoxStyled.h>
#import <MGLineStyled.h>
#import <MGLine.h>

@interface TCSummaryViewController ()

@end

@implementation TCSummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        MGScrollView *scroller = [MGScrollView scrollerWithSize:self.view.bounds.size];
        CGSize rowSize = (CGSize){304, 40};
        [self.view addSubview:scroller];
        MGTableBox *section = MGTableBox.box;
        [scroller.boxes addObject:section];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 270.0, 21.0)];
        title.adjustsFontSizeToFitWidth = NO;
        title.alpha = 1.000;
        title.autoresizesSubviews = YES;
        title.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        title.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        title.clearsContextBeforeDrawing = YES;
        title.clipsToBounds = YES;
        title.contentMode = UIViewContentModeLeft;
        title.numberOfLines = 1;
        title.backgroundColor = [UIColor clearColor];
        title.opaque = NO;
        title.shadowOffset = CGSizeMake(0.0, -1.0);
        title.text = @"Store Name Here";
        title.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];
        MGLineStyled *header = [MGLine lineWithLeft:title right:nil size:rowSize];
        header.borderStyle = MGBorderNone;
        header.leftPadding = header.rightPadding = 16;
        [section.topLines addObject:header];

        MGLineStyled *row1 = [MGLineStyled lineWithLeft:@"Left text"
                                                  right:[UIImage imageNamed:@"horse.png"] size:rowSize];
        [section.topLines addObject:row1];
        [scroller layout];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
