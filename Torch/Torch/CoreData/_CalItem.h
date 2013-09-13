// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CalItem.h instead.

#import <CoreData/CoreData.h>


extern const struct CalItemAttributes {
	__unsafe_unretained NSString *active;
	__unsafe_unretained NSString *customerItemNumber;
	__unsafe_unretained NSString *discontinued;
	__unsafe_unretained NSString *distributorItem;
	__unsafe_unretained NSString *effectiveEndDate;
	__unsafe_unretained NSString *effectiveStartDate;
	__unsafe_unretained NSString *maxMarkdown;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *packtypeDescription;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *productNumber;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *schedule;
	__unsafe_unretained NSString *segment;
	__unsafe_unretained NSString *tdNumber;
	__unsafe_unretained NSString *uom;
	__unsafe_unretained NSString *upc;
} CalItemAttributes;

extern const struct CalItemRelationships {
	__unsafe_unretained NSString *orderCreditItem;
} CalItemRelationships;

extern const struct CalItemFetchedProperties {
} CalItemFetchedProperties;

@class OrderCreditItem;



















@interface CalItemID : NSManagedObjectID {}
@end

@interface _CalItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CalItemID*)objectID;





@property (nonatomic, strong) NSNumber* active;



@property BOOL activeValue;
- (BOOL)activeValue;
- (void)setActiveValue:(BOOL)value_;

//- (BOOL)validateActive:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* customerItemNumber;



@property double customerItemNumberValue;
- (double)customerItemNumberValue;
- (void)setCustomerItemNumberValue:(double)value_;

//- (BOOL)validateCustomerItemNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* discontinued;



@property BOOL discontinuedValue;
- (BOOL)discontinuedValue;
- (void)setDiscontinuedValue:(BOOL)value_;

//- (BOOL)validateDiscontinued:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* distributorItem;



@property BOOL distributorItemValue;
- (BOOL)distributorItemValue;
- (void)setDistributorItemValue:(BOOL)value_;

//- (BOOL)validateDistributorItem:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* effectiveEndDate;



@property double effectiveEndDateValue;
- (double)effectiveEndDateValue;
- (void)setEffectiveEndDateValue:(double)value_;

//- (BOOL)validateEffectiveEndDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* effectiveStartDate;



@property double effectiveStartDateValue;
- (double)effectiveStartDateValue;
- (void)setEffectiveStartDateValue:(double)value_;

//- (BOOL)validateEffectiveStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* maxMarkdown;



//- (BOOL)validateMaxMarkdown:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* packtypeDescription;



//- (BOOL)validatePacktypeDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* price;



//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* productNumber;



//- (BOOL)validateProductNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteKey;



//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* schedule;



//- (BOOL)validateSchedule:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* segment;



//- (BOOL)validateSegment:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* tdNumber;



//- (BOOL)validateTdNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* uom;



//- (BOOL)validateUom:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* upc;



//- (BOOL)validateUpc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OrderCreditItem *orderCreditItem;

//- (BOOL)validateOrderCreditItem:(id*)value_ error:(NSError**)error_;





@end

@interface _CalItem (CoreDataGeneratedAccessors)

@end

@interface _CalItem (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveActive;
- (void)setPrimitiveActive:(NSNumber*)value;

- (BOOL)primitiveActiveValue;
- (void)setPrimitiveActiveValue:(BOOL)value_;




- (NSNumber*)primitiveCustomerItemNumber;
- (void)setPrimitiveCustomerItemNumber:(NSNumber*)value;

- (double)primitiveCustomerItemNumberValue;
- (void)setPrimitiveCustomerItemNumberValue:(double)value_;




- (NSNumber*)primitiveDiscontinued;
- (void)setPrimitiveDiscontinued:(NSNumber*)value;

- (BOOL)primitiveDiscontinuedValue;
- (void)setPrimitiveDiscontinuedValue:(BOOL)value_;




- (NSNumber*)primitiveDistributorItem;
- (void)setPrimitiveDistributorItem:(NSNumber*)value;

- (BOOL)primitiveDistributorItemValue;
- (void)setPrimitiveDistributorItemValue:(BOOL)value_;




- (NSNumber*)primitiveEffectiveEndDate;
- (void)setPrimitiveEffectiveEndDate:(NSNumber*)value;

- (double)primitiveEffectiveEndDateValue;
- (void)setPrimitiveEffectiveEndDateValue:(double)value_;




- (NSNumber*)primitiveEffectiveStartDate;
- (void)setPrimitiveEffectiveStartDate:(NSNumber*)value;

- (double)primitiveEffectiveStartDateValue;
- (void)setPrimitiveEffectiveStartDateValue:(double)value_;




- (NSString*)primitiveMaxMarkdown;
- (void)setPrimitiveMaxMarkdown:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePacktypeDescription;
- (void)setPrimitivePacktypeDescription:(NSString*)value;




- (NSString*)primitivePrice;
- (void)setPrimitivePrice:(NSString*)value;




- (NSString*)primitiveProductNumber;
- (void)setPrimitiveProductNumber:(NSString*)value;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveSchedule;
- (void)setPrimitiveSchedule:(NSString*)value;




- (NSString*)primitiveSegment;
- (void)setPrimitiveSegment:(NSString*)value;




- (NSString*)primitiveTdNumber;
- (void)setPrimitiveTdNumber:(NSString*)value;




- (NSString*)primitiveUom;
- (void)setPrimitiveUom:(NSString*)value;




- (NSString*)primitiveUpc;
- (void)setPrimitiveUpc:(NSString*)value;





- (OrderCreditItem*)primitiveOrderCreditItem;
- (void)setPrimitiveOrderCreditItem:(OrderCreditItem*)value;


@end
