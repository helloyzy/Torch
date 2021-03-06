// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Promotion.m instead.

#import "_Promotion.h"

const struct PromotionAttributes PromotionAttributes = {
	.accountId = @"accountId",
	.desp = @"desp",
	.discountAmount = @"discountAmount",
	.discountPercentage = @"discountPercentage",
	.endDate = @"endDate",
	.orderItemDiscount = @"orderItemDiscount",
	.startDate = @"startDate",
	.title = @"title",
};

const struct PromotionRelationships PromotionRelationships = {
	.promotionItem = @"promotionItem",
};

const struct PromotionFetchedProperties PromotionFetchedProperties = {
};

@implementation PromotionID
@end

@implementation _Promotion

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Promotion" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Promotion";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Promotion" inManagedObjectContext:moc_];
}

- (PromotionID*)objectID {
	return (PromotionID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"discountAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discountAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"discountPercentageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discountPercentage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"orderItemDiscountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"orderItemDiscount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic accountId;






@dynamic desp;






@dynamic discountAmount;



- (double)discountAmountValue {
	NSNumber *result = [self discountAmount];
	return [result doubleValue];
}

- (void)setDiscountAmountValue:(double)value_ {
	[self setDiscountAmount:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveDiscountAmountValue {
	NSNumber *result = [self primitiveDiscountAmount];
	return [result doubleValue];
}

- (void)setPrimitiveDiscountAmountValue:(double)value_ {
	[self setPrimitiveDiscountAmount:[NSNumber numberWithDouble:value_]];
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





@dynamic endDate;






@dynamic orderItemDiscount;



- (BOOL)orderItemDiscountValue {
	NSNumber *result = [self orderItemDiscount];
	return [result boolValue];
}

- (void)setOrderItemDiscountValue:(BOOL)value_ {
	[self setOrderItemDiscount:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveOrderItemDiscountValue {
	NSNumber *result = [self primitiveOrderItemDiscount];
	return [result boolValue];
}

- (void)setPrimitiveOrderItemDiscountValue:(BOOL)value_ {
	[self setPrimitiveOrderItemDiscount:[NSNumber numberWithBool:value_]];
}





@dynamic startDate;






@dynamic title;






@dynamic promotionItem;

	
- (NSMutableSet*)promotionItemSet {
	[self willAccessValueForKey:@"promotionItem"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"promotionItem"];
  
	[self didAccessValueForKey:@"promotionItem"];
	return result;
}
	






@end
