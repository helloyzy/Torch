#import "OrderCredit.h"
#import <RestKit.h>

@interface OrderCredit ()

// Private interface goes here.

@end


@implementation OrderCredit

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    mapping.identificationAttributes = @[OrderCreditAttributes.orderCreditId];
    [mapping addAttributeMappingsFromArray:@[
     OrderCreditAttributes.approvalRequiredReason,
     OrderCreditAttributes.checkNumber,
     OrderCreditAttributes.confirmationType,
     OrderCreditAttributes.creditType,
     OrderCreditAttributes.customerReferenceNumber,
     OrderCreditAttributes.hersheyReferenceNumber,
     OrderCreditAttributes.orderCreditId,
     OrderCreditAttributes.orderType,
     OrderCreditAttributes.paymentAmount,
     OrderCreditAttributes.paymentMethod,
     OrderCreditAttributes.paymentType,
     OrderCreditAttributes.reasonCode,
     OrderCreditAttributes.recordType,
     OrderCreditAttributes.rejectionReason,
     OrderCreditAttributes.signature,
     OrderCreditAttributes.status
     ]];
    return mapping;
}

@end
