#import "CalItem.h"
#import <RestKit.h>

@interface CalItem ()

// Private interface goes here.

@end


@implementation CalItem

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     CalItemAttributes.active,
     CalItemAttributes.customerItemNumber,
     CalItemAttributes.discontinued,
     CalItemAttributes.distributorItem,
     CalItemAttributes.effectiveEndDate,
     CalItemAttributes.effectiveStartDate,
     CalItemAttributes.maxMarkdown,
     CalItemAttributes.name,
     CalItemAttributes.packtypeDescription,
     CalItemAttributes.price,
     CalItemAttributes.productNumber,
     CalItemAttributes.remoteKey,
     CalItemAttributes.schedule,
     CalItemAttributes.segment,
     CalItemAttributes.tdNumber,
     CalItemAttributes.uom,
     CalItemAttributes.upc
     ]];
    return mapping;
}

@end
