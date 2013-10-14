#import "_StoreCall.h"
#import "NSManagedObject+TCRestkit.h"

@class OrderCredit;

@interface StoreCall : _StoreCall {}
// Custom logic goes here.

+ (StoreCall *)newInstance:(Store *)store;
- (void)endCall;
- (BOOL)isCallInProgress;
- (OrderCredit *)associatedOrderObject;

@end
