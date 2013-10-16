#import "Store.h"
#import <RestKit/RestKit.h>
#import "StoreCall.h"
#import "Contact.h"
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"

@interface Store ()

// Private interface goes here.

@end


@implementation Store

@synthesize sequenceNum, taxRate;//, coordinate = _coordinate, title, subtitle;

- (CLLocationCoordinate2D) coordinate {
    return (CLLocationCoordinate2D) {self.latitudeValue, self.longitudeValue};
}

- (NSString*) title {
    return self.name;
}

- (NSString*) subtitle {
    return [NSString stringWithFormat:@"%@ %@, %@ %@", self.address, self.city, self.country, self.postalCode];
}

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

- (StoreCall *)callInProgress {
    StoreCall *result = nil;
    for (StoreCall *temp in self.storeCalls) {
        if ([temp isCallInProgress]) {
            result = temp;
            break;
        }
    }
    return result;
}

- (BOOL)hasLocation {
    if (self.longitude && self.longitudeValue > 0 && self.latitude && self.latitudeValue > 0) {
        return YES;
    }
    return NO;
}

+ (Store *)storeInCall {
    NSArray *stores = [self allInStore:[TCDBUtils ibDataStore]];
    for (Store *store in stores) {
        if ([store callInProgress]) {
            return store;
        }
    }
    return nil;
}

/* sort by schedule */
+ (NSArray *)sortedStores {
    return [self allOrderedBy:StoreAttributes.schedule ascending:YES inStore:[TCDBUtils ibDataStore]];
}

@end
