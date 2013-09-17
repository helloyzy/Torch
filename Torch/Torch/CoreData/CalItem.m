#import "CalItem.h"
#import <RestKit.h>

@interface CalItem ()

// Private interface goes here.

@end


@implementation CalItem

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"CalItem" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     CalItemAttributes.active,
     CalItemAttributes.distributorItem,
     CalItemAttributes.productNumber,
     CalItemAttributes.uom,
     CalItemAttributes.segment,
     CalItemAttributes.customerItemNumber,
     CalItemAttributes.effectiveStartDate,
     CalItemAttributes.maxMarkdown,
     CalItemAttributes.remoteKey,
     CalItemAttributes.tdNumber,
     CalItemAttributes.weight,
     CalItemAttributes.price,
     CalItemAttributes.upc,
     CalItemAttributes.name,
     CalItemAttributes.packtypeDescription,
     CalItemAttributes.effectiveEndDate,
     CalItemAttributes.schedule,
     CalItemAttributes.discontinued
     ]];
    return mapping;
}

@end
