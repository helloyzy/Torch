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

@interface TCDataStatusController ()

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
    [scroller.boxes addObjectsFromArray:@[
     [self lineWithHeight:5 color:[UIColor clearColor]],
     [self sectionHeader:@"Data Status" backgroundColor:[UIColor whiteColor] underlineColor:TCColorLineBlue fontName:@"HelveticaNeueLTCom-Md"],
     [self lineWithHeight:5 color:[UIColor whiteColor]],
     [self sectionHeader:@"There is no data waiting to be sent" backgroundColor:[UIColor whiteColor] underlineColor:TCColorSubtitleGray fontName:@"HelveticaNeueLTCom-Bd"],
     [self lineWithHeight:5 color:[UIColor whiteColor]],
     [self sectionHeader:@"Store Name" backgroundColor:[UIColor whiteColor] underlineColor:TCColorSubtitleGray fontName:@"HelveticaNeueLTCom-Bd"]]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect) {0, 0, 300, 48};
    button.backgroundColor = [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1];
    button.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 0.5f;
    button.layer.cornerRadius = 10.0f;
    button.titleLabel.textAlignment = NSTextAlignmentLeft;
    [button setTitle:@"Send Data" forState:UIControlStateNormal];
    [button setTitleColor:TCColorLineBlue forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addNote) forControlEvents:UIControlEventTouchDown];
    
    MGLine *line = [MGLine lineWithLeft:button right:nil size:(CGSize) {315, 65}];
    line.leftPadding = 10;
    line.topPadding = 40;
    
    [scroller.boxes addObject:line];
    
    MGLine *text = [self getLine:@"You do not currently have a connection. Please connect to WiFi or cellular netowrk to enable sending of data." backgroundColor:[UIColor whiteColor] underlineColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] size:(CGSize) {280, 70} numberOfLines:3];
    text.height = 100;
    
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];

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

@end
