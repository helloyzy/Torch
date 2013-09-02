//
//  TCPromotionDetailVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 8/30/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPromotionDetailVwCtl.h"
#import "TCSysRes.h"
#import "DateUtils.h"
#import "PromotionItem.h"

@interface TCPromotionDetailVwCtl ()

@end

@implementation TCPromotionDetailVwCtl

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
    [self initCtl];
}

- (void)initCtl {
    TCLbl_Title_Ext(lblTitle);
    lblTitle.text = [self localString:@"promotion.detail.title"];
    
    vwHeader.backgroundColor = [UIColor clearColor];
    CGRect bounds = vwHeader.bounds;
    bounds.size.height = TC_TblVw_SectHeader_Height;
    vwHeader.bounds = bounds;
    UIView * vwHeaderContent = TCVw_TblVw_SectHeader(@"promotion.detail.section.title");
    [vwHeader addSubview:vwHeaderContent];
    vwHeader.hidden = YES;
    
    lblPromoTitle.font = TCFont_HNLTComBd(17);
    lblExpTitle.font = TCFont_HNLTComBd(17);
    
    CGFloat subTitleFontSize = 15;
    lblPromoDetail.font = TCFont_HNLTComLt(subTitleFontSize);
    lblExpDesp.font = TCFont_HNLTComLt(subTitleFontSize);
    lblExpDate.font = TCFont_HNLTComLt(subTitleFontSize);
    
    UIColor * subTitleColor = [UIColor colorWithRed:130/255.0f green:130/255.0f blue:130/255.0f alpha:1];
    lblPromoDetail.textColor = subTitleColor;
    lblExpDesp.textColor = subTitleColor;
    lblExpDate.textColor = subTitleColor;
    
    lblExpDate.text = [DateUtils stringFromDate:self.item.expiration withFormat:kDateFormatShort];
    
    btnAddProm.titleLabel.font = TCFont_HNLTComBd(17);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
