//
//  TCPromotionItem.m
//  Torch
//
//  Created by Whitman Yang on 10/10/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPromotionItem.h"
#import <IBFunctions.h>
#import "TCUtils.h"

@implementation TCPromotionItem

+ (TCPromotionItem *) newPromotion:(NSString *)key {
    TCPromotionItem *result = [TCPromotionItem new];
    result.key = key;
    result.name = [NSString stringWithFormat:@"Promotion %@", key];
    result.description = [NSString stringWithFormat:@"Promotion %@ description", key];
    result.expiration = [NSDate date];
    return result;
}



@end
