// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PromotionItem.m instead.

#import "_PromotionItem.h"

const struct PromotionItemAttributes PromotionItemAttributes = {
	.productDescription = @"productDescription",
	.productNumber = @"productNumber",
	.promotionItemListPrice = @"promotionItemListPrice",
	.salesPrice = @"salesPrice",
};

const struct PromotionItemRelationships PromotionItemRelationships = {
	.promotion = @"promotion",
};

const struct PromotionItemFetchedProperties PromotionItemFetchedProperties = {
};

@implementation PromotionItemID
@end

@implementation _PromotionItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PromotionItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PromotionItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PromotionItem" inManagedObjectContext:moc_];
}

- (PromotionItemID*)objectID {
	return (PromotionItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"promotionItemListPriceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"promotionItemListPrice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"salesPriceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"salesPrice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic productDescription;






@dynamic productNumber;






@dynamic promotionItemListPrice;



- (double)promotionItemListPriceValue {
	NSNumber *result = [self promotionItemListPrice];
	return [result doubleValue];
}

- (void)setPromotionItemListPriceValue:(double)value_ {
	[self setPromotionItemListPrice:[NSNumber numberWithDouble:value_]];
}

- (double)primitivePromotionItemListPriceValue {
	NSNumber *result = [self primitivePromotionItemListPrice];
	return [result doubleValue];
}

- (void)setPrimitivePromotionItemListPriceValue:(double)value_ {
	[self setPrimitivePromotionItemListPrice:[NSNumber numberWithDouble:value_]];
}





@dynamic salesPrice;



- (double)salesPriceValue {
	NSNumber *result = [self salesPrice];
	return [result doubleValue];
}

- (void)setSalesPriceValue:(double)value_ {
	[self setSalesPrice:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveSalesPriceValue {
	NSNumber *result = [self primitiveSalesPrice];
	return [result doubleValue];
}

- (void)setPrimitiveSalesPriceValue:(double)value_ {
	[self setPrimitiveSalesPrice:[NSNumber numberWithDouble:value_]];
}





@dynamic promotion;

	






@end
