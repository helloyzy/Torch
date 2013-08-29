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

static const CGSize rowSize = (CGSize){320, 40};
static const CGSize cellSize = (CGSize){(320-32)/3, 50};

- (MGTableBox *)callItemWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
    MGTableBox *item = MGTableBox.box;
    [item.topLines addObjectsFromArray:@[
     [MGLine lineWithLeft:title right:nil size:(CGSize) {300, 40}],
     [MGLine lineWithLeft:subtitle right:nil size:(CGSize) {300, 40}]
     ]];
    item.borderStyle = MGBorderEtchedBottom;
    item.bottomBorderColor = [UIColor redColor];
    item.leftPadding = 16;
    return item;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        MGBox *summary = [MGBox boxWithSize:(CGSize) {320, 100}];
        summary.contentLayoutMode = MGLayoutGridStyle;
        summary.leftPadding = summary.rightPadding = 16;
        [summary.boxes addObjectsFromArray:@[
                [self cell:@"$354" numberOfLines:1],
                [self cell:@"3" numberOfLines:1],
                [self cell:@"21min" numberOfLines:1],
                [self cell:@"Retail Ordered Total" numberOfLines:2],
                [self cell:@"Out of Stocks Filled" numberOfLines:2],
                [self cell:@"Call Time" numberOfLines:1]
        ]];

        MGScrollView *scroller = [MGScrollView scrollerWithSize:self.view.bounds.size];
        [scroller.boxes addObjectsFromArray:@[
                [self sectionHeader:@"Store Name Here"],
                [self sectionHeader:@"Call Summary"],
                summary,
                [self sectionHeader:@"Call Highlights"],
                [self callItemWithTitle:@"Title1" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title2" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title3" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title4" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title5" subtitle:@"subTitle"]
        ]];
        
        [scroller layout];
        [self.view addSubview:scroller];
    }
    return self;
}

- (MGLine *)cell:(NSString *)text numberOfLines:(int)numberOfLines {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, cellSize.width, cellSize.height)];
    label.adjustsFontSizeToFitWidth = NO;
    label.alpha = 1.000;
    label.autoresizesSubviews = YES;
    label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    label.clearsContextBeforeDrawing = YES;
    label.clipsToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = numberOfLines;
    label.backgroundColor = [UIColor clearColor];
    label.opaque = NO;
    label.text = text;
    label.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];

    MGLine *result = [MGLine lineWithLeft:label right:nil size:cellSize];
    return result;
}

- (MGLineStyled *)sectionHeader:(NSString *)title {
    MGLineStyled *storeName = [MGLineStyled lineWithLeft:title right:nil size:rowSize];
    storeName.borderStyle = MGBorderEtchedBottom;
    storeName.bottomBorderColor = [UIColor blueColor];
    storeName.leftPadding = 16;
    return storeName;
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
