#import "Note.h"
#import <RestKit.h>

@interface Note ()

// Private interface goes here.

@end


@implementation Note

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     NoteAttributes.body,
     NoteAttributes.createdDate,
     NoteAttributes.externalDate,
     NoteAttributes.lastModifiedDate,
     NoteAttributes.remoteKey,
     NoteAttributes.title,
     NoteAttributes.type
     ]];
    return mapping;
}

@end
