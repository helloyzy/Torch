// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.h instead.

#import <CoreData/CoreData.h>


extern const struct ProductAttributes {
	__unsafe_unretained NSString *brand_Cd;
	__unsafe_unretained NSString *brand_Description;
	__unsafe_unretained NSString *combined_Packtype_Cd;
	__unsafe_unretained NSString *combined_Packtype_Description;
	__unsafe_unretained NSString *desp;
	__unsafe_unretained NSString *dimension_unit;
	__unsafe_unretained NSString *item_Id;
	__unsafe_unretained NSString *item_Status_Description;
	__unsafe_unretained NSString *item_Status_code;
	__unsafe_unretained NSString *item_Weight;
	__unsafe_unretained NSString *item_Width;
	__unsafe_unretained NSString *item_height;
	__unsafe_unretained NSString *item_length;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *overbrand_Cd;
	__unsafe_unretained NSString *overbrand_description;
	__unsafe_unretained NSString *packtype_Cd;
	__unsafe_unretained NSString *packtype_Description;
	__unsafe_unretained NSString *product_Number;
	__unsafe_unretained NSString *product_code;
	__unsafe_unretained NSString *product_division;
	__unsafe_unretained NSString *product_division_description;
	__unsafe_unretained NSString *sAP_Material_Type_FERT;
	__unsafe_unretained NSString *sales_org;
	__unsafe_unretained NSString *season_Cd;
	__unsafe_unretained NSString *season_Description;
	__unsafe_unretained NSString *short_material_number;
	__unsafe_unretained NSString *subPacktype_Cd;
	__unsafe_unretained NSString *subpacktype_description;
	__unsafe_unretained NSString *uPC_GROUP_PRODUCT_UOM_maybe;
	__unsafe_unretained NSString *uPC_maybe;
	__unsafe_unretained NSString *version;
	__unsafe_unretained NSString *weight_unit_of_Measure;
} ProductAttributes;

extern const struct ProductRelationships {
} ProductRelationships;

extern const struct ProductFetchedProperties {
} ProductFetchedProperties;




































@interface ProductID : NSManagedObjectID {}
@end

@interface _Product : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ProductID*)objectID;





@property (nonatomic, strong) NSString* brand_Cd;



//- (BOOL)validateBrand_Cd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* brand_Description;



//- (BOOL)validateBrand_Description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* combined_Packtype_Cd;



//- (BOOL)validateCombined_Packtype_Cd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* combined_Packtype_Description;



//- (BOOL)validateCombined_Packtype_Description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* desp;



//- (BOOL)validateDesp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* dimension_unit;



//- (BOOL)validateDimension_unit:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* item_Id;



@property double item_IdValue;
- (double)item_IdValue;
- (void)setItem_IdValue:(double)value_;

//- (BOOL)validateItem_Id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* item_Status_Description;



//- (BOOL)validateItem_Status_Description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* item_Status_code;



//- (BOOL)validateItem_Status_code:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* item_Weight;



@property double item_WeightValue;
- (double)item_WeightValue;
- (void)setItem_WeightValue:(double)value_;

//- (BOOL)validateItem_Weight:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* item_Width;



@property double item_WidthValue;
- (double)item_WidthValue;
- (void)setItem_WidthValue:(double)value_;

//- (BOOL)validateItem_Width:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* item_height;



@property double item_heightValue;
- (double)item_heightValue;
- (void)setItem_heightValue:(double)value_;

//- (BOOL)validateItem_height:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* item_length;



@property double item_lengthValue;
- (double)item_lengthValue;
- (void)setItem_lengthValue:(double)value_;

//- (BOOL)validateItem_length:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* overbrand_Cd;



//- (BOOL)validateOverbrand_Cd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* overbrand_description;



//- (BOOL)validateOverbrand_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* packtype_Cd;



//- (BOOL)validatePacktype_Cd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* packtype_Description;



//- (BOOL)validatePacktype_Description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* product_Number;



//- (BOOL)validateProduct_Number:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* product_code;



//- (BOOL)validateProduct_code:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* product_division;



//- (BOOL)validateProduct_division:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* product_division_description;



//- (BOOL)validateProduct_division_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* sAP_Material_Type_FERT;



//- (BOOL)validateSAP_Material_Type_FERT:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* sales_org;



//- (BOOL)validateSales_org:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* season_Cd;



//- (BOOL)validateSeason_Cd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* season_Description;



//- (BOOL)validateSeason_Description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* short_material_number;



//- (BOOL)validateShort_material_number:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* subPacktype_Cd;



//- (BOOL)validateSubPacktype_Cd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* subpacktype_description;



//- (BOOL)validateSubpacktype_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* uPC_GROUP_PRODUCT_UOM_maybe;



//- (BOOL)validateUPC_GROUP_PRODUCT_UOM_maybe:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* uPC_maybe;



//- (BOOL)validateUPC_maybe:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* version;



//- (BOOL)validateVersion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* weight_unit_of_Measure;



//- (BOOL)validateWeight_unit_of_Measure:(id*)value_ error:(NSError**)error_;






@end

@interface _Product (CoreDataGeneratedAccessors)

@end

@interface _Product (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBrand_Cd;
- (void)setPrimitiveBrand_Cd:(NSString*)value;




- (NSString*)primitiveBrand_Description;
- (void)setPrimitiveBrand_Description:(NSString*)value;




- (NSString*)primitiveCombined_Packtype_Cd;
- (void)setPrimitiveCombined_Packtype_Cd:(NSString*)value;




- (NSString*)primitiveCombined_Packtype_Description;
- (void)setPrimitiveCombined_Packtype_Description:(NSString*)value;




- (NSString*)primitiveDesp;
- (void)setPrimitiveDesp:(NSString*)value;




- (NSString*)primitiveDimension_unit;
- (void)setPrimitiveDimension_unit:(NSString*)value;




- (NSNumber*)primitiveItem_Id;
- (void)setPrimitiveItem_Id:(NSNumber*)value;

- (double)primitiveItem_IdValue;
- (void)setPrimitiveItem_IdValue:(double)value_;




- (NSString*)primitiveItem_Status_Description;
- (void)setPrimitiveItem_Status_Description:(NSString*)value;




- (NSString*)primitiveItem_Status_code;
- (void)setPrimitiveItem_Status_code:(NSString*)value;




- (NSNumber*)primitiveItem_Weight;
- (void)setPrimitiveItem_Weight:(NSNumber*)value;

- (double)primitiveItem_WeightValue;
- (void)setPrimitiveItem_WeightValue:(double)value_;




- (NSNumber*)primitiveItem_Width;
- (void)setPrimitiveItem_Width:(NSNumber*)value;

- (double)primitiveItem_WidthValue;
- (void)setPrimitiveItem_WidthValue:(double)value_;




- (NSNumber*)primitiveItem_height;
- (void)setPrimitiveItem_height:(NSNumber*)value;

- (double)primitiveItem_heightValue;
- (void)setPrimitiveItem_heightValue:(double)value_;




- (NSNumber*)primitiveItem_length;
- (void)setPrimitiveItem_length:(NSNumber*)value;

- (double)primitiveItem_lengthValue;
- (void)setPrimitiveItem_lengthValue:(double)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveOverbrand_Cd;
- (void)setPrimitiveOverbrand_Cd:(NSString*)value;




- (NSString*)primitiveOverbrand_description;
- (void)setPrimitiveOverbrand_description:(NSString*)value;




- (NSString*)primitivePacktype_Cd;
- (void)setPrimitivePacktype_Cd:(NSString*)value;




- (NSString*)primitivePacktype_Description;
- (void)setPrimitivePacktype_Description:(NSString*)value;




- (NSString*)primitiveProduct_Number;
- (void)setPrimitiveProduct_Number:(NSString*)value;




- (NSString*)primitiveProduct_code;
- (void)setPrimitiveProduct_code:(NSString*)value;




- (NSString*)primitiveProduct_division;
- (void)setPrimitiveProduct_division:(NSString*)value;




- (NSString*)primitiveProduct_division_description;
- (void)setPrimitiveProduct_division_description:(NSString*)value;




- (NSString*)primitiveSAP_Material_Type_FERT;
- (void)setPrimitiveSAP_Material_Type_FERT:(NSString*)value;




- (NSString*)primitiveSales_org;
- (void)setPrimitiveSales_org:(NSString*)value;




- (NSString*)primitiveSeason_Cd;
- (void)setPrimitiveSeason_Cd:(NSString*)value;




- (NSString*)primitiveSeason_Description;
- (void)setPrimitiveSeason_Description:(NSString*)value;




- (NSString*)primitiveShort_material_number;
- (void)setPrimitiveShort_material_number:(NSString*)value;




- (NSString*)primitiveSubPacktype_Cd;
- (void)setPrimitiveSubPacktype_Cd:(NSString*)value;




- (NSString*)primitiveSubpacktype_description;
- (void)setPrimitiveSubpacktype_description:(NSString*)value;




- (NSString*)primitiveUPC_GROUP_PRODUCT_UOM_maybe;
- (void)setPrimitiveUPC_GROUP_PRODUCT_UOM_maybe:(NSString*)value;




- (NSString*)primitiveUPC_maybe;
- (void)setPrimitiveUPC_maybe:(NSString*)value;




- (NSString*)primitiveVersion;
- (void)setPrimitiveVersion:(NSString*)value;




- (NSString*)primitiveWeight_unit_of_Measure;
- (void)setPrimitiveWeight_unit_of_Measure:(NSString*)value;




@end
