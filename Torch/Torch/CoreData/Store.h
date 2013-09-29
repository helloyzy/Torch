#import "_Store.h"
#import "NSManagedObject+TCRestkit.h"

@interface Store : _Store {}
// Custom logic goes here.

- (StoreCall *)callInProgress;

+ (Store *)storeInCall;

@property(nonatomic, copy)NSString *sequenceNum;
@property(nonatomic, assign)CGFloat taxRate;

@end
