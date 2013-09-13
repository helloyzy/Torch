#import "Order.h"
#import <RestKit.h>

@interface Order ()

// Private interface goes here.

@end


@implementation Order

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
//    [mapping addAttributeMappingsFromArray:@[
//     OrderAttributes.actualEndDate,
//     OrderAttributes.actualStartDate,
//     OrderAttributes.callTimeAdjustment,
//     OrderAttributes.plannedEndDate,
//     OrderAttributes.plannedStartDate,
//     OrderAttributes.remoteKey
//     ]];
    return mapping;
}

@end
