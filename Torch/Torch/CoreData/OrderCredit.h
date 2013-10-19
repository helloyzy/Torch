#import "_OrderCredit.h"
#import "NSManagedObject+TCRestkit.h"

@class StoreCall;

@interface OrderCredit : _OrderCredit {}
// Custom logic goes here.

- (void)orderDelivered;
- (void)completeOrder:(StoreCall *)call;

+ (OrderCredit *)newInstance:(StoreCall *)call;
+ (OrderCredit *)nextOrderToDeliver;


@end
