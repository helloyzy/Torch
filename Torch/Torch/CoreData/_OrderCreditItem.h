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
	__unsafe_unretained NSString *order;
} OrderCreditItemRelationships;

extern const struct OrderCreditItemFetchedProperties {
} OrderCreditItemFetchedProperties;

@class CalItem;
@class Order;











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





@property (nonatomic, strong) NSString* nettAmount;



//- (BOOL)validateNettAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* overridePrice;



//- (BOOL)validateOverridePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* quantity;



@property double quantityValue;
- (double)quantityValue;
- (void)setQuantityValue:(double)value_;

//- (BOOL)validateQuantity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* shortItemNumber;



//- (BOOL)validateShortItemNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* total;



//- (BOOL)validateTotal:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) CalItem *calItem;

//- (BOOL)validateCalItem:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Order *order;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;





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




- (NSString*)primitiveNettAmount;
- (void)setPrimitiveNettAmount:(NSString*)value;




- (NSString*)primitiveOverridePrice;
- (void)setPrimitiveOverridePrice:(NSString*)value;




- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (double)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(double)value_;




- (NSString*)primitiveShortItemNumber;
- (void)setPrimitiveShortItemNumber:(NSString*)value;




- (NSString*)primitiveTotal;
- (void)setPrimitiveTotal:(NSString*)value;





- (CalItem*)primitiveCalItem;
- (void)setPrimitiveCalItem:(CalItem*)value;



- (Order*)primitiveOrder;
- (void)setPrimitiveOrder:(Order*)value;


@end
