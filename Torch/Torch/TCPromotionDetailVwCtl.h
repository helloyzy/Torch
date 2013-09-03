//
//  TCPromotionDetailVwCtl.h
//  Torch
//
//  Created by Whitman Yang on 8/30/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"

@class PromotionItem;

@interface TCPromotionDetailVwCtl : TCNavVwCtl {
    
    __weak IBOutlet UIView *vwHeader;
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UILabel *lblPromoName;
    __weak IBOutlet UILabel *lblPromoDesp;
    __weak IBOutlet UILabel *lblExpTitle;
    __weak IBOutlet UILabel *lblExpDesp;
    __weak IBOutlet UILabel *lblExpDate;
    __weak IBOutlet UIButton *btnAddProm;
}

- (IBAction)addPromoToOrder:(id)sender;

@property(nonatomic,strong)PromotionItem * item;

@end
