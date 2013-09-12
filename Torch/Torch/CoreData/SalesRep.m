#import "SalesRep.h"
#import <RestKit.h>

@interface SalesRep ()

// Private interface goes here.

@end


@implementation SalesRep

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     SalesRepAttributes.firstName,
     SalesRepAttributes.lastModifiedDate,
     SalesRepAttributes.lastName,
     SalesRepAttributes.lastUpdated,
     SalesRepAttributes.managerNetworkId,
     SalesRepAttributes.networkId,
     SalesRepAttributes.remoteKey,
     SalesRepAttributes.startDate,
     SalesRepAttributes.status
     ]];
    return mapping;
}

@end
