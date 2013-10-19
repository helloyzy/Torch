#import "_OrderCredit.h"
#import "NSManagedObject+TCRestkit.h"

@class StoreCall;

@interface OrderCredit : _OrderCredit {}
// Custom logic goes here.

- (void)orderDelivered;
- (void)completeOrder:(StoreCall *)call;
// Whether user has created an order
- (BOOL)isOrderCreated;


+ (OrderCredit *)newInstance:(StoreCall *)call;
+ (OrderCredit *)nextOrderToDeliver;


@end
