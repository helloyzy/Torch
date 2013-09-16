#import "Banner.h"
#import <RestKit/RestKit.h>
#import "Store.h"

@interface Banner ()

// Private interface goes here.

@end


@implementation Banner

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Banner" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    // mapping.identificationAttributes = @[BannerAttributes.bannerId];
    [mapping addAttributeMappingsFromArray:@[
     BannerAttributes.analytics,
     BannerAttributes.bannerId,
     BannerAttributes.bannerName,
     BannerAttributes.lastModifiedDate,
     BannerAttributes.remoteKey
     ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"stores" toKeyPath:@"stores" withMapping:[Store objectMapping]]];
    return mapping;
}

@end
