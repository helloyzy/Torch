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

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"discountPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discountPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"markdownPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"markdownPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"maxMarkdownPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"maxMarkdownPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"nettAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"nettAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"overridePriceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"overridePrice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"quantityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"quantity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"totalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"total"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic discountPercentage;



- (double)discountPercentageValue {
	NSNumber *result = [self discountPercentage];
	return [result doubleValue];
}

- (void)setDiscountPercentageValue:(double)value_ {
	[self setDiscountPercentage:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveDiscountPercentageValue {
	NSNumber *result = [self primitiveDiscountPercentage];
	return [result doubleValue];
}

- (void)setPrimitiveDiscountPercentageValue:(double)value_ {
	[self setPrimitiveDiscountPercentage:[NSNumber numberWithDouble:value_]];
}





@dynamic distributedItemNumber;






@dynamic markdownPercentage;



- (double)markdownPercentageValue {
	NSNumber *result = [self markdownPercentage];
	return [result doubleValue];
}

- (void)setMarkdownPercentageValue:(double)value_ {
	[self setMarkdownPercentage:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMarkdownPercentageValue {
	NSNumber *result = [self primitiveMarkdownPercentage];
	return [result doubleValue];
}

- (void)setPrimitiveMarkdownPercentageValue:(double)value_ {
	[self setPrimitiveMarkdownPercentage:[NSNumber numberWithDouble:value_]];
}





@dynamic maxMarkdownPercentage;



- (double)maxMarkdownPercentageValue {
	NSNumber *result = [self maxMarkdownPercentage];
	return [result doubleValue];
}

- (void)setMaxMarkdownPercentageValue:(double)value_ {
	[self setMaxMarkdownPercentage:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMaxMarkdownPercentageValue {
	NSNumber *result = [self primitiveMaxMarkdownPercentage];
	return [result doubleValue];
}

- (void)setPrimitiveMaxMarkdownPercentageValue:(double)value_ {
	[self setPrimitiveMaxMarkdownPercentage:[NSNumber numberWithDouble:value_]];
}





@dynamic nettAmount;



- (double)nettAmountValue {
	NSNumber *result = [self nettAmount];
	return [result doubleValue];
}

- (void)setNettAmountValue:(double)value_ {
	[self setNettAmount:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveNettAmountValue {
	NSNumber *result = [self primitiveNettAmount];
	return [result doubleValue];
}

- (void)setPrimitiveNettAmountValue:(double)value_ {
	[self setPrimitiveNettAmount:[NSNumber numberWithDouble:value_]];
}





@dynamic overridePrice;



- (double)overridePriceValue {
	NSNumber *result = [self overridePrice];
	return [result doubleValue];
}

- (void)setOverridePriceValue:(double)value_ {
	[self setOverridePrice:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveOverridePriceValue {
	NSNumber *result = [self primitiveOverridePrice];
	return [result doubleValue];
}

- (void)setPrimitiveOverridePriceValue:(double)value_ {
	[self setPrimitiveOverridePrice:[NSNumber numberWithDouble:value_]];
}





@dynamic quantity;



- (double)quantityValue {
	NSNumber *result = [self quantity];
	return [result doubleValue];
}

- (void)setQuantityValue:(double)value_ {
	[self setQuantity:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveQuantityValue {
	NSNumber *result = [self primitiveQuantity];
	return [result doubleValue];
}

- (void)setPrimitiveQuantityValue:(double)value_ {
	[self setPrimitiveQuantity:[NSNumber numberWithDouble:value_]];
}





@dynamic shortItemNumber;






@dynamic total;



- (double)totalValue {
	NSNumber *result = [self total];
	return [result doubleValue];
}

- (void)setTotalValue:(double)value_ {
	[self setTotal:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveTotalValue {
	NSNumber *result = [self primitiveTotal];
	return [result doubleValue];
}

- (void)setPrimitiveTotalValue:(double)value_ {
	[self setPrimitiveTotal:[NSNumber numberWithDouble:value_]];
}





@dynamic calItem;

	

@dynamic orderCredit;

	






@end
