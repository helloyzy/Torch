// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PromotionItem.h instead.

#import <CoreData/CoreData.h>


extern const struct PromotionItemAttributes {
	__unsafe_unretained NSString *productDescription;
	__unsafe_unretained NSString *productNumber;
	__unsafe_unretained NSString *promotionItemListPrice;
	__unsafe_unretained NSString *salesPrice;
} PromotionItemAttributes;

extern const struct PromotionItemRelationships {
	__unsafe_unretained NSString *promotion;
} PromotionItemRelationships;

extern const struct PromotionItemFetchedProperties {
} PromotionItemFetchedProperties;

@class Promotion;






@interface PromotionItemID : NSManagedObjectID {}
@end

@interface _PromotionItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PromotionItemID*)objectID;




@property (nonatomic, strong) NSString* productDescription;


//- (BOOL)validateProductDescription:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* productNumber;


//- (BOOL)validateProductNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* promotionItemListPrice;


@property double promotionItemListPriceValue;
- (double)promotionItemListPriceValue;
- (void)setPromotionItemListPriceValue:(double)value_;

//- (BOOL)validatePromotionItemListPrice:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* salesPrice;


@property double salesPriceValue;
- (double)salesPriceValue;
- (void)setSalesPriceValue:(double)value_;

//- (BOOL)validateSalesPrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Promotion* promotion;

//- (BOOL)validatePromotion:(id*)value_ error:(NSError**)error_;





@end

@interface _PromotionItem (CoreDataGeneratedAccessors)

@end

@interface _PromotionItem (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveProductDescription;
- (void)setPrimitiveProductDescription:(NSString*)value;




- (NSString*)primitiveProductNumber;
- (void)setPrimitiveProductNumber:(NSString*)value;




- (NSNumber*)primitivePromotionItemListPrice;
- (void)setPrimitivePromotionItemListPrice:(NSNumber*)value;

- (double)primitivePromotionItemListPriceValue;
- (void)setPrimitivePromotionItemListPriceValue:(double)value_;




- (NSNumber*)primitiveSalesPrice;
- (void)setPrimitiveSalesPrice:(NSNumber*)value;

- (double)primitiveSalesPriceValue;
- (void)setPrimitiveSalesPriceValue:(double)value_;





- (Promotion*)primitivePromotion;
- (void)setPrimitivePromotion:(Promotion*)value;


@end
