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
} OrderRelationships;

extern const struct OrderFetchedProperties {
} OrderFetchedProperties;










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



@property int32_t callTimeAdjustmentValue;
- (int32_t)callTimeAdjustmentValue;
- (void)setCallTimeAdjustmentValue:(int32_t)value_;

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






@end

@interface _Order (CoreDataGeneratedAccessors)

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

- (int32_t)primitiveCallTimeAdjustmentValue;
- (void)setPrimitiveCallTimeAdjustmentValue:(int32_t)value_;




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




@end
