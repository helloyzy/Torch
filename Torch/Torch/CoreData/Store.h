#import "_Store.h"
#import "NSManagedObject+TCRestkit.h"

@interface Store : _Store {}
// Custom logic goes here.

- (StoreCall *)callInProgress;
@property(nonatomic, copy)NSString *sequenceNum;

@end
