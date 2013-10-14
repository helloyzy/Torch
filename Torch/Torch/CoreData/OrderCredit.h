#import "_OrderCredit.h"
#import "NSManagedObject+TCRestkit.h"

@class Store;

@interface OrderCredit : _OrderCredit {}
// Custom logic goes here.

- (void)fillInfoFromStore:(Store *)store;

@end
