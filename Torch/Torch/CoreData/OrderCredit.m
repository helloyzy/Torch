#import "OrderCredit.h"
#import <RestKit.h>

@interface OrderCredit ()

// Private interface goes here.

@end


@implementation OrderCredit

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
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
