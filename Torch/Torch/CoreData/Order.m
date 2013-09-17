#import "Order.h"
#import <RestKit.h>
#import "OrderCredit.h"

@interface Order ()

// Private interface goes here.

@end


@implementation Order

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Order" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    [mapping addAttributeMappingsFromArray:@[
     OrderAttributes.remoteKey,
     OrderAttributes.actualStartDate
    ]];
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"orderCredits" toKeyPath:@"orderCredits" withMapping:[OrderCredit objectMapping]]];
    return mapping;
}

@end
