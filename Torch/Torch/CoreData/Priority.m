#import "Priority.h"
#import "Store.h"
#import <RKEntityMapping.h>
#import <NSManagedObject+InnerBand.h>

@interface Priority ()

// Private interface goes here.

@end


@implementation Priority

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [super objectMapping];
    [mapping addAttributeMappingsFromArray:@[
     PriorityAttributes.accountId,
     PriorityAttributes.title
     ]];
    [mapping addAttributeMappingsFromDictionary:@{@"description" : PriorityAttributes.desp}];
    return mapping;
}

+ (NSArray *)prioritiesPerStore:(Store *)store {
    NSString * predicate = [NSString stringWithFormat:@"%@ = '%@'", PriorityAttributes.accountId, store.remoteKey];
    return [self allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[self dataStore]];
}

#pragma mark - mock data

+ (void)generateMockData:(NSString *)accountId {
    Priority *priority = [Priority newInstance];
    priority.title = @"Nota Anaota";
    priority.desp = @"$345 value product should be checked without hesitation";
    priority.accountId = accountId;
    [self save];
}

@end
