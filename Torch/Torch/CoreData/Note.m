#import "Note.h"
#import <RestKit/RestKit.h>
#import <InnerBand/NSManagedObject+InnerBand.h>

#define CONTACT_NOTE_REMOTEKEY @"CONTACT_NOTE_REMOTEKEY"

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
    Note* note = [Note newInstance];
    note.type = type;
    note.title = title;
    [note save];
    return note;
}

+ (Note *)contactNote {
    Note *result = [Note newInstance];
    result.remoteKey = CONTACT_NOTE_REMOTEKEY;
    [result save];
    return result;
}

+ (NSArray *)getContactNotes {
    NSString * predicate = [NSString stringWithFormat:@"%@ = '%@'", NoteAttributes.remoteKey, CONTACT_NOTE_REMOTEKEY];
    return [self allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[self dataStore]];
}

@end
