#import "Order.h"
#import <RestKit/RestKit.h>
#import "OrderCredit.h"
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"

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

+ (NSArray *)activeOrders {
    return [self allInStore:[TCDBUtils ibDataStore]];
}

+ (NSInteger)activeOrderCount {
    return [[self activeOrders] count];
}

@end
