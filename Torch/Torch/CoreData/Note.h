#import "_Note.h"
#import "NSManagedObject+TCRestkit.h"

@interface Note : _Note {}

+ (Note*) noteWithType: (NSString*) type title: (NSString*) title;
+ (Note *)contactNote;
+ (NSArray *)getContactNotes;


@end

