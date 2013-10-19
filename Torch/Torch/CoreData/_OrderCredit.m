// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCredit.m instead.

#import "_OrderCredit.h"

const struct OrderCreditAttributes OrderCreditAttributes = {
	.actualEndDate = @"actualEndDate",
	.approvalRequiredReason = @"approvalRequiredReason",
	.callId = @"callId",
	.callTimeAdjustment = @"callTimeAdjustment",
	.checkNumber = @"checkNumber",
	.confirmationType = @"confirmationType",
	.creditType = @"creditType",
	.customerReferenceNumber = @"customerReferenceNumber",
	.discountPercent = @"discountPercent",
	.hersheyReferenceNumber = @"hersheyReferenceNumber",
	.latitude = @"latitude",
	.longitude = @"longitude",
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
	.totalDiscountAmount = @"totalDiscountAmount",
};

const struct OrderCreditRelationships OrderCreditRelationships = {
	.account = @"account",
	.contact = @"contact",
	.notes = @"notes",
	.order = @"order",
	.orderCreditItems = @"orderCreditItems",
	.surveyResponse = @"surveyResponse",
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

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"actualEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"actualEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"callTimeAdjustmentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"callTimeAdjustment"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"discountPercentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discountPercent"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"paymentAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"paymentAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"plannedEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"plannedStartDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedStartDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"totalDiscountAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalDiscountAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
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






@dynamic callId;






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






@dynamic discountPercent;



- (double)discountPercentValue {
	NSNumber *result = [self discountPercent];
	return [result doubleValue];
}

- (void)setDiscountPercentValue:(double)value_ {
	[self setDiscountPercent:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveDiscountPercentValue {
	NSNumber *result = [self primitiveDiscountPercent];
	return [result doubleValue];
}

- (void)setPrimitiveDiscountPercentValue:(double)value_ {
	[self setPrimitiveDiscountPercent:[NSNumber numberWithDouble:value_]];
}





@dynamic hersheyReferenceNumber;






@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





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






@dynamic totalDiscountAmount;



- (double)totalDiscountAmountValue {
	NSNumber *result = [self totalDiscountAmount];
	return [result doubleValue];
}

- (void)setTotalDiscountAmountValue:(double)value_ {
	[self setTotalDiscountAmount:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveTotalDiscountAmountValue {
	NSNumber *result = [self primitiveTotalDiscountAmount];
	return [result doubleValue];
}

- (void)setPrimitiveTotalDiscountAmountValue:(double)value_ {
	[self setPrimitiveTotalDiscountAmount:[NSNumber numberWithDouble:value_]];
}





@dynamic account;

	

@dynamic contact;

	

@dynamic notes;

	
- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];
  
	[self didAccessValueForKey:@"notes"];
	return result;
}
	

@dynamic order;

	

@dynamic orderCreditItems;

	
- (NSMutableSet*)orderCreditItemsSet {
	[self willAccessValueForKey:@"orderCreditItems"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"orderCreditItems"];
  
	[self didAccessValueForKey:@"orderCreditItems"];
	return result;
}
	

@dynamic surveyResponse;

	
- (NSMutableSet*)surveyResponseSet {
	[self willAccessValueForKey:@"surveyResponse"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"surveyResponse"];
  
	[self didAccessValueForKey:@"surveyResponse"];
	return result;
}
	






@end
