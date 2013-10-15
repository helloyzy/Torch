#import "_NoteResponse.h"
#import "NSManagedObject+TCRestkit.h"

@class Note;

@interface NoteResponse : _NoteResponse {}
// Custom logic goes here.

+ (NoteResponse *)fromNote:(Note *)note;

@end
