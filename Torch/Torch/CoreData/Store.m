#import "Store.h"
#import <RestKit/RestKit.h>
#import "StoreCall.h"
#import "Contact.h"

@interface Store ()

// Private interface goes here.

@end


@implementation Store

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Store" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
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
     StoreAttributes.state,
     StoreAttributes.priority,
     StoreAttributes.soldToName,
     StoreAttributes.soldToNumber,
     StoreAttributes.gstTaxNumber,
     StoreAttributes.pstTaxNumber,
     StoreAttributes.callFrequency
     ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"storeCalls" toKeyPath:@"storeCalls" withMapping:[StoreCall objectMapping]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"contacts" toKeyPath:@"contacts" withMapping:[Contact objectMapping]]];
    return mapping;
}

@end
