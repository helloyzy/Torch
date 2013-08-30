//
//  TCSummaryViewController.m
//  Torch
//
//  Created by Yuan Mai on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSummaryViewController.h"
#import "GraphicsUtils.h"
#import <MGBox2/MGBox.h>
#import <MGLine.h>
#import <MGScrollView.h>
#import <MGTableBoxStyled.h>
#import <MGLineStyled.h>
#import <MGLine.h>
#import <OCTotallyLazy/OCTotallyLazy.h>

@interface TCSummaryViewController ()

@end

@implementation TCSummaryViewController

static const CGSize rowSize = (CGSize){320, 35};
static const CGSize cellSize = (CGSize){(320-32)/3, 50};

- (MGTableBox *)callItemWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
    UILabel* label = [self cell:title numberOfLines:1 textColor:TCColorTitleGray size:(CGSize){304, 18}];
    label.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
    label.textAlignment = NSTextAlignmentLeft;
    
    UILabel* label2 = [self cell:subtitle numberOfLines:1 textColor:TCColorSubtitleGray size:(CGSize){304, 21}];
    label2.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:12];
    label2.textAlignment = NSTextAlignmentLeft;

    MGTableBox *item = MGTableBox.box;
    item.topPadding = 16;
    [item.topLines addObjectsFromArray:@[
            mgline(label),
            mgline(label2)
    ]];
    item.borderStyle = MGBorderEtchedBottom;
    item.bottomBorderColor = TCColorSubtitleGray;
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
        [summary.boxes addObjectsFromArray:[@[
                [self cell:@"$354" numberOfLines:1 textColor:TCColorTitleGray size:cellSize],
                [self cell:@"3" numberOfLines:1 textColor:TCColorTitleGray size:cellSize],
                [self cell:@"21min" numberOfLines:1 textColor:TCColorTitleGray size:cellSize],
                [self cell:@"Retail Ordered Total" numberOfLines:2 textColor:TCColorSubtitleGray size:cellSize],
                [self cell:@"Out of Stocks Filled" numberOfLines:2 textColor:TCColorSubtitleGray size:cellSize],
                [self cell:@"Call Time" numberOfLines:1 textColor:TCColorSubtitleGray size:cellSize]
         ] map: ^id(UIView *label) {
             return mgline(label);
         }]];        

        MGScrollView *scroller = [MGScrollView scrollerWithSize:(CGSize){320, 400}];
        [scroller.boxes addObjectsFromArray:@[
                [self lineWithHeight:5 color:[UIColor clearColor]],
                [self sectionHeader:@"Store Name Here" backgroundColor:[UIColor whiteColor] underlineColor:TCColorLineBlue fontName:@"HelveticaNeueLTCom-Md"],
                [self lineWithHeight:5 color:TCColorTitleBlue],
                [self sectionHeader:@"Call Summary" backgroundColor:TCColorTitleBlue underlineColor:TCColorSubtitleGray fontName:@"HelveticaNeueLTCom-Bd"],
                summary,
                [self lineWithHeight:8 color:TCColorTitleBlue],
                [self sectionHeader:@"Call Highlights" backgroundColor:TCColorTitleBlue underlineColor:TCColorSubtitleGray fontName:@"HelveticaNeueLTCom-Bd"],
                [self callItemWithTitle:@"Title1" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title2" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title3" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title4" subtitle:@"subTitle"],
                [self callItemWithTitle:@"Title5" subtitle:@"subTitle"],
        ]];

        [scroller layout];
        [self.view addSubview:scroller];
    }
    return self;
}

- (MGLine *)lineWithHeight:(int)height color:(UIColor *)color {
    MGLine *pad = [MGLine lineWithSize:(CGSize){320, height}];
    pad.backgroundColor = color;
    return pad;
}

- (UILabel *)cell:(NSString *)text numberOfLines:(int)numberOfLines textColor:(UIColor *)textColor size:(CGSize const)size {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = numberOfLines;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    label.text = text;
    label.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];
    return label;
}

- (MGLine *)sectionHeader:(NSString *)title backgroundColor:(UIColor *)backgroundColor underlineColor:(UIColor *)underlineColor fontName:(NSString *)fontName {
    UILabel* label = [self cell:title numberOfLines:1 textColor:TCColorLineBlue size:(CGSize){280, 20}];
    label.font = [UIFont fontWithName:fontName size:17];
    label.textAlignment = NSTextAlignmentLeft;

    MGLine *line = [MGLine lineWithLeft:label right:nil size:rowSize];
    line.topPadding = line.leftPadding = 16;    
    line.borderStyle = MGBorderEtchedBottom;
    line.backgroundColor = backgroundColor;
    line.bottomBorderColor = underlineColor;
    return line;
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
