// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCredit.m instead.

#import "_OrderCredit.h"

const struct OrderCreditAttributes OrderCreditAttributes = {
	.approvalRequiredReason = @"approvalRequiredReason",
	.checkNumber = @"checkNumber",
	.confirmationType = @"confirmationType",
	.creditType = @"creditType",
	.customerReferenceNumber = @"customerReferenceNumber",
	.hersheyReferenceNumber = @"hersheyReferenceNumber",
	.orderCreditId = @"orderCreditId",
	.orderType = @"orderType",
	.paymentAmount = @"paymentAmount",
	.paymentMethod = @"paymentMethod",
	.paymentType = @"paymentType",
	.reasonCode = @"reasonCode",
	.recordType = @"recordType",
	.rejectionReason = @"rejectionReason",
	.signature = @"signature",
	.status = @"status",
};

const struct OrderCreditRelationships OrderCreditRelationships = {
	.account = @"account",
	.contact = @"contact",
	.order = @"order",
	.orderCreditItems = @"orderCreditItems",
};

const struct OrderCreditFetchedProperties OrderCreditFetchedProperties = {
};

@implementation OrderCreditID
@end

@implementation _OrderCredit

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OrderCredit" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OrderCredit";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OrderCredit" inManagedObjectContext:moc_];
}

- (OrderCreditID*)objectID {
	return (OrderCreditID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"paymentAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"paymentAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic approvalRequiredReason;






@dynamic checkNumber;






@dynamic confirmationType;






@dynamic creditType;






@dynamic customerReferenceNumber;






@dynamic hersheyReferenceNumber;






@dynamic orderCreditId;






@dynamic orderType;






@dynamic paymentAmount;



- (int32_t)paymentAmountValue {
	NSNumber *result = [self paymentAmount];
	return [result intValue];
}

- (void)setPaymentAmountValue:(int32_t)value_ {
	[self setPaymentAmount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePaymentAmountValue {
	NSNumber *result = [self primitivePaymentAmount];
	return [result intValue];
}

- (void)setPrimitivePaymentAmountValue:(int32_t)value_ {
	[self setPrimitivePaymentAmount:[NSNumber numberWithInt:value_]];
}





@dynamic paymentMethod;






@dynamic paymentType;






@dynamic reasonCode;






@dynamic recordType;






@dynamic rejectionReason;






@dynamic signature;






@dynamic status;






@dynamic account;

	

@dynamic contact;

	

@dynamic order;

	

@dynamic orderCreditItems;

	
- (NSMutableSet*)orderCreditItemsSet {
	[self willAccessValueForKey:@"orderCreditItems"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"orderCreditItems"];
  
	[self didAccessValueForKey:@"orderCreditItems"];
	return result;
}
	






@end
