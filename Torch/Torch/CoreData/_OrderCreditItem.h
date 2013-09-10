// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCreditItem.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderCreditItemAttributes {
	__unsafe_unretained NSString *discountPercentage;
	__unsafe_unretained NSString *distributedItemNumber;
	__unsafe_unretained NSString *markdownPercentage;
	__unsafe_unretained NSString *maxMarkdownPercentage;
	__unsafe_unretained NSString *nettAmount;
	__unsafe_unretained NSString *overridePrice;
	__unsafe_unretained NSString *quantity;
	__unsafe_unretained NSString *shortItemNumber;
	__unsafe_unretained NSString *total;
} OrderCreditItemAttributes;

extern const struct OrderCreditItemRelationships {
	__unsafe_unretained NSString *calItem;
	__unsafe_unretained NSString *orderCredit;
} OrderCreditItemRelationships;

extern const struct OrderCreditItemFetchedProperties {
} OrderCreditItemFetchedProperties;

@class CalItem;
@class OrderCredit;











@interface OrderCreditItemID : NSManagedObjectID {}
@end

@interface _OrderCreditItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderCreditItemID*)objectID;





@property (nonatomic, strong) NSNumber* discountPercentage;



@property int32_t discountPercentageValue;
- (int32_t)discountPercentageValue;
- (void)setDiscountPercentageValue:(int32_t)value_;

//- (BOOL)validateDiscountPercentage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* distributedItemNumber;



//- (BOOL)validateDistributedItemNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* markdownPercentage;



@property int32_t markdownPercentageValue;
- (int32_t)markdownPercentageValue;
- (void)setMarkdownPercentageValue:(int32_t)value_;

//- (BOOL)validateMarkdownPercentage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* maxMarkdownPercentage;



@property int32_t maxMarkdownPercentageValue;
- (int32_t)maxMarkdownPercentageValue;
- (void)setMaxMarkdownPercentageValue:(int32_t)value_;

//- (BOOL)validateMaxMarkdownPercentage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* nettAmount;



@property int32_t nettAmountValue;
- (int32_t)nettAmountValue;
- (void)setNettAmountValue:(int32_t)value_;

//- (BOOL)validateNettAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* overridePrice;



@property int32_t overridePriceValue;
- (int32_t)overridePriceValue;
- (void)setOverridePriceValue:(int32_t)value_;

//- (BOOL)validateOverridePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* quantity;



@property int32_t quantityValue;
- (int32_t)quantityValue;
- (void)setQuantityValue:(int32_t)value_;

//- (BOOL)validateQuantity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* shortItemNumber;



//- (BOOL)validateShortItemNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* total;



@property int32_t totalValue;
- (int32_t)totalValue;
- (void)setTotalValue:(int32_t)value_;

//- (BOOL)validateTotal:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) CalItem *calItem;

//- (BOOL)validateCalItem:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) OrderCredit *orderCredit;

//- (BOOL)validateOrderCredit:(id*)value_ error:(NSError**)error_;





@end

@interface _OrderCreditItem (CoreDataGeneratedAccessors)

@end

@interface _OrderCreditItem (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveDiscountPercentage;
- (void)setPrimitiveDiscountPercentage:(NSNumber*)value;

- (int32_t)primitiveDiscountPercentageValue;
- (void)setPrimitiveDiscountPercentageValue:(int32_t)value_;




- (NSString*)primitiveDistributedItemNumber;
- (void)setPrimitiveDistributedItemNumber:(NSString*)value;




- (NSNumber*)primitiveMarkdownPercentage;
- (void)setPrimitiveMarkdownPercentage:(NSNumber*)value;

- (int32_t)primitiveMarkdownPercentageValue;
- (void)setPrimitiveMarkdownPercentageValue:(int32_t)value_;




- (NSNumber*)primitiveMaxMarkdownPercentage;
- (void)setPrimitiveMaxMarkdownPercentage:(NSNumber*)value;

- (int32_t)primitiveMaxMarkdownPercentageValue;
- (void)setPrimitiveMaxMarkdownPercentageValue:(int32_t)value_;




- (NSNumber*)primitiveNettAmount;
- (void)setPrimitiveNettAmount:(NSNumber*)value;

- (int32_t)primitiveNettAmountValue;
- (void)setPrimitiveNettAmountValue:(int32_t)value_;




- (NSNumber*)primitiveOverridePrice;
- (void)setPrimitiveOverridePrice:(NSNumber*)value;

- (int32_t)primitiveOverridePriceValue;
- (void)setPrimitiveOverridePriceValue:(int32_t)value_;




- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (int32_t)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(int32_t)value_;




- (NSString*)primitiveShortItemNumber;
- (void)setPrimitiveShortItemNumber:(NSString*)value;




- (NSNumber*)primitiveTotal;
- (void)setPrimitiveTotal:(NSNumber*)value;

- (int32_t)primitiveTotalValue;
- (void)setPrimitiveTotalValue:(int32_t)value_;





- (CalItem*)primitiveCalItem;
- (void)setPrimitiveCalItem:(CalItem*)value;



- (OrderCredit*)primitiveOrderCredit;
- (void)setPrimitiveOrderCredit:(OrderCredit*)value;


@end
