#import "OrderCreditItem.h"
#import <RestKit.h>

@interface OrderCreditItem ()

// Private interface goes here.

@end


@implementation OrderCreditItem

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     OrderCreditItemAttributes.discountPercentage,
     OrderCreditItemAttributes.distributedItemNumber,
     OrderCreditItemAttributes.markdownPercentage,
     OrderCreditItemAttributes.maxMarkdownPercentage,
     OrderCreditItemAttributes.nettAmount,
     OrderCreditItemAttributes.overridePrice,
     OrderCreditItemAttributes.quantity,
     OrderCreditItemAttributes.shortItemNumber,
     OrderCreditItemAttributes.total
     ]];
    return mapping;
}

@end
