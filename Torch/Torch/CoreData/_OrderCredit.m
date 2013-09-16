// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCredit.m instead.

#import "_OrderCredit.h"

const struct OrderCreditAttributes OrderCreditAttributes = {
	.actualEndDate = @"actualEndDate",
	.approvalRequiredReason = @"approvalRequiredReason",
	.callTimeAdjustment = @"callTimeAdjustment",
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
	.plannedEndDate = @"plannedEndDate",
	.plannedStartDate = @"plannedStartDate",
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
	
	if ([key isEqualToString:@"actualEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"actualEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"callTimeAdjustmentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"callTimeAdjustment"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"paymentAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"paymentAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plannedEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plannedStartDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedStartDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic actualEndDate;



- (double)actualEndDateValue {
	NSNumber *result = [self actualEndDate];
	return [result doubleValue];
}

- (void)setActualEndDateValue:(double)value_ {
	[self setActualEndDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveActualEndDateValue {
	NSNumber *result = [self primitiveActualEndDate];
	return [result doubleValue];
}

- (void)setPrimitiveActualEndDateValue:(double)value_ {
	[self setPrimitiveActualEndDate:[NSNumber numberWithDouble:value_]];
}





@dynamic approvalRequiredReason;






@dynamic callTimeAdjustment;



- (double)callTimeAdjustmentValue {
	NSNumber *result = [self callTimeAdjustment];
	return [result doubleValue];
}

- (void)setCallTimeAdjustmentValue:(double)value_ {
	[self setCallTimeAdjustment:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveCallTimeAdjustmentValue {
	NSNumber *result = [self primitiveCallTimeAdjustment];
	return [result doubleValue];
}

- (void)setPrimitiveCallTimeAdjustmentValue:(double)value_ {
	[self setPrimitiveCallTimeAdjustment:[NSNumber numberWithDouble:value_]];
}





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






@dynamic plannedEndDate;



- (double)plannedEndDateValue {
	NSNumber *result = [self plannedEndDate];
	return [result doubleValue];
}

- (void)setPlannedEndDateValue:(double)value_ {
	[self setPlannedEndDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitivePlannedEndDateValue {
	NSNumber *result = [self primitivePlannedEndDate];
	return [result doubleValue];
}

- (void)setPrimitivePlannedEndDateValue:(double)value_ {
	[self setPrimitivePlannedEndDate:[NSNumber numberWithDouble:value_]];
}





@dynamic plannedStartDate;



- (double)plannedStartDateValue {
	NSNumber *result = [self plannedStartDate];
	return [result doubleValue];
}

- (void)setPlannedStartDateValue:(double)value_ {
	[self setPlannedStartDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitivePlannedStartDateValue {
	NSNumber *result = [self primitivePlannedStartDate];
	return [result doubleValue];
}

- (void)setPrimitivePlannedStartDateValue:(double)value_ {
	[self setPrimitivePlannedStartDate:[NSNumber numberWithDouble:value_]];
}





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
