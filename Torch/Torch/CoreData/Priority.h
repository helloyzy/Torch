#import "_Priority.h"
#import "NSManagedObject+TCRestkit.h"

@class Store;

@interface Priority : _Priority {}
// Custom logic goes here.

+ (NSArray *)prioritiesPerStore:(Store *)store;

+ (void)generateMockData:(NSString *)accountId;

@end
