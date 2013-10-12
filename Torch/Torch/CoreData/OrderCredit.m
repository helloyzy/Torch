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
//    [mapping addAttributeMappingsFromArray:@[
//     OrderCreditAttributes.approvalRequiredReason,
//     OrderCreditAttributes.paymentMethod,
//     OrderCreditAttributes.callTimeAdjustment,
//     OrderCreditAttributes.plannedEndDate,
//     OrderCreditAttributes.actualEndDate,
//     OrderCreditAttributes.plannedStartDate
//     ]];
    [mapping addAttributeMappingsFromArray:@[OrderCreditAttributes.paymentAmount,
     OrderCreditAttributes.reasonCode,
     OrderCreditAttributes.orderCreditId,
     OrderCreditAttributes.confirmationType,
     OrderCreditAttributes.creditType,
     OrderCreditAttributes.paymentType,
     OrderCreditAttributes.signature,
     OrderCreditAttributes.recordType,
     OrderCreditAttributes.customerReferenceNumber,
     OrderCreditAttributes.hersheyReferenceNumber,
     OrderCreditAttributes.status,
     OrderCreditAttributes.discountPercent,
     OrderCreditAttributes.totalDiscountAmount,
     OrderCreditAttributes.callId,
     OrderCreditAttributes.latitude,
     OrderCreditAttributes.longitude
    ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"orderCreditItems" toKeyPath:@"orderCreditItems" withMapping:[OrderCreditItem objectMapping]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"contact" toKeyPath:@"contact" withMapping:[Contact objectMappingForOrder]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"account" toKeyPath:@"account" withMapping:[Account objectMapping]]];
    return mapping;
}

@end
