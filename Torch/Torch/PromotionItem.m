//
//  PromotionItem.m
//  Torch
//
//  Created by Whitman Yang on 9/2/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "PromotionItem.h"

@implementation PromotionItem

+ (PromotionItem *) newPromotion:(long)key {
    PromotionItem * result = [PromotionItem new];
    result.key = key;
    result.name = [NSString stringWithFormat:@"Promotion %li", key];
    result.description = [NSString stringWithFormat:@"Promotion %li description", key];
    result.expiration = [NSDate date];
    return result;
}

@end
