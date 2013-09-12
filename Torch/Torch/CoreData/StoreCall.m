#import "StoreCall.h"
#import <RestKit.h>

@interface StoreCall ()

// Private interface goes here.

@end

@implementation StoreCall

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     StoreCallAttributes.actualEndDate,
     StoreCallAttributes.actualStartDate,
     StoreCallAttributes.callTimeAdjustment,
     StoreCallAttributes.lastModifiedDate,
     StoreCallAttributes.plannedEndDate,
     StoreCallAttributes.plannedStartDate,
     StoreCallAttributes.remoteKey
     ]];
    return mapping;
}

@end
