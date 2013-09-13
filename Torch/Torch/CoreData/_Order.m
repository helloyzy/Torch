// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Order.m instead.

#import "_Order.h"

const struct OrderAttributes OrderAttributes = {
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

const struct OrderRelationships OrderRelationships = {
	.account = @"account",
	.contact = @"contact",
	.orderCreditItems = @"orderCreditItems",
};

const struct OrderFetchedProperties OrderFetchedProperties = {
};

@implementation OrderID
@end

@implementation _Order

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Order";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Order" inManagedObjectContext:moc_];
}

- (OrderID*)objectID {
	return (OrderID*)[super objectID];
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



- (double)paymentAmountValue {
	NSNumber *result = [self paymentAmount];
	return [result doubleValue];
}

- (void)setPaymentAmountValue:(double)value_ {
	[self setPaymentAmount:[NSNumber numberWithDouble:value_]];
}

- (double)primitivePaymentAmountValue {
	NSNumber *result = [self primitivePaymentAmount];
	return [result doubleValue];
}

- (void)setPrimitivePaymentAmountValue:(double)value_ {
	[self setPrimitivePaymentAmount:[NSNumber numberWithDouble:value_]];
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

	

@dynamic orderCreditItems;

	
- (NSMutableSet*)orderCreditItemsSet {
	[self willAccessValueForKey:@"orderCreditItems"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"orderCreditItems"];
  
	[self didAccessValueForKey:@"orderCreditItems"];
	return result;
}
	






@end
