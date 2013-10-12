#import "_Promotion.h"
#import "NSManagedObject+TCRestkit.h"
#import "TCPromotionItem.h"

@class Store;

@interface Promotion : _Promotion {}
// Custom logic goes here.

@property(nonatomic, readonly, assign)PromotionType type;

// + (NSArray *)convertToTCPromotions:(NSArray *)promotions;
+ (NSArray *)promotionsPerStore:(Store *)store;

+ (void)generateMockData:(NSString *)storeId;

@end
