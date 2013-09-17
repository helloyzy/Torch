#import "StoreCall.h"
#import <RestKit/RestKit.h>
#import "Note.h"

@interface StoreCall ()

// Private interface goes here.

@end

@implementation StoreCall

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"StoreCall" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     StoreCallAttributes.actualEndDate,
     StoreCallAttributes.actualStartDate,
     StoreCallAttributes.callTimeAdjustment,
     StoreCallAttributes.lastModifiedDate,
     StoreCallAttributes.plannedEndDate,
     StoreCallAttributes.plannedStartDate,
     StoreCallAttributes.remoteKey
     ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"notes" toKeyPath:@"notes" withMapping:[Note objectMapping]]];
    return mapping;
}

@end
