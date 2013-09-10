// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to StoreCall.m instead.

#import "_StoreCall.h"

const struct StoreCallAttributes StoreCallAttributes = {
	.actualEndDate = @"actualEndDate",
	.actualStartDate = @"actualStartDate",
	.callTimeAdjustment = @"callTimeAdjustment",
	.lastModifiedDate = @"lastModifiedDate",
	.plannedEndDate = @"plannedEndDate",
	.plannedStartDate = @"plannedStartDate",
	.remoteKey = @"remoteKey",
};

const struct StoreCallRelationships StoreCallRelationships = {
	.notes = @"notes",
	.store = @"store",
};

const struct StoreCallFetchedProperties StoreCallFetchedProperties = {
};

@implementation StoreCallID
@end

@implementation _StoreCall

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"StoreCall" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"StoreCall";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"StoreCall" inManagedObjectContext:moc_];
}

- (StoreCallID*)objectID {
	return (StoreCallID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"actualEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"actualEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"actualStartDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"actualStartDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"callTimeAdjustmentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"callTimeAdjustment"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
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





@dynamic lastModifiedDate;



- (double)lastModifiedDateValue {
	NSNumber *result = [self lastModifiedDate];
	return [result doubleValue];
}

- (void)setLastModifiedDateValue:(double)value_ {
	[self setLastModifiedDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLastModifiedDateValue {
	NSNumber *result = [self primitiveLastModifiedDate];
	return [result doubleValue];
}

- (void)setPrimitiveLastModifiedDateValue:(double)value_ {
	[self setPrimitiveLastModifiedDate:[NSNumber numberWithDouble:value_]];
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






@dynamic notes;

	
- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];
  
	[self didAccessValueForKey:@"notes"];
	return result;
}
	

@dynamic store;

	






@end
