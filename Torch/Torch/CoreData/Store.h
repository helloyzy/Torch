#import "_Store.h"
#import "NSManagedObject+TCRestkit.h"

@interface Store : _Store {}
// Custom logic goes here.

- (StoreCall *)callInProgress;

+ (Store *)storeInCall;
+ (NSArray *)sortedStores;

@property(nonatomic, copy)NSString *sequenceNum;
@property(nonatomic, assign)CGFloat taxRate;

@end
