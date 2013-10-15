#import "Note.h"
#import <RestKit/RestKit.h>
#import <InnerBand/NSManagedObject+InnerBand.h>

@interface Note ()

// Private interface goes here.

@end


@implementation Note

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Note" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     NoteAttributes.body,
     NoteAttributes.createdDate,
     NoteAttributes.externalDate,
     NoteAttributes.lastModifiedDate,
     NoteAttributes.remoteKey,
     NoteAttributes.title,
     NoteAttributes.type,
     NoteAttributes.externalId
     ]];
    return mapping;
}

+ (Note*) noteWithType: (NSString*) type title: (NSString*) title {
    Note* note = [Note create];
    note.type = type;
    note.title = title;
    return note;
}

@end
