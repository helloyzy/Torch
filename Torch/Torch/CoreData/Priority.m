#import "Priority.h"
#import <RKEntityMapping.h>

@interface Priority ()

// Private interface goes here.

@end


@implementation Priority

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [super objectMapping];
    [mapping addAttributeMappingsFromArray:@[
     PriorityAttributes.accountId,
     PriorityAttributes.title
     ]];
    [mapping addAttributeMappingsFromDictionary:@{@"description" : PriorityAttributes.desp}];
    return mapping;
}

@end
