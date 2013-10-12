// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.m instead.

#import "_Product.h"

const struct ProductAttributes ProductAttributes = {
	.brand_Cd = @"brand_Cd",
	.brand_Description = @"brand_Description",
	.combined_Packtype_Cd = @"combined_Packtype_Cd",
	.combined_Packtype_Description = @"combined_Packtype_Description",
	.desp = @"desp",
	.dimension_unit = @"dimension_unit",
	.item_Id = @"item_Id",
	.item_Status_Description = @"item_Status_Description",
	.item_Status_code = @"item_Status_code",
	.item_Weight = @"item_Weight",
	.item_Width = @"item_Width",
	.item_height = @"item_height",
	.item_length = @"item_length",
	.name = @"name",
	.overbrand_Cd = @"overbrand_Cd",
	.overbrand_description = @"overbrand_description",
	.packtypeDescription = @"packtypeDescription",
	.packtype_Cd = @"packtype_Cd",
	.packtype_Description = @"packtype_Description",
	.price = @"price",
	.productNumber = @"productNumber",
	.product_Number = @"product_Number",
	.product_code = @"product_code",
	.product_division = @"product_division",
	.product_division_description = @"product_division_description",
	.sAP_Material_Type_FERT = @"sAP_Material_Type_FERT",
	.sales_org = @"sales_org",
	.season_Cd = @"season_Cd",
	.season_Description = @"season_Description",
	.short_material_number = @"short_material_number",
	.spanishDescription = @"spanishDescription",
	.subPacktype_Cd = @"subPacktype_Cd",
	.subpacktype_description = @"subpacktype_description",
	.uPC_GROUP_PRODUCT_UOM_maybe = @"uPC_GROUP_PRODUCT_UOM_maybe",
	.uPC_maybe = @"uPC_maybe",
	.upc = @"upc",
	.version = @"version",
	.weight_unit_of_Measure = @"weight_unit_of_Measure",
};

const struct ProductRelationships ProductRelationships = {
};

const struct ProductFetchedProperties ProductFetchedProperties = {
};

@implementation ProductID
@end

@implementation _Product

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Product";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc_];
}

- (ProductID*)objectID {
	return (ProductID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"item_IdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"item_Id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"item_WeightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"item_Weight"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"item_WidthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"item_Width"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"item_heightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"item_height"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"item_lengthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"item_length"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic brand_Cd;






@dynamic brand_Description;






@dynamic combined_Packtype_Cd;






@dynamic combined_Packtype_Description;






@dynamic desp;






@dynamic dimension_unit;






@dynamic item_Id;



- (double)item_IdValue {
	NSNumber *result = [self item_Id];
	return [result doubleValue];
}

- (void)setItem_IdValue:(double)value_ {
	[self setItem_Id:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveItem_IdValue {
	NSNumber *result = [self primitiveItem_Id];
	return [result doubleValue];
}

- (void)setPrimitiveItem_IdValue:(double)value_ {
	[self setPrimitiveItem_Id:[NSNumber numberWithDouble:value_]];
}





@dynamic item_Status_Description;






@dynamic item_Status_code;






@dynamic item_Weight;



- (double)item_WeightValue {
	NSNumber *result = [self item_Weight];
	return [result doubleValue];
}

- (void)setItem_WeightValue:(double)value_ {
	[self setItem_Weight:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveItem_WeightValue {
	NSNumber *result = [self primitiveItem_Weight];
	return [result doubleValue];
}

- (void)setPrimitiveItem_WeightValue:(double)value_ {
	[self setPrimitiveItem_Weight:[NSNumber numberWithDouble:value_]];
}





@dynamic item_Width;



- (double)item_WidthValue {
	NSNumber *result = [self item_Width];
	return [result doubleValue];
}

- (void)setItem_WidthValue:(double)value_ {
	[self setItem_Width:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveItem_WidthValue {
	NSNumber *result = [self primitiveItem_Width];
	return [result doubleValue];
}

- (void)setPrimitiveItem_WidthValue:(double)value_ {
	[self setPrimitiveItem_Width:[NSNumber numberWithDouble:value_]];
}





@dynamic item_height;



- (double)item_heightValue {
	NSNumber *result = [self item_height];
	return [result doubleValue];
}

- (void)setItem_heightValue:(double)value_ {
	[self setItem_height:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveItem_heightValue {
	NSNumber *result = [self primitiveItem_height];
	return [result doubleValue];
}

- (void)setPrimitiveItem_heightValue:(double)value_ {
	[self setPrimitiveItem_height:[NSNumber numberWithDouble:value_]];
}





@dynamic item_length;



- (double)item_lengthValue {
	NSNumber *result = [self item_length];
	return [result doubleValue];
}

- (void)setItem_lengthValue:(double)value_ {
	[self setItem_length:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveItem_lengthValue {
	NSNumber *result = [self primitiveItem_length];
	return [result doubleValue];
}

- (void)setPrimitiveItem_lengthValue:(double)value_ {
	[self setPrimitiveItem_length:[NSNumber numberWithDouble:value_]];
}





@dynamic name;






@dynamic overbrand_Cd;






@dynamic overbrand_description;






@dynamic packtypeDescription;






@dynamic packtype_Cd;






@dynamic packtype_Description;






@dynamic price;



- (double)priceValue {
	NSNumber *result = [self price];
	return [result doubleValue];
}

- (void)setPriceValue:(double)value_ {
	[self setPrice:[NSNumber numberWithDouble:value_]];
}

- (double)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result doubleValue];
}

- (void)setPrimitivePriceValue:(double)value_ {
	[self setPrimitivePrice:[NSNumber numberWithDouble:value_]];
}





@dynamic productNumber;






@dynamic product_Number;






@dynamic product_code;






@dynamic product_division;






@dynamic product_division_description;






@dynamic sAP_Material_Type_FERT;






@dynamic sales_org;






@dynamic season_Cd;






@dynamic season_Description;






@dynamic short_material_number;






@dynamic spanishDescription;






@dynamic subPacktype_Cd;






@dynamic subpacktype_description;






@dynamic uPC_GROUP_PRODUCT_UOM_maybe;






@dynamic uPC_maybe;






@dynamic upc;






@dynamic version;






@dynamic weight_unit_of_Measure;











@end
