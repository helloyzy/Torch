#import "Banner.h"
#import <RestKit.h>

@interface Banner ()

// Private interface goes here.

@end


@implementation Banner

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
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
