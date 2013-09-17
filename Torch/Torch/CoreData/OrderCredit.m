#import "OrderCredit.h"
#import <RestKit/RestKit.h>

#import "OrderCreditItem.h"
#import "Account.h"
#import "Contact.h"

@interface OrderCredit ()

// Private interface goes here.

@end


@implementation OrderCredit

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"OrderCredit" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     OrderCreditAttributes.approvalRequiredReason,
     OrderCreditAttributes.paymentMethod,
     OrderCreditAttributes.callTimeAdjustment,
     OrderCreditAttributes.plannedEndDate,
     OrderCreditAttributes.actualEndDate,
     OrderCreditAttributes.plannedStartDate
     ]];
//    mapping.identificationAttributes = @[OrderCreditAttributes.orderCreditId];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"orderCreditItems" toKeyPath:@"orderCreditItems" withMapping:[OrderCreditItem objectMapping]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"contact" toKeyPath:@"contact" withMapping:[Contact objectMappingForOrder]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"account" toKeyPath:@"account" withMapping:[Account objectMapping]]];
    return mapping;
}

@end
