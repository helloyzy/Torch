#import "_SalesRep.h"
#import "NSManagedObject+TCRestkit.h"

@interface SalesRep : _SalesRep {}
// Custom logic goes here.

+ (NSString *)getRepId;
+ (NSString *)getCoachId;

+ (SalesRep *)salesRep;

@end
