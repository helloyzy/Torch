// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CalItem.m instead.

#import "_CalItem.h"

const struct CalItemAttributes CalItemAttributes = {
	.active = @"active",
	.customerItemNumber = @"customerItemNumber",
	.discontinued = @"discontinued",
	.distributorItem = @"distributorItem",
	.effectiveEndDate = @"effectiveEndDate",
	.effectiveStartDate = @"effectiveStartDate",
	.maxMarkdown = @"maxMarkdown",
	.name = @"name",
	.packtypeDescription = @"packtypeDescription",
	.price = @"price",
	.productNumber = @"productNumber",
	.remoteKey = @"remoteKey",
	.schedule = @"schedule",
	.segment = @"segment",
	.tdNumber = @"tdNumber",
	.uom = @"uom",
	.upc = @"upc",
	.weight = @"weight",
};

const struct CalItemRelationships CalItemRelationships = {
	.orderCreditItem = @"orderCreditItem",
};

const struct CalItemFetchedProperties CalItemFetchedProperties = {
};

@implementation CalItemID
@end

@implementation _CalItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CalItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CalItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CalItem" inManagedObjectContext:moc_];
}

- (CalItemID*)objectID {
	return (CalItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"activeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"active"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"discontinuedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discontinued"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"distributorItemValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"distributorItem"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"effectiveEndDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"effectiveEndDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"effectiveStartDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"effectiveStartDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"maxMarkdownValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"maxMarkdown"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"weightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"weight"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic active;



- (BOOL)activeValue {
	NSNumber *result = [self active];
	return [result boolValue];
}

- (void)setActiveValue:(BOOL)value_ {
	[self setActive:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveActiveValue {
	NSNumber *result = [self primitiveActive];
	return [result boolValue];
}

- (void)setPrimitiveActiveValue:(BOOL)value_ {
	[self setPrimitiveActive:[NSNumber numberWithBool:value_]];
}





@dynamic customerItemNumber;






@dynamic discontinued;



- (BOOL)discontinuedValue {
	NSNumber *result = [self discontinued];
	return [result boolValue];
}

- (void)setDiscontinuedValue:(BOOL)value_ {
	[self setDiscontinued:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveDiscontinuedValue {
	NSNumber *result = [self primitiveDiscontinued];
	return [result boolValue];
}

- (void)setPrimitiveDiscontinuedValue:(BOOL)value_ {
	[self setPrimitiveDiscontinued:[NSNumber numberWithBool:value_]];
}





@dynamic distributorItem;



- (BOOL)distributorItemValue {
	NSNumber *result = [self distributorItem];
	return [result boolValue];
}

- (void)setDistributorItemValue:(BOOL)value_ {
	[self setDistributorItem:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveDistributorItemValue {
	NSNumber *result = [self primitiveDistributorItem];
	return [result boolValue];
}

- (void)setPrimitiveDistributorItemValue:(BOOL)value_ {
	[self setPrimitiveDistributorItem:[NSNumber numberWithBool:value_]];
}





@dynamic effectiveEndDate;



- (double)effectiveEndDateValue {
	NSNumber *result = [self effectiveEndDate];
	return [result doubleValue];
}

- (void)setEffectiveEndDateValue:(double)value_ {
	[self setEffectiveEndDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveEffectiveEndDateValue {
	NSNumber *result = [self primitiveEffectiveEndDate];
	return [result doubleValue];
}

- (void)setPrimitiveEffectiveEndDateValue:(double)value_ {
	[self setPrimitiveEffectiveEndDate:[NSNumber numberWithDouble:value_]];
}





@dynamic effectiveStartDate;



- (double)effectiveStartDateValue {
	NSNumber *result = [self effectiveStartDate];
	return [result doubleValue];
}

- (void)setEffectiveStartDateValue:(double)value_ {
	[self setEffectiveStartDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveEffectiveStartDateValue {
	NSNumber *result = [self primitiveEffectiveStartDate];
	return [result doubleValue];
}

- (void)setPrimitiveEffectiveStartDateValue:(double)value_ {
	[self setPrimitiveEffectiveStartDate:[NSNumber numberWithDouble:value_]];
}





@dynamic maxMarkdown;



- (int32_t)maxMarkdownValue {
	NSNumber *result = [self maxMarkdown];
	return [result intValue];
}

- (void)setMaxMarkdownValue:(int32_t)value_ {
	[self setMaxMarkdown:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMaxMarkdownValue {
	NSNumber *result = [self primitiveMaxMarkdown];
	return [result intValue];
}

- (void)setPrimitiveMaxMarkdownValue:(int32_t)value_ {
	[self setPrimitiveMaxMarkdown:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic packtypeDescription;






@dynamic price;



- (int32_t)priceValue {
	NSNumber *result = [self price];
	return [result intValue];
}

- (void)setPriceValue:(int32_t)value_ {
	[self setPrice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result intValue];
}

- (void)setPrimitivePriceValue:(int32_t)value_ {
	[self setPrimitivePrice:[NSNumber numberWithInt:value_]];
}





@dynamic productNumber;






@dynamic remoteKey;






@dynamic schedule;






@dynamic segment;






@dynamic tdNumber;






@dynamic uom;






@dynamic upc;






@dynamic weight;



- (int32_t)weightValue {
	NSNumber *result = [self weight];
	return [result intValue];
}

- (void)setWeightValue:(int32_t)value_ {
	[self setWeight:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWeightValue {
	NSNumber *result = [self primitiveWeight];
	return [result intValue];
}

- (void)setPrimitiveWeightValue:(int32_t)value_ {
	[self setPrimitiveWeight:[NSNumber numberWithInt:value_]];
}





@dynamic orderCreditItem;

	






@end
