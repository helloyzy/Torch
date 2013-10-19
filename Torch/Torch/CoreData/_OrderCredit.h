// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCredit.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderCreditAttributes {
	__unsafe_unretained NSString *actualEndDate;
	__unsafe_unretained NSString *approvalRequiredReason;
	__unsafe_unretained NSString *callId;
	__unsafe_unretained NSString *callTimeAdjustment;
	__unsafe_unretained NSString *checkNumber;
	__unsafe_unretained NSString *confirmationType;
	__unsafe_unretained NSString *creditType;
	__unsafe_unretained NSString *customerReferenceNumber;
	__unsafe_unretained NSString *discountPercent;
	__unsafe_unretained NSString *hersheyReferenceNumber;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *orderCreditId;
	__unsafe_unretained NSString *orderType;
	__unsafe_unretained NSString *paymentAmount;
	__unsafe_unretained NSString *paymentMethod;
	__unsafe_unretained NSString *paymentType;
	__unsafe_unretained NSString *plannedEndDate;
	__unsafe_unretained NSString *plannedStartDate;
	__unsafe_unretained NSString *reasonCode;
	__unsafe_unretained NSString *recordType;
	__unsafe_unretained NSString *rejectionReason;
	__unsafe_unretained NSString *signature;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *totalDiscountAmount;
} OrderCreditAttributes;

extern const struct OrderCreditRelationships {
	__unsafe_unretained NSString *account;
	__unsafe_unretained NSString *contact;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *orderCreditItems;
	__unsafe_unretained NSString *surveyResponse;
} OrderCreditRelationships;

extern const struct OrderCreditFetchedProperties {
} OrderCreditFetchedProperties;

@class Account;
@class Contact;
@class NoteResponse;
@class Order;
@class OrderCreditItem;
@class SurveyResponse;



























@interface OrderCreditID : NSManagedObjectID {}
@end

@interface _OrderCredit : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderCreditID*)objectID;




@property (nonatomic, strong) NSNumber* actualEndDate;


@property double actualEndDateValue;
- (double)actualEndDateValue;
- (void)setActualEndDateValue:(double)value_;

//- (BOOL)validateActualEndDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* approvalRequiredReason;


//- (BOOL)validateApprovalRequiredReason:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* callId;


//- (BOOL)validateCallId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* callTimeAdjustment;


@property double callTimeAdjustmentValue;
- (double)callTimeAdjustmentValue;
- (void)setCallTimeAdjustmentValue:(double)value_;

//- (BOOL)validateCallTimeAdjustment:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* checkNumber;


//- (BOOL)validateCheckNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* confirmationType;


//- (BOOL)validateConfirmationType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* creditType;


//- (BOOL)validateCreditType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* customerReferenceNumber;


//- (BOOL)validateCustomerReferenceNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* discountPercent;


@property double discountPercentValue;
- (double)discountPercentValue;
- (void)setDiscountPercentValue:(double)value_;

//- (BOOL)validateDiscountPercent:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* hersheyReferenceNumber;


//- (BOOL)validateHersheyReferenceNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* latitude;


@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* longitude;


@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* orderCreditId;


//- (BOOL)validateOrderCreditId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* orderType;


//- (BOOL)validateOrderType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* paymentAmount;


@property double paymentAmountValue;
- (double)paymentAmountValue;
- (void)setPaymentAmountValue:(double)value_;

//- (BOOL)validatePaymentAmount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* paymentMethod;


//- (BOOL)validatePaymentMethod:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* paymentType;


//- (BOOL)validatePaymentType:(id*)value_ error:(NSError**)error_;




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




@property (nonatomic, strong) NSString* reasonCode;


//- (BOOL)validateReasonCode:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* recordType;


//- (BOOL)validateRecordType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* rejectionReason;


//- (BOOL)validateRejectionReason:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* signature;


//- (BOOL)validateSignature:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* status;


//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* totalDiscountAmount;


@property double totalDiscountAmountValue;
- (double)totalDiscountAmountValue;
- (void)setTotalDiscountAmountValue:(double)value_;

//- (BOOL)validateTotalDiscountAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Account* account;

//- (BOOL)validateAccount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Contact* contact;

//- (BOOL)validateContact:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* notes;

- (NSMutableSet*)notesSet;




@property (nonatomic, strong) Order* order;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* orderCreditItems;

- (NSMutableSet*)orderCreditItemsSet;




@property (nonatomic, strong) NSSet* surveyResponse;

- (NSMutableSet*)surveyResponseSet;





@end

@interface _OrderCredit (CoreDataGeneratedAccessors)

- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(NoteResponse*)value_;
- (void)removeNotesObject:(NoteResponse*)value_;

- (void)addOrderCreditItems:(NSSet*)value_;
- (void)removeOrderCreditItems:(NSSet*)value_;
- (void)addOrderCreditItemsObject:(OrderCreditItem*)value_;
- (void)removeOrderCreditItemsObject:(OrderCreditItem*)value_;

- (void)addSurveyResponse:(NSSet*)value_;
- (void)removeSurveyResponse:(NSSet*)value_;
- (void)addSurveyResponseObject:(SurveyResponse*)value_;
- (void)removeSurveyResponseObject:(SurveyResponse*)value_;

@end

@interface _OrderCredit (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveActualEndDate;
- (void)setPrimitiveActualEndDate:(NSNumber*)value;

- (double)primitiveActualEndDateValue;
- (void)setPrimitiveActualEndDateValue:(double)value_;




- (NSString*)primitiveApprovalRequiredReason;
- (void)setPrimitiveApprovalRequiredReason:(NSString*)value;




- (NSString*)primitiveCallId;
- (void)setPrimitiveCallId:(NSString*)value;




- (NSNumber*)primitiveCallTimeAdjustment;
- (void)setPrimitiveCallTimeAdjustment:(NSNumber*)value;

- (double)primitiveCallTimeAdjustmentValue;
- (void)setPrimitiveCallTimeAdjustmentValue:(double)value_;




- (NSString*)primitiveCheckNumber;
- (void)setPrimitiveCheckNumber:(NSString*)value;




- (NSString*)primitiveConfirmationType;
- (void)setPrimitiveConfirmationType:(NSString*)value;




- (NSString*)primitiveCreditType;
- (void)setPrimitiveCreditType:(NSString*)value;




- (NSString*)primitiveCustomerReferenceNumber;
- (void)setPrimitiveCustomerReferenceNumber:(NSString*)value;




- (NSNumber*)primitiveDiscountPercent;
- (void)setPrimitiveDiscountPercent:(NSNumber*)value;

- (double)primitiveDiscountPercentValue;
- (void)setPrimitiveDiscountPercentValue:(double)value_;




- (NSString*)primitiveHersheyReferenceNumber;
- (void)setPrimitiveHersheyReferenceNumber:(NSString*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSString*)primitiveOrderCreditId;
- (void)setPrimitiveOrderCreditId:(NSString*)value;




- (NSString*)primitiveOrderType;
- (void)setPrimitiveOrderType:(NSString*)value;




- (NSNumber*)primitivePaymentAmount;
- (void)setPrimitivePaymentAmount:(NSNumber*)value;

- (double)primitivePaymentAmountValue;
- (void)setPrimitivePaymentAmountValue:(double)value_;




- (NSString*)primitivePaymentMethod;
- (void)setPrimitivePaymentMethod:(NSString*)value;




- (NSString*)primitivePaymentType;
- (void)setPrimitivePaymentType:(NSString*)value;




- (NSNumber*)primitivePlannedEndDate;
- (void)setPrimitivePlannedEndDate:(NSNumber*)value;

- (double)primitivePlannedEndDateValue;
- (void)setPrimitivePlannedEndDateValue:(double)value_;




- (NSNumber*)primitivePlannedStartDate;
- (void)setPrimitivePlannedStartDate:(NSNumber*)value;

- (double)primitivePlannedStartDateValue;
- (void)setPrimitivePlannedStartDateValue:(double)value_;




- (NSString*)primitiveReasonCode;
- (void)setPrimitiveReasonCode:(NSString*)value;




- (NSString*)primitiveRecordType;
- (void)setPrimitiveRecordType:(NSString*)value;




- (NSString*)primitiveRejectionReason;
- (void)setPrimitiveRejectionReason:(NSString*)value;




- (NSString*)primitiveSignature;
- (void)setPrimitiveSignature:(NSString*)value;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSNumber*)primitiveTotalDiscountAmount;
- (void)setPrimitiveTotalDiscountAmount:(NSNumber*)value;

- (double)primitiveTotalDiscountAmountValue;
- (void)setPrimitiveTotalDiscountAmountValue:(double)value_;





- (Account*)primitiveAccount;
- (void)setPrimitiveAccount:(Account*)value;



- (Contact*)primitiveContact;
- (void)setPrimitiveContact:(Contact*)value;



- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;



- (Order*)primitiveOrder;
- (void)setPrimitiveOrder:(Order*)value;



- (NSMutableSet*)primitiveOrderCreditItems;
- (void)setPrimitiveOrderCreditItems:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSurveyResponse;
- (void)setPrimitiveSurveyResponse:(NSMutableSet*)value;


@end
