//
//  TCCallSummary.m
//  Torch
//
//  Created by Whitman Yang on 10/14/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCCallSummary.h"
#import "OrderCredit.h"
#import "StoreCall.h"

@implementation TCCallSummary

- (NSInteger)totalAmountInteger {
    return (NSInteger)self.totalAmount;
}

/* in minutes */
- (NSInteger)callDuration {
    CGFloat durationInMilliseconds = self.endVisitTime - self.startVisitTime;
    return (NSInteger) durationInMilliseconds / (1000.0 * 60.0);
}



+ (TCCallSummary *)instance:(OrderCredit *)order call:(StoreCall *)call {
    TCCallSummary * result = [TCCallSummary new];
    result.startVisitTime = call.actualStartDateValue;
    result.endVisitTime = call.actualEndDateValue;
    result.inventoryTakenTime = call.inventoryTimeValue;
    
    result.totalAmount = order.paymentAmountValue;
    // TODO add weight value
    result.totalWeight = 0.0;
    
    return result;
}

@end
