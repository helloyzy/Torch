#import "OrderCreditItem.h"
#import <RestKit/RestKit.h>

#import "CalItem.h"

@interface OrderCreditItem ()

// Private interface goes here.

@end


@implementation OrderCreditItem

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"OrderCreditItem" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
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
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"calItem" toKeyPath:@"calItem" withMapping:[CalItem objectMapping]]];
    return mapping;
}

@end
