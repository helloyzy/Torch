//
//  TCDataStatusController.m
//  Torch
//
//  Created by Yuan Mai on 9/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCDataStatusController.h"
#import "UIViewController+MGBox.h"
#import <MGBox.h>
#import <MGScrollView.h>
#import <MGLine.h>
#import "GraphicsUtils.h"
#import <Reachability.h>
#import <IBFunctions.h>
#import "Order.h"
#import "TCSysRes.h"

#define SECTION_LEFT_PADDING 20
#define SECTION_HEADER_MARGIN 13

@interface TCDataStatusController () {
    MGScrollView *_scrollView;
}

@end

@implementation TCDataStatusController

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
    MGScrollView *scroller = [MGScrollView scrollerWithSize:(CGSize){320, 400}];
    _scrollView = scroller;
    
    // title
    [self addTitleSection];
    
    if ([Order activeOrderCount] > 0) {
        [self addSendBtn];
    } else {
        [self addSectionsForNoOrder];
    }
    
    
    
    MGLine *text = [self getLine:@"You do not currently have a connection. Please connect to WiFi or cellular netowrk to enable sending of data." backgroundColor:[UIColor whiteColor] underlineColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] size:(CGSize) {280, 70} numberOfLines:3];
    text.height = 100;
    
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];

    if (reach.isReachable) {
        [scroller.boxes addObject:text];
    }
    [scroller layout];
    [self.view addSubview:scroller];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI controls


- (void)addTitleSection {
    CGSize size = (CGSize) {280, 20};
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    label.text = L(@"datastatus.title");
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = TCColorLineBlue;
    label.font = TCFont_HNLTComBd(17);
    
    MGLine *line = [MGLine lineWithLeft:label right:nil size:(CGSize){320, 35}];
    line.topMargin = SECTION_HEADER_MARGIN;
    line.leftPadding = SECTION_LEFT_PADDING - 4;
    line.borderStyle = MGBorderEtchedBottom;
    line.bottomBorderColor = [UIColor blackColor];
    [_scrollView.boxes addObject:line];
}


#pragma mark - no order in queue

- (void)addSectionsForNoOrder {
    NSInteger height = 50;
    CGSize size = (CGSize) {280, height};
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    label.text = L(@"datastatus.nodata");
    label.numberOfLines = 2;
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = TCColorLineBlue;
    label.font = TCFont_HNLTComMd(17);
    
    MGLine *line = [MGLine lineWithLeft:label right:nil size:(CGSize){320, height}];
    line.topMargin = SECTION_HEADER_MARGIN;
    line.leftPadding = SECTION_LEFT_PADDING;
    [_scrollView.boxes addObject:line];
}

#pragma mark - orders in queue

- (void)addSendBtn {
    UIButton *button = [[UIButton alloc]initWithFrame:(CGRect) {0, 0, 300, 40}];
    [button setBackgroundImage:[UIImage imageNamed:@"bluebutton.png"] forState:UIControlStateNormal];
    // button.frame = (CGRect) {0, 0, 300, 40};
    button.backgroundColor = [UIColor clearColor]; // [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1];
    // button.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    button.titleLabel.font = TCFont_HNLTComBd(17);
//    button.layer.borderColor = [UIColor grayColor].CGColor;
    // button.layer.borderWidth = 0.5f;
    // button.layer.cornerRadius = 10.0f;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:L(@"datastatus.senddata") forState:UIControlStateNormal];
    // [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendOrder:) forControlEvents:UIControlEventTouchUpInside];
    
    MGLine *line = [MGLine lineWithLeft:button right:nil size:(CGSize) {315, 65}];
    line.leftPadding = 10;
    line.topPadding = 40;
    
    [_scrollView.boxes addObject:line];
}

- (void)sendOrder:(id)sender {
    
}

@end
