//
//  PromotionItem.m
//  Torch
//
//  Created by Whitman Yang on 9/2/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "PromotionItem.h"

@implementation PromotionItem

+ (PromotionItem *) newPromotion:(NSString *)key {
    PromotionItem * result = [PromotionItem new];
    result.key = key;
    result.name = [NSString stringWithFormat:@"Promotion %@", key];
    result.description = [NSString stringWithFormat:@"Promotion %@ description", key];
    result.expiration = [NSDate date];
    return result;
}

@end
