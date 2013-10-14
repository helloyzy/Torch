#import "SalesRep.h"
#import <RestKit/RestKit.h>
#import "Banner.h"
#import "NSManagedObject+TCRestkit.h"
#import <NSManagedObject+InnerBand.h>

@interface SalesRep ()

// Private interface goes here.

@end


@implementation SalesRep

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"SalesRep" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     SalesRepAttributes.firstName,
     SalesRepAttributes.lastModifiedDate,
     SalesRepAttributes.lastName,
     SalesRepAttributes.lastUpdated,
     SalesRepAttributes.managerNetworkId,
     SalesRepAttributes.networkId,
     SalesRepAttributes.remoteKey,
     SalesRepAttributes.startDate,
     SalesRepAttributes.status,
     SalesRepAttributes.salesOrg
     ]];
    // mapping.identificationAttributes = @[SalesRepAttributes.remoteKey];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"banners" toKeyPath:@"banners" withMapping:[Banner objectMapping]]];
    return mapping;
}

+ (NSString *)getRepId {
    SalesRep *salesRep = (SalesRep *)[[self allInStore:[self dataStore]] objectAtIndex:0];
    return salesRep.remoteKey;
}

@end
