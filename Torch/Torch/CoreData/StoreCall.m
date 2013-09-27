#import "StoreCall.h"
#import <RestKit/RestKit.h>
#import "Note.h"
#import "Store.h"
#import "TCUtils.h"
#import <IBFunctions.h>

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
     StoreCallAttributes.remoteKey,
     StoreCallAttributes.externalId,
     StoreCallAttributes.routed,
     StoreCallAttributes.rider1,
     StoreCallAttributes.rider2
     ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"notes" toKeyPath:@"notes" withMapping:[Note objectMapping]]];
    return mapping;
}

+ (StoreCall *)newInstance:(Store *)store {
    StoreCall *result = [self newInstance];
    result.store = store;
    result.plannedStartDate = curdateToMilliseconds();
    result.actualStartDate = result.plannedStartDate;
    result.callTimeAdjustment = IB_BOX_DOUBLE(0);
    [self save];
    return result;
}

static NSString *STORE_CALL_EID_DEFAULT = @"DEFAULT_EXTERNAL_ID";

- (void)endCall {
    self.plannedEndDate = curdateToMilliseconds();
    self.actualEndDate = self.plannedEndDate;
    self.externalId = STORE_CALL_EID_DEFAULT;
    [StoreCall save];
}

@end
