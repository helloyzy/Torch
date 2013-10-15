#import "_OrderCredit.h"
#import "NSManagedObject+TCRestkit.h"

@class Store, StoreCall;

@interface OrderCredit : _OrderCredit {}
// Custom logic goes here.

- (void)fillInfoFromStore:(Store *)store call:(StoreCall *)call;

@end
