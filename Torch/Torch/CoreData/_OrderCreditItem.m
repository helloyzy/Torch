// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCreditItem.m instead.

#import "_OrderCreditItem.h"

const struct OrderCreditItemAttributes OrderCreditItemAttributes = {
	.discountPercentage = @"discountPercentage",
	.distributedItemNumber = @"distributedItemNumber",
	.markdownPercentage = @"markdownPercentage",
	.maxMarkdownPercentage = @"maxMarkdownPercentage",
	.nettAmount = @"nettAmount",
	.overridePrice = @"overridePrice",
	.quantity = @"quantity",
	.shortItemNumber = @"shortItemNumber",
	.total = @"total",
};

const struct OrderCreditItemRelationships OrderCreditItemRelationships = {
	.calItem = @"calItem",
	.orderCredit = @"orderCredit",
};

const struct OrderCreditItemFetchedProperties OrderCreditItemFetchedProperties = {
};

@implementation OrderCreditItemID
@end

@implementation _OrderCreditItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OrderCreditItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OrderCreditItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OrderCreditItem" inManagedObjectContext:moc_];
}

- (OrderCreditItemID*)objectID {
	return (OrderCreditItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"discountPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discountPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"markdownPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"markdownPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"maxMarkdownPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"maxMarkdownPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"nettAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"nettAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"overridePriceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"overridePrice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"quantityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"quantity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"totalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"total"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic discountPercentage;



- (int32_t)discountPercentageValue {
	NSNumber *result = [self discountPercentage];
	return [result intValue];
}

- (void)setDiscountPercentageValue:(int32_t)value_ {
	[self setDiscountPercentage:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDiscountPercentageValue {
	NSNumber *result = [self primitiveDiscountPercentage];
	return [result intValue];
}

- (void)setPrimitiveDiscountPercentageValue:(int32_t)value_ {
	[self setPrimitiveDiscountPercentage:[NSNumber numberWithInt:value_]];
}





@dynamic distributedItemNumber;






@dynamic markdownPercentage;



- (int32_t)markdownPercentageValue {
	NSNumber *result = [self markdownPercentage];
	return [result intValue];
}

- (void)setMarkdownPercentageValue:(int32_t)value_ {
	[self setMarkdownPercentage:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMarkdownPercentageValue {
	NSNumber *result = [self primitiveMarkdownPercentage];
	return [result intValue];
}

- (void)setPrimitiveMarkdownPercentageValue:(int32_t)value_ {
	[self setPrimitiveMarkdownPercentage:[NSNumber numberWithInt:value_]];
}





@dynamic maxMarkdownPercentage;



- (int32_t)maxMarkdownPercentageValue {
	NSNumber *result = [self maxMarkdownPercentage];
	return [result intValue];
}

- (void)setMaxMarkdownPercentageValue:(int32_t)value_ {
	[self setMaxMarkdownPercentage:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMaxMarkdownPercentageValue {
	NSNumber *result = [self primitiveMaxMarkdownPercentage];
	return [result intValue];
}

- (void)setPrimitiveMaxMarkdownPercentageValue:(int32_t)value_ {
	[self setPrimitiveMaxMarkdownPercentage:[NSNumber numberWithInt:value_]];
}





@dynamic nettAmount;



- (int32_t)nettAmountValue {
	NSNumber *result = [self nettAmount];
	return [result intValue];
}

- (void)setNettAmountValue:(int32_t)value_ {
	[self setNettAmount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNettAmountValue {
	NSNumber *result = [self primitiveNettAmount];
	return [result intValue];
}

- (void)setPrimitiveNettAmountValue:(int32_t)value_ {
	[self setPrimitiveNettAmount:[NSNumber numberWithInt:value_]];
}





@dynamic overridePrice;



- (int32_t)overridePriceValue {
	NSNumber *result = [self overridePrice];
	return [result intValue];
}

- (void)setOverridePriceValue:(int32_t)value_ {
	[self setOverridePrice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveOverridePriceValue {
	NSNumber *result = [self primitiveOverridePrice];
	return [result intValue];
}

- (void)setPrimitiveOverridePriceValue:(int32_t)value_ {
	[self setPrimitiveOverridePrice:[NSNumber numberWithInt:value_]];
}





@dynamic quantity;



- (int32_t)quantityValue {
	NSNumber *result = [self quantity];
	return [result intValue];
}

- (void)setQuantityValue:(int32_t)value_ {
	[self setQuantity:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveQuantityValue {
	NSNumber *result = [self primitiveQuantity];
	return [result intValue];
}

- (void)setPrimitiveQuantityValue:(int32_t)value_ {
	[self setPrimitiveQuantity:[NSNumber numberWithInt:value_]];
}





@dynamic shortItemNumber;






@dynamic total;



- (int32_t)totalValue {
	NSNumber *result = [self total];
	return [result intValue];
}

- (void)setTotalValue:(int32_t)value_ {
	[self setTotal:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTotalValue {
	NSNumber *result = [self primitiveTotal];
	return [result intValue];
}

- (void)setPrimitiveTotalValue:(int32_t)value_ {
	[self setPrimitiveTotal:[NSNumber numberWithInt:value_]];
}





@dynamic calItem;

	

@dynamic orderCredit;

	






@end
