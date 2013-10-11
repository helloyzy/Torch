#import "_StoreCall.h"
#import "NSManagedObject+TCRestkit.h"

@interface StoreCall : _StoreCall {}
// Custom logic goes here.

+ (StoreCall *)newInstance:(Store *)store;
- (void)endCall;
- (BOOL)isCallInProgress;

@end
