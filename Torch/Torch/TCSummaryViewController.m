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
#import "StoreCall.h"
#import "Note.h"
#import "TCUtils.h"
#import "TCAddNoteController.h"
#import "UIViewController+MGBox.h"
#import "OrderCredit.h"
#import "UIViewController+Torch.h"
#import "TCSvcUtils.h"

@interface TCSummaryViewController ()

@property (nonatomic, strong) OrderCredit *order;

@end

@implementation TCSummaryViewController
@synthesize store;


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

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (! self.storeCall) {
        self.storeCall = [store callInProgress];
    }
    self.order = self.storeCall.associatedOrderObject;
    // remove StorehomeView from the stack to direct back to the myDay
    [self removePreviousCtrlInNavStack];

}

- (void)viewWillAppear:(BOOL)animated {
    MGBox *summary = [MGBox boxWithSize:(CGSize) {320, 100}];
    summary.contentLayoutMode = MGLayoutGridStyle;
    summary.leftPadding = summary.rightPadding = 16;
    
    [summary.boxes addObjectsFromArray:[@[
                                        [self cell:[NSString stringWithFormat:@"$%d", (NSInteger)self.storeCall.associatedOrderObject.paymentAmountValue] numberOfLines:1 textColor:TCColorTitleGray size:cellSize],
                                        [self cell:[NSString stringWithFormat:@"%.0f", 99.0] numberOfLines:1 textColor:TCColorTitleGray size:cellSize],
                                        [self cell:[NSString stringWithFormat:@"%dmin", [self.storeCall callDuration]] numberOfLines:1 textColor:TCColorTitleGray size:cellSize],
                                        [self cell:@"Retail Ordered Total" numberOfLines:2 textColor:TCColorSubtitleGray size:cellSize],
                                        [self cell:@"Out of Stocks Filled" numberOfLines:2 textColor:TCColorSubtitleGray size:cellSize],
                                        [self cell:@"Call Time" numberOfLines:1 textColor:TCColorSubtitleGray size:cellSize]
                                        ] map: ^id(UIView *label) {
                                            return mgline(label);
                                        }]];
    
    MGScrollView *scroller = [MGScrollView scrollerWithSize:(CGSize){320, 400}];
    [scroller.boxes addObjectsFromArray:@[
     [self lineWithHeight:5 color:[UIColor clearColor]],
     [self sectionHeader:store.name backgroundColor:[UIColor whiteColor] underlineColor:TCColorLineBlue fontName:@"HelveticaNeueLTCom-Md"],
     [self lineWithHeight:5 color:TCColorTitleBlue],
     [self sectionHeader:@"Call Summary" backgroundColor:TCColorTitleBlue underlineColor:TCColorSubtitleGray fontName:@"HelveticaNeueLTCom-Bd"],
     summary,
     [self lineWithHeight:8 color:TCColorTitleBlue],
     [self sectionHeader:@"Call Highlights" backgroundColor:TCColorTitleBlue underlineColor:TCColorSubtitleGray fontName:@"HelveticaNeueLTCom-Bd"]]];
    
    //millisecondToDateStr(note.createdDateValue)
    [scroller.boxes addObjectsFromArray:[[[self.storeCall decriptions] map:^(Note* note) {
        return [self callItemWithTitle:note.type
                              subtitle:note.title];
    } ] asArray]];

    [scroller.boxes addObjectsFromArray:[[self.storeCall.notes map:^(Note* note) {
        return [self callItemWithTitle:note.type
                              subtitle:note.title];
    } ] asArray]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect) {0, 0, 300, 48};
    button.backgroundColor = [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1];
    button.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 0.5f;
    button.layer.cornerRadius = 10.0f;
    button.titleLabel.textAlignment = NSTextAlignmentLeft;
    [button setTitle:@"Add Call Note" forState:UIControlStateNormal];
    [button setTitleColor:TCColorLineBlue forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addNote) forControlEvents:UIControlEventTouchDown];
    // button.titleLabel.textColor = TCColorLineBlue;
    
    MGLine *line = [MGLine lineWithLeft:button right:nil size:(CGSize) {315, 90}];
    line.leftPadding = 10;
    line.topPadding = 40;
    [scroller.boxes addObject:line];
    [scroller layout];
    if (self.view.subviews.count > 0) {
        [self.view.subviews[0] removeFromSuperview];
    }
    [self.view addSubview:scroller];
}

- (void)viewDidDisappear:(BOOL)animated {
    // place order
    OrderCredit *order = [self.storeCall associatedOrderObject];
    [order completeOrder:self.storeCall];
    // send out order, TODO
    // [TCSvcUtils orderRequestService:order];
    [super viewDidDisappear:animated];
}

- (void)addNote {
    TCAddNoteController *controller = [[TCAddNoteController alloc] init];
    controller.call = self.storeCall;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
