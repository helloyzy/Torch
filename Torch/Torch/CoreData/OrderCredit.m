#import "OrderCredit.h"
#import <RestKit.h>

@interface OrderCredit ()

// Private interface goes here.

@end


@implementation OrderCredit

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"OrderCredit" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     OrderCreditAttributes.approvalRequiredReason,
//     OrderCreditAttributes.checkNumber,
//     OrderCreditAttributes.confirmationType,
//     OrderCreditAttributes.creditType,
//     OrderCreditAttributes.customerReferenceNumber,
//     OrderCreditAttributes.hersheyReferenceNumber,
//     OrderCreditAttributes.orderCreditId,
//     OrderCreditAttributes.orderType,
//     OrderCreditAttributes.paymentAmount,
     OrderCreditAttributes.paymentMethod,
     OrderCreditAttributes.callTimeAdjustment,
     OrderCreditAttributes.plannedEndDate,
     OrderCreditAttributes.actualEndDate,
     OrderCreditAttributes.plannedStartDate
//     OrderCreditAttributes.paymentType,
//     OrderCreditAttributes.reasonCode,
//     OrderCreditAttributes.recordType,
//     OrderCreditAttributes.rejectionReason,
//     OrderCreditAttributes.signature,
//     OrderCreditAttributes.status
     ]];
//    mapping.identificationAttributes = @[OrderCreditAttributes.orderCreditId];
    return mapping;
}

@end
