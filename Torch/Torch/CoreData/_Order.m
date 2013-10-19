// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Order.m instead.

#import "_Order.h"

const struct OrderAttributes OrderAttributes = {
	.actualEndDate = @"actualEndDate",
	.actualStartDate = @"actualStartDate",
	.callTimeAdjustment = @"callTimeAdjustment",
	.paymentAmount = @"paymentAmount",
	.plannedEndDate = @"plannedEndDate",
	.plannedStartDate = @"plannedStartDate",
	.remoteKey = @"remoteKey",
};

const struct OrderRelationships OrderRelationships = {
	.orderCredits = @"orderCredits",
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

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"actualEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"actualEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"actualStartDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"actualStartDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"callTimeAdjustmentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"callTimeAdjustment"];
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





@dynamic actualStartDate;



- (double)actualStartDateValue {
	NSNumber *result = [self actualStartDate];
	return [result doubleValue];
}

- (void)setActualStartDateValue:(double)value_ {
	[self setActualStartDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveActualStartDateValue {
	NSNumber *result = [self primitiveActualStartDate];
	return [result doubleValue];
}

- (void)setPrimitiveActualStartDateValue:(double)value_ {
	[self setPrimitiveActualStartDate:[NSNumber numberWithDouble:value_]];
}





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





@dynamic remoteKey;






@dynamic orderCredits;

	
- (NSMutableSet*)orderCreditsSet {
	[self willAccessValueForKey:@"orderCredits"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"orderCredits"];
  
	[self didAccessValueForKey:@"orderCredits"];
	return result;
}
	






@end
