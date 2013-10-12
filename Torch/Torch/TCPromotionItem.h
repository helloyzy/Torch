//
//  TCPromotionItem.h
//  Torch
//
//  Created by Whitman Yang on 10/10/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PromotionTypeNormal,
    PromotionTypeDiscountOrder,
    PromotionTypeDollarOff
} PromotionType;

@interface TCPromotionItem : NSObject

+ (TCPromotionItem *) newPromotion:(NSString *)key;

@property(nonatomic, copy)NSString * key;
@property(nonatomic, assign)PromotionType type;
@property(nonatomic, assign)CGFloat discountPercentage;
@property(nonatomic, assign)CGFloat discountAmount;
@property(nonatomic, copy)NSString * name;
@property(nonatomic, copy)NSString * description;
@property(nonatomic, copy)NSDate * expiration;
@property(nonatomic) float unitNum;
@property(nonatomic, copy)NSString *productDescription;
@property(nonatomic, copy)NSString *productNumber;
@property(nonatomic, assign)CGFloat promotionItemListPrice;
@property(nonatomic, assign)CGFloat salesPrice;

@end
