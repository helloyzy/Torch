#import "Banner.h"
#import <RestKit.h>

@interface Banner ()

// Private interface goes here.

@end


@implementation Banner

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    mapping.identificationAttributes = @[BannerAttributes.bannerId];
    [mapping addAttributeMappingsFromArray:@[
     BannerAttributes.analytics,
     BannerAttributes.bannerId,
     BannerAttributes.bannerName,
     BannerAttributes.lastModifiedDate,
     BannerAttributes.remoteKey
     ]];
    return mapping;
}

@end
