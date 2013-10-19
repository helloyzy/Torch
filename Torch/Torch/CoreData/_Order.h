// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Order.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderAttributes {
	__unsafe_unretained NSString *actualEndDate;
	__unsafe_unretained NSString *actualStartDate;
	__unsafe_unretained NSString *callTimeAdjustment;
	__unsafe_unretained NSString *paymentAmount;
	__unsafe_unretained NSString *plannedEndDate;
	__unsafe_unretained NSString *plannedStartDate;
	__unsafe_unretained NSString *remoteKey;
} OrderAttributes;

extern const struct OrderRelationships {
	__unsafe_unretained NSString *orderCredits;
} OrderRelationships;

extern const struct OrderFetchedProperties {
} OrderFetchedProperties;

@class OrderCredit;









@interface OrderID : NSManagedObjectID {}
@end

@interface _Order : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderID*)objectID;




@property (nonatomic, strong) NSNumber* actualEndDate;


@property double actualEndDateValue;
- (double)actualEndDateValue;
- (void)setActualEndDateValue:(double)value_;

//- (BOOL)validateActualEndDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* actualStartDate;


@property double actualStartDateValue;
- (double)actualStartDateValue;
- (void)setActualStartDateValue:(double)value_;

//- (BOOL)validateActualStartDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* callTimeAdjustment;


@property double callTimeAdjustmentValue;
- (double)callTimeAdjustmentValue;
- (void)setCallTimeAdjustmentValue:(double)value_;

//- (BOOL)validateCallTimeAdjustment:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* paymentAmount;


@property double paymentAmountValue;
- (double)paymentAmountValue;
- (void)setPaymentAmountValue:(double)value_;

//- (BOOL)validatePaymentAmount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* plannedEndDate;


@property double plannedEndDateValue;
- (double)plannedEndDateValue;
- (void)setPlannedEndDateValue:(double)value_;

//- (BOOL)validatePlannedEndDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* plannedStartDate;


@property double plannedStartDateValue;
- (double)plannedStartDateValue;
- (void)setPlannedStartDateValue:(double)value_;

//- (BOOL)validatePlannedStartDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* remoteKey;


//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* orderCredits;

- (NSMutableSet*)orderCreditsSet;





@end

@interface _Order (CoreDataGeneratedAccessors)

- (void)addOrderCredits:(NSSet*)value_;
- (void)removeOrderCredits:(NSSet*)value_;
- (void)addOrderCreditsObject:(OrderCredit*)value_;
- (void)removeOrderCreditsObject:(OrderCredit*)value_;

@end

@interface _Order (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveActualEndDate;
- (void)setPrimitiveActualEndDate:(NSNumber*)value;

- (double)primitiveActualEndDateValue;
- (void)setPrimitiveActualEndDateValue:(double)value_;




- (NSNumber*)primitiveActualStartDate;
- (void)setPrimitiveActualStartDate:(NSNumber*)value;

- (double)primitiveActualStartDateValue;
- (void)setPrimitiveActualStartDateValue:(double)value_;




- (NSNumber*)primitiveCallTimeAdjustment;
- (void)setPrimitiveCallTimeAdjustment:(NSNumber*)value;

- (double)primitiveCallTimeAdjustmentValue;
- (void)setPrimitiveCallTimeAdjustmentValue:(double)value_;




- (NSNumber*)primitivePaymentAmount;
- (void)setPrimitivePaymentAmount:(NSNumber*)value;

- (double)primitivePaymentAmountValue;
- (void)setPrimitivePaymentAmountValue:(double)value_;




- (NSNumber*)primitivePlannedEndDate;
- (void)setPrimitivePlannedEndDate:(NSNumber*)value;

- (double)primitivePlannedEndDateValue;
- (void)setPrimitivePlannedEndDateValue:(double)value_;




- (NSNumber*)primitivePlannedStartDate;
- (void)setPrimitivePlannedStartDate:(NSNumber*)value;

- (double)primitivePlannedStartDateValue;
- (void)setPrimitivePlannedStartDateValue:(double)value_;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;





- (NSMutableSet*)primitiveOrderCredits;
- (void)setPrimitiveOrderCredits:(NSMutableSet*)value;


@end
