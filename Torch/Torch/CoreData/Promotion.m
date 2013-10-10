#import "Promotion.h"
#import "PromotionItem.h"
#import <RestKit/RestKit.h>


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

@end
