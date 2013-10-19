// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to StoreCall.m instead.

#import "_StoreCall.h"

const struct StoreCallAttributes StoreCallAttributes = {
	.actualEndDate = @"actualEndDate",
	.actualStartDate = @"actualStartDate",
	.associatedOrder = @"associatedOrder",
	.callTimeAdjustment = @"callTimeAdjustment",
	.externalId = @"externalId",
	.inventoryTime = @"inventoryTime",
	.lastModifiedDate = @"lastModifiedDate",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.plannedEndDate = @"plannedEndDate",
	.plannedStartDate = @"plannedStartDate",
	.remoteKey = @"remoteKey",
	.rider1 = @"rider1",
	.rider2 = @"rider2",
	.routed = @"routed",
};

const struct StoreCallRelationships StoreCallRelationships = {
	.notes = @"notes",
	.store = @"store",
	.surveyResponses = @"surveyResponses",
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
	if ([key isEqualToString:@"inventoryTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inventoryTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
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
	if ([key isEqualToString:@"plannedEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"plannedStartDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedStartDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"routedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"routed"];
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





@dynamic associatedOrder;






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





@dynamic externalId;






@dynamic inventoryTime;



- (double)inventoryTimeValue {
	NSNumber *result = [self inventoryTime];
	return [result doubleValue];
}

- (void)setInventoryTimeValue:(double)value_ {
	[self setInventoryTime:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveInventoryTimeValue {
	NSNumber *result = [self primitiveInventoryTime];
	return [result doubleValue];
}

- (void)setPrimitiveInventoryTimeValue:(double)value_ {
	[self setPrimitiveInventoryTime:[NSNumber numberWithDouble:value_]];
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






@dynamic rider1;






@dynamic rider2;






@dynamic routed;



- (BOOL)routedValue {
	NSNumber *result = [self routed];
	return [result boolValue];
}

- (void)setRoutedValue:(BOOL)value_ {
	[self setRouted:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveRoutedValue {
	NSNumber *result = [self primitiveRouted];
	return [result boolValue];
}

- (void)setPrimitiveRoutedValue:(BOOL)value_ {
	[self setPrimitiveRouted:[NSNumber numberWithBool:value_]];
}





@dynamic notes;

	
- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];
  
	[self didAccessValueForKey:@"notes"];
	return result;
}
	

@dynamic store;

	

@dynamic surveyResponses;

	
- (NSMutableSet*)surveyResponsesSet {
	[self willAccessValueForKey:@"surveyResponses"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"surveyResponses"];
  
	[self didAccessValueForKey:@"surveyResponses"];
	return result;
}
	






@end
