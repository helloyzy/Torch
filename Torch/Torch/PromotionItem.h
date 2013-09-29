//
//  PromotionItem.h
//  Torch
//
//  Created by Whitman Yang on 9/2/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PromotionTypeNormal,
    PromotionTypeDiscountOrder
} PromotionType;

@interface PromotionItem : NSObject

+ (PromotionItem *) newPromotion:(NSString *)key;

@property(nonatomic, copy)NSString * key;
@property(nonatomic, assign)PromotionType type;
@property(nonatomic, assign)CGFloat discountPercentage;
@property(nonatomic, copy)NSString * name;
@property(nonatomic, copy)NSString * description;
@property(nonatomic, copy)NSDate * expiration;

@end
