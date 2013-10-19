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


@property double discountPercentageValue;
- (double)discountPercentageValue;
- (void)setDiscountPercentageValue:(double)value_;

//- (BOOL)validateDiscountPercentage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* distributedItemNumber;


//- (BOOL)validateDistributedItemNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* markdownPercentage;


@property double markdownPercentageValue;
- (double)markdownPercentageValue;
- (void)setMarkdownPercentageValue:(double)value_;

//- (BOOL)validateMarkdownPercentage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* maxMarkdownPercentage;


@property double maxMarkdownPercentageValue;
- (double)maxMarkdownPercentageValue;
- (void)setMaxMarkdownPercentageValue:(double)value_;

//- (BOOL)validateMaxMarkdownPercentage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* nettAmount;


@property double nettAmountValue;
- (double)nettAmountValue;
- (void)setNettAmountValue:(double)value_;

//- (BOOL)validateNettAmount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* overridePrice;


@property double overridePriceValue;
- (double)overridePriceValue;
- (void)setOverridePriceValue:(double)value_;

//- (BOOL)validateOverridePrice:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* quantity;


@property double quantityValue;
- (double)quantityValue;
- (void)setQuantityValue:(double)value_;

//- (BOOL)validateQuantity:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* shortItemNumber;


//- (BOOL)validateShortItemNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* total;


@property double totalValue;
- (double)totalValue;
- (void)setTotalValue:(double)value_;

//- (BOOL)validateTotal:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) CalItem* calItem;

//- (BOOL)validateCalItem:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) OrderCredit* orderCredit;

//- (BOOL)validateOrderCredit:(id*)value_ error:(NSError**)error_;





@end

@interface _OrderCreditItem (CoreDataGeneratedAccessors)

@end

@interface _OrderCreditItem (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveDiscountPercentage;
- (void)setPrimitiveDiscountPercentage:(NSNumber*)value;

- (double)primitiveDiscountPercentageValue;
- (void)setPrimitiveDiscountPercentageValue:(double)value_;




- (NSString*)primitiveDistributedItemNumber;
- (void)setPrimitiveDistributedItemNumber:(NSString*)value;




- (NSNumber*)primitiveMarkdownPercentage;
- (void)setPrimitiveMarkdownPercentage:(NSNumber*)value;

- (double)primitiveMarkdownPercentageValue;
- (void)setPrimitiveMarkdownPercentageValue:(double)value_;




- (NSNumber*)primitiveMaxMarkdownPercentage;
- (void)setPrimitiveMaxMarkdownPercentage:(NSNumber*)value;

- (double)primitiveMaxMarkdownPercentageValue;
- (void)setPrimitiveMaxMarkdownPercentageValue:(double)value_;




- (NSNumber*)primitiveNettAmount;
- (void)setPrimitiveNettAmount:(NSNumber*)value;

- (double)primitiveNettAmountValue;
- (void)setPrimitiveNettAmountValue:(double)value_;




- (NSNumber*)primitiveOverridePrice;
- (void)setPrimitiveOverridePrice:(NSNumber*)value;

- (double)primitiveOverridePriceValue;
- (void)setPrimitiveOverridePriceValue:(double)value_;




- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (double)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(double)value_;




- (NSString*)primitiveShortItemNumber;
- (void)setPrimitiveShortItemNumber:(NSString*)value;




- (NSNumber*)primitiveTotal;
- (void)setPrimitiveTotal:(NSNumber*)value;

- (double)primitiveTotalValue;
- (void)setPrimitiveTotalValue:(double)value_;





- (CalItem*)primitiveCalItem;
- (void)setPrimitiveCalItem:(CalItem*)value;



- (OrderCredit*)primitiveOrderCredit;
- (void)setPrimitiveOrderCredit:(OrderCredit*)value;


@end
