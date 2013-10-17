#import "Promotion.h"
#import "PromotionItem.h"
#import <RestKit/RestKit.h>
#import <NSManagedObject+InnerBand.h>
#import <IBFunctions.h>
#import "TCUtils.h"
#import "Store.h"

@interface Promotion ()

// Private interface goes here.

@end


@implementation Promotion

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Promotion" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[PromotionAttributes.title,
     PromotionAttributes.accountId,
     PromotionAttributes.discountAmount,
     PromotionAttributes.discountPercentage,
     PromotionAttributes.endDate,
     PromotionAttributes.orderItemDiscount,
     PromotionAttributes.startDate]];
    [mapping addAttributeMappingsFromDictionary:@{@"description" : PromotionAttributes.desp}];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"promotionItem" toKeyPath:@"promotionItem" withMapping:[PromotionItem objectMapping]]];
    return mapping;
}

- (PromotionType)type {
    if (self.orderItemDiscountValue) {
        if (self.discountAmount && self.discountAmountValue > 0) {
            return PromotionTypeDollarOff;
        } else {
            return PromotionTypeDiscountOrder;
        }
    } else { // promotion per item
        return PromotionTypeNormal;
    }
}

+ (NSArray *)convertToTCPromotions:(NSArray *)promotions {
    // double keyVal = [curdateToMilliseconds() doubleValue];
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (Promotion *promotion in promotions) {
        TCPromotionItem * item = [TCPromotionItem new];
        // item.key = IB_STRINGIFY_DOUBLE(keyVal++);
        item.key = [NSString stringWithFormat:@"%@,%@", promotion.title, promotion.desp];
        item.name = promotion.title;
        item.description = promotion.desp;
        // item.expiration = millisecondToDate(promotion.endDateValue);
        item.endDate = promotion.endDate;
        item.type = promotion.type;
        item.discountPercentage = promotion.discountPercentageValue;
        item.discountAmount = promotion.discountAmountValue;
        PromotionItem *promotionItem = [promotion.promotionItem anyObject];
        if (promotionItem) {
            item.productDescription = promotionItem.productDescription;
            item.productNumber = promotionItem.productNumber;
            item.promotionItemListPrice = promotionItem.promotionItemListPriceValue;
            item.salesPrice = promotionItem.salesPriceValue;
        }
        [result addObject:item];
    }
    return result;
}

+ (NSArray *)promotionsPerStore:(Store *)store {
    NSString * predicate = [NSString stringWithFormat:@"%@ = '%@'", PromotionAttributes.accountId, store.remoteKey];
    NSArray *promotions = [self allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[self dataStore]];
    return [self convertToTCPromotions:promotions];
}

#pragma mark - mock data

+ (void)generateMockData:(NSString *)storeId {
    Promotion *promotion = [Promotion newInstance];
    promotion.orderItemDiscountValue = YES;
    promotion.discountAmount = IB_BOX_DOUBLE(1.0);
    promotion.discountPercentage = IB_BOX_DOUBLE(0.0);
    promotion.title = @"1 dollar off";
    promotion.desp = @"1 dollar off promotion";
    promotion.endDate = @"2013-10-15"; //curdateToMilliseconds();
    promotion.accountId = storeId;
    [self save];
    
    promotion = [Promotion newInstance];
    promotion.orderItemDiscountValue = YES;
    promotion.discountAmount = IB_BOX_DOUBLE(0.0);
    promotion.discountPercentage = IB_BOX_DOUBLE(0.1);
    promotion.title = @"10 percent off";
    promotion.desp = @"10 percent off promotion";
    promotion.endDate = @"2013-10-15"; //curdateToMilliseconds();
    promotion.accountId = storeId;
    [self save];
    
    promotion = [Promotion newInstance];
    promotion.orderItemDiscountValue = YES;
    promotion.discountAmount = IB_BOX_DOUBLE(0.0);
    promotion.discountPercentage = IB_BOX_DOUBLE(0.15);
    promotion.title = @"15 percent off";
    promotion.desp = @"15 percent off promotion";
    promotion.endDate = @"2013-10-15"; //curdateToMilliseconds();
    promotion.accountId = storeId;
    [self save];
    
    promotion = [Promotion newInstance];
    promotion.orderItemDiscountValue = NO;
    promotion.discountAmount = IB_BOX_DOUBLE(0.0);
    promotion.discountPercentage = IB_BOX_DOUBLE(0.0);
    promotion.title = @"Buy 5 get 1 free";
    promotion.desp = @"Buy 5 get 1 free";
    promotion.endDate = @"2013-10-15"; //curdateToMilliseconds();
    promotion.accountId = storeId;
    PromotionItem *item = [PromotionItem newInstance];
    item.productNumber = @"product number";
    item.productDescription = @"product description";
    item.promotionItemListPriceValue = 100.0;
    item.salesPriceValue = 100.0;
    [self save];

}

@end
