#import "StoreCall.h"
#import <RestKit/RestKit.h>
#import "Note.h"
#import "Store.h"
#import "TCUtils.h"
#import <IBFunctions.h>
#import "OrderCredit.h"
#import "NSManagedObject+TCRestkit.h"
#import <NSManagedObject+InnerBand.h>

@interface StoreCall ()

// Private interface goes here.

@end

@implementation StoreCall

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"StoreCall" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     StoreCallAttributes.actualEndDate,
     StoreCallAttributes.actualStartDate,
     StoreCallAttributes.callTimeAdjustment,
     StoreCallAttributes.lastModifiedDate,
     StoreCallAttributes.plannedEndDate,
     StoreCallAttributes.plannedStartDate,
     StoreCallAttributes.remoteKey,
     StoreCallAttributes.externalId,
     StoreCallAttributes.routed,
     StoreCallAttributes.rider1,
     StoreCallAttributes.rider2
     ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"notes" toKeyPath:@"notes" withMapping:[Note objectMapping]]];
    return mapping;
}

static NSString *STORECALL_INPROGRESS = @"_CALL_IN_PROGRESS_";

+ (StoreCall *)newInstance:(Store *)store {
    StoreCall *result = [self newInstance];
    result.store = store;
    result.plannedStartDate = curdateToMilliseconds();
    result.actualStartDate = result.plannedStartDate;
    result.callTimeAdjustment = IB_BOX_DOUBLE(0);
    result.externalId = STORECALL_INPROGRESS;
    [self save];
    return result;
}

static NSString *STORECALL_ENDCALL = @"_END_CALL_";

- (void)endCall {
    self.plannedEndDate = curdateToMilliseconds();
    self.actualEndDate = self.plannedEndDate;
    self.externalId = STORECALL_ENDCALL;
    [StoreCall save];
}

- (BOOL) isFinsihed {
    return [STORECALL_ENDCALL isEqualToString:self.externalId];
}

- (BOOL)isCallInProgress {
    return [self.externalId isEqualToString:STORECALL_INPROGRESS];
}

- (OrderCredit *)associatedOrderObject {
    NSString *predicate = [NSString stringWithFormat:@"%@ = '%@'", OrderCreditAttributes.hersheyReferenceNumber, self.associatedOrder];
    NSArray *result = [OrderCredit allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[OrderCredit dataStore]];
    return result.count > 0 ? [result objectAtIndex:0] : nil;
}

- (NSInteger)callDuration {
    CGFloat durationInMilliseconds = self.actualEndDateValue - self.actualStartDateValue;
    return (NSInteger) durationInMilliseconds / (1000.0 * 60.0);
}

- (NSArray*) decriptions {
    return @[[Note noteWithType:@"title" title: millisecondToDateStr(self.actualStartDateValue)],
             [Note noteWithType:@"title" title: millisecondToDateStr(self.inventoryTimeValue)],
             [Note noteWithType:@"title" title: millisecondToDateStr(self.actualEndDateValue)]];
}

@end
