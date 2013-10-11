#import "PromotionItem.h"
#import <RestKit/RestKit.h>


@interface PromotionItem ()

// Private interface goes here.

@end


@implementation PromotionItem

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"PromotionItem" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[PromotionItemAttributes.productDescription,
     PromotionItemAttributes.productNumber,
     PromotionItemAttributes.promotionItemListPrice,
     PromotionItemAttributes.salesPrice]];
    return mapping;
}
@end
