#import "NoteResponse.h"
#import <RKEntityMapping.h>

@interface NoteResponse ()

// Private interface goes here.

@end


@implementation NoteResponse

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [super objectMapping];
    [mapping addAttributeMappingsFromArray:@[NoteResponseAttributes.message,
     NoteResponseAttributes.type]];
    return mapping;
}

@end
