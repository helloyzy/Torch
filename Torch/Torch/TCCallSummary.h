//
//  TCCallSummary.h
//  Torch
//
//  Created by Whitman Yang on 10/14/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrderCredit,StoreCall;

@interface TCCallSummary : NSObject

+ (TCCallSummary *)instance:(OrderCredit *)order call:(StoreCall *)call;

@property (nonatomic, assign)CGFloat startVisitTime;
@property (nonatomic, assign)CGFloat endVisitTime;
@property (nonatomic, assign)CGFloat inventoryTakenTime;

@property (nonatomic, assign)CGFloat totalAmount;
@property (nonatomic, assign)CGFloat totalWeight;
@property (nonatomic, readonly)NSInteger totalAmountInteger;
@property (nonatomic, readonly)NSInteger callDuration;

@end
