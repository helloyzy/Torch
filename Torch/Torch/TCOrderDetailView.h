//
//  TCOrderDetailView.h
//  Torch
//
//  Created by xu cheng on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"
#import "ProductItemObject.h"

@interface TCOrderDetailView : TCNavVwCtl

@property (nonatomic,strong) NSString *orderSN;
@property (nonatomic,strong) NSString *orderDate;
@property (nonatomic,strong) NSString *orderTotalAmount;

-(void)setOrderObjectList:(NSArray *)orderDetailsItemList;

@end
