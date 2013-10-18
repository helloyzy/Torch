#import "_OrderCredit.h"
#import "NSManagedObject+TCRestkit.h"

@class StoreCall;

@interface OrderCredit : _OrderCredit {}
// Custom logic goes here.

- (void)fillInfoFromCall:(StoreCall *)call;

+ (OrderCredit *)newInstance:(StoreCall *)call;

@end
