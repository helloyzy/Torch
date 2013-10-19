#import "_Contact.h"
#import "NSManagedObject+TCRestkit.h"

@interface Contact : _Contact {}
// Custom logic goes here.

- (BOOL)isContactNew;

+ (RKEntityMapping *)objectMappingForOrder;

@end
