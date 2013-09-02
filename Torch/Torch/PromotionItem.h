//
//  PromotionItem.h
//  Torch
//
//  Created by Whitman Yang on 9/2/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PromotionItem : NSObject

+ (PromotionItem *) newPromotion:(long)key;

@property(nonatomic, assign)long key;
@property(nonatomic, copy)NSString * name;
@property(nonatomic, copy)NSString * description;
@property(nonatomic, copy)NSDate * expiration;

@end
