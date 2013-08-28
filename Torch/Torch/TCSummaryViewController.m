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
        MGLineStyled *storeName = [MGLineStyled lineWithLeft:@"Store Name Here" right:nil size:rowSize];
        storeName.borderStyle = MGBorderEtchedBottom;
        storeName.bottomBorderColor = [UIColor blueColor];
        storeName.leftPadding = storeName.rightPadding = 16;
        
        MGLineStyled *summaryTitle = [MGLineStyled lineWithLeft:@"Call Summary" right:nil size:rowSize];
        
        MGBox *summary = [MGBox boxWithSize:(CGSize) {300, 100}];
        summary.contentLayoutMode = MGLayoutGridStyle;
        
        CGSize cellSize = (CGSize){ 100, 50 };
        
        MGLineStyled *total = [MGLineStyled lineWithLeft:@"$354" right:nil size:cellSize];
        MGLineStyled *outOfStock = [MGLineStyled lineWithLeft:@"3" right:nil size:cellSize];
        MGLineStyled *callTime = [MGLineStyled lineWithLeft:@"21min" right:nil size:cellSize];
        MGLineStyled *totalTxt = [MGLineStyled lineWithLeft:@"Retail Ordered Total" right:nil size:cellSize];
        MGLineStyled *outOfStockTxt = [MGLineStyled lineWithLeft:@"Out of Stocks Filled" right:nil size:cellSize];
        MGLineStyled *callTimeTxt = [MGLineStyled lineWithLeft:@"Call Time" right:nil size:cellSize];
        [summary.boxes addObjectsFromArray:@[total, outOfStock, callTime,
         totalTxt, outOfStockTxt, callTimeTxt]];
        [section.topLines addObjectsFromArray:@[storeName, summaryTitle, summary]];
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
