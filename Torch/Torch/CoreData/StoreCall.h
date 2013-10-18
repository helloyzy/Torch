#import "_StoreCall.h"
#import "NSManagedObject+TCRestkit.h"

@class OrderCredit;

@interface StoreCall : _StoreCall {}
// Custom logic goes here.

+ (StoreCall *)newInstance:(Store *)store;
- (void)startCall;
- (void)endCall;
- (BOOL)isCallInProgress;
- (OrderCredit *)associatedOrderObject;
- (NSInteger)callDuration;
- (NSArray*) decriptions;
- (BOOL) isFinsihed;

@end
