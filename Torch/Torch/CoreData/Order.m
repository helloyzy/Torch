#import "Order.h"
#import <RestKit.h>

@interface Order ()

// Private interface goes here.

@end


@implementation Order

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     OrderAttributes.approvalRequiredReason
     ]];
    return mapping;
}

@end
