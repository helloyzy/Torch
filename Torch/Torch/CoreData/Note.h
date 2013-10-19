#import "_Note.h"
#import "NSManagedObject+TCRestkit.h"

@interface Note : _Note {}

- (BOOL)isNoteNew;

+ (Note*) noteWithType: (NSString*) type title: (NSString*) title;
+ (id)newInstance:(BOOL)isExternal;

//+ (Note *)contactNote;
//+ (NSArray *)getContactNotes;

@end

