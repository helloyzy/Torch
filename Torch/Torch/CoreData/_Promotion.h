// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Promotion.h instead.

#import <CoreData/CoreData.h>


extern const struct PromotionAttributes {
	__unsafe_unretained NSString *accountId;
	__unsafe_unretained NSString *desp;
	__unsafe_unretained NSString *discountAmount;
	__unsafe_unretained NSString *discountPercentage;
	__unsafe_unretained NSString *endDate;
	__unsafe_unretained NSString *orderItemDiscount;
	__unsafe_unretained NSString *startDate;
	__unsafe_unretained NSString *title;
} PromotionAttributes;

extern const struct PromotionRelationships {
	__unsafe_unretained NSString *promotionItem;
} PromotionRelationships;

extern const struct PromotionFetchedProperties {
} PromotionFetchedProperties;

@class PromotionItem;










@interface PromotionID : NSManagedObjectID {}
@end

@interface _Promotion : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PromotionID*)objectID;





@property (nonatomic, strong) NSString* accountId;



//- (BOOL)validateAccountId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* desp;



//- (BOOL)validateDesp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* discountAmount;



@property double discountAmountValue;
- (double)discountAmountValue;
- (void)setDiscountAmountValue:(double)value_;

//- (BOOL)validateDiscountAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* discountPercentage;



@property double discountPercentageValue;
- (double)discountPercentageValue;
- (void)setDiscountPercentageValue:(double)value_;

//- (BOOL)validateDiscountPercentage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* endDate;



@property double endDateValue;
- (double)endDateValue;
- (void)setEndDateValue:(double)value_;

//- (BOOL)validateEndDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* orderItemDiscount;



@property BOOL orderItemDiscountValue;
- (BOOL)orderItemDiscountValue;
- (void)setOrderItemDiscountValue:(BOOL)value_;

//- (BOOL)validateOrderItemDiscount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startDate;



@property double startDateValue;
- (double)startDateValue;
- (void)setStartDateValue:(double)value_;

//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* title;



@property double titleValue;
- (double)titleValue;
- (void)setTitleValue:(double)value_;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *promotionItem;

- (NSMutableSet*)promotionItemSet;





@end

@interface _Promotion (CoreDataGeneratedAccessors)

- (void)addPromotionItem:(NSSet*)value_;
- (void)removePromotionItem:(NSSet*)value_;
- (void)addPromotionItemObject:(PromotionItem*)value_;
- (void)removePromotionItemObject:(PromotionItem*)value_;

@end

@interface _Promotion (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountId;
- (void)setPrimitiveAccountId:(NSString*)value;




- (NSString*)primitiveDesp;
- (void)setPrimitiveDesp:(NSString*)value;




- (NSNumber*)primitiveDiscountAmount;
- (void)setPrimitiveDiscountAmount:(NSNumber*)value;

- (double)primitiveDiscountAmountValue;
- (void)setPrimitiveDiscountAmountValue:(double)value_;




- (NSNumber*)primitiveDiscountPercentage;
- (void)setPrimitiveDiscountPercentage:(NSNumber*)value;

- (double)primitiveDiscountPercentageValue;
- (void)setPrimitiveDiscountPercentageValue:(double)value_;




- (NSNumber*)primitiveEndDate;
- (void)setPrimitiveEndDate:(NSNumber*)value;

- (double)primitiveEndDateValue;
- (void)setPrimitiveEndDateValue:(double)value_;




- (NSNumber*)primitiveOrderItemDiscount;
- (void)setPrimitiveOrderItemDiscount:(NSNumber*)value;

- (BOOL)primitiveOrderItemDiscountValue;
- (void)setPrimitiveOrderItemDiscountValue:(BOOL)value_;




- (NSNumber*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSNumber*)value;

- (double)primitiveStartDateValue;
- (void)setPrimitiveStartDateValue:(double)value_;




- (NSNumber*)primitiveTitle;
- (void)setPrimitiveTitle:(NSNumber*)value;

- (double)primitiveTitleValue;
- (void)setPrimitiveTitleValue:(double)value_;





- (NSMutableSet*)primitivePromotionItem;
- (void)setPrimitivePromotionItem:(NSMutableSet*)value;


@end
