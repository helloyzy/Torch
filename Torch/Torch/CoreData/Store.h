#import "_Store.h"
#import "NSManagedObject+TCRestkit.h"
#import <MapKit/MapKit.h>

@interface Store : _Store<MKAnnotation> {}
// Custom logic goes here.

- (BOOL)hasLocation;
- (StoreCall *)callInProgress;

+ (Store *)storeInCall;
+ (NSArray *)sortedStores;

@property(nonatomic, copy)NSString *sequenceNum;
@property(nonatomic, assign)CGFloat taxRate;

@end
