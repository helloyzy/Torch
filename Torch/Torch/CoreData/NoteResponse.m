#import "NoteResponse.h"
#import <RKEntityMapping.h>
#import "Note.h"

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

+ (NoteResponse *)fromNote:(Note *)note {
    NoteResponse *result = [NoteResponse newInstance];
    result.type = note.type;
    result.message = note.title;
    [result save];
    return result;
}

@end
