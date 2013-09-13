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
	.order = @"order",
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
	if ([key isEqualToString:@"quantityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"quantity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
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






@dynamic overridePrice;






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






@dynamic calItem;

	

@dynamic order;

	






@end
