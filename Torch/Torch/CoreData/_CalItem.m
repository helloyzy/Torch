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
	if ([key isEqualToString:@"customerItemNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"customerItemNumber"];
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



- (double)customerItemNumberValue {
	NSNumber *result = [self customerItemNumber];
	return [result doubleValue];
}

- (void)setCustomerItemNumberValue:(double)value_ {
	[self setCustomerItemNumber:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveCustomerItemNumberValue {
	NSNumber *result = [self primitiveCustomerItemNumber];
	return [result doubleValue];
}

- (void)setPrimitiveCustomerItemNumberValue:(double)value_ {
	[self setPrimitiveCustomerItemNumber:[NSNumber numberWithDouble:value_]];
}





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






@dynamic name;






@dynamic packtypeDescription;






@dynamic price;






@dynamic productNumber;






@dynamic remoteKey;






@dynamic schedule;






@dynamic segment;






@dynamic tdNumber;






@dynamic uom;






@dynamic upc;






@dynamic orderCreditItem;

	






@end
