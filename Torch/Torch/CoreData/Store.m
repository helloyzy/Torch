#import "Store.h"
#import <RestKit.h>

@interface Store ()

// Private interface goes here.

@end


@implementation Store

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     StoreAttributes.address,
     StoreAttributes.analytics,
     StoreAttributes.city,
     StoreAttributes.country,
     StoreAttributes.creditAddress,
     StoreAttributes.creditType,
     StoreAttributes.distributor,
     StoreAttributes.faxNumber,
     StoreAttributes.lastModifiedDate,
     StoreAttributes.modelTime,
     StoreAttributes.name,
     StoreAttributes.number,
     StoreAttributes.postalCode,
     StoreAttributes.products,
     StoreAttributes.remoteKey,
     StoreAttributes.schedule,
     StoreAttributes.state
     ]];
    return mapping;
}

@end
