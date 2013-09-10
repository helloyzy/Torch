// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderCredit.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderCreditAttributes {
	__unsafe_unretained NSString *approvalRequiredReason;
	__unsafe_unretained NSString *checkNumber;
	__unsafe_unretained NSString *confirmationType;
	__unsafe_unretained NSString *creditType;
	__unsafe_unretained NSString *customerReferenceNumber;
	__unsafe_unretained NSString *hersheyReferenceNumber;
	__unsafe_unretained NSString *orderCreditId;
	__unsafe_unretained NSString *orderType;
	__unsafe_unretained NSString *paymentAmount;
	__unsafe_unretained NSString *paymentMethod;
	__unsafe_unretained NSString *paymentType;
	__unsafe_unretained NSString *reasonCode;
	__unsafe_unretained NSString *recordType;
	__unsafe_unretained NSString *rejectionReason;
	__unsafe_unretained NSString *signature;
	__unsafe_unretained NSString *status;
} OrderCreditAttributes;

extern const struct OrderCreditRelationships {
	__unsafe_unretained NSString *account;
	__unsafe_unretained NSString *contact;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *orderCreditItems;
} OrderCreditRelationships;

extern const struct OrderCreditFetchedProperties {
} OrderCreditFetchedProperties;

@class Account;
@class Contact;
@class Order;
@class OrderCreditItem;


















@interface OrderCreditID : NSManagedObjectID {}
@end

@interface _OrderCredit : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderCreditID*)objectID;





@property (nonatomic, strong) NSString* approvalRequiredReason;



//- (BOOL)validateApprovalRequiredReason:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* checkNumber;



//- (BOOL)validateCheckNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* confirmationType;



//- (BOOL)validateConfirmationType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* creditType;



//- (BOOL)validateCreditType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* customerReferenceNumber;



//- (BOOL)validateCustomerReferenceNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* hersheyReferenceNumber;



//- (BOOL)validateHersheyReferenceNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* orderCreditId;



//- (BOOL)validateOrderCreditId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* orderType;



//- (BOOL)validateOrderType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* paymentAmount;



@property int32_t paymentAmountValue;
- (int32_t)paymentAmountValue;
- (void)setPaymentAmountValue:(int32_t)value_;

//- (BOOL)validatePaymentAmount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* paymentMethod;



//- (BOOL)validatePaymentMethod:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* paymentType;



//- (BOOL)validatePaymentType:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) Account *account;

//- (BOOL)validateAccount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Contact *contact;

//- (BOOL)validateContact:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Order *order;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *orderCreditItems;

- (NSMutableSet*)orderCreditItemsSet;





@end

@interface _OrderCredit (CoreDataGeneratedAccessors)

- (void)addOrderCreditItems:(NSSet*)value_;
- (void)removeOrderCreditItems:(NSSet*)value_;
- (void)addOrderCreditItemsObject:(OrderCreditItem*)value_;
- (void)removeOrderCreditItemsObject:(OrderCreditItem*)value_;

@end

@interface _OrderCredit (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveApprovalRequiredReason;
- (void)setPrimitiveApprovalRequiredReason:(NSString*)value;




- (NSString*)primitiveCheckNumber;
- (void)setPrimitiveCheckNumber:(NSString*)value;




- (NSString*)primitiveConfirmationType;
- (void)setPrimitiveConfirmationType:(NSString*)value;




- (NSString*)primitiveCreditType;
- (void)setPrimitiveCreditType:(NSString*)value;




- (NSString*)primitiveCustomerReferenceNumber;
- (void)setPrimitiveCustomerReferenceNumber:(NSString*)value;




- (NSString*)primitiveHersheyReferenceNumber;
- (void)setPrimitiveHersheyReferenceNumber:(NSString*)value;




- (NSString*)primitiveOrderCreditId;
- (void)setPrimitiveOrderCreditId:(NSString*)value;




- (NSString*)primitiveOrderType;
- (void)setPrimitiveOrderType:(NSString*)value;




- (NSNumber*)primitivePaymentAmount;
- (void)setPrimitivePaymentAmount:(NSNumber*)value;

- (int32_t)primitivePaymentAmountValue;
- (void)setPrimitivePaymentAmountValue:(int32_t)value_;




- (NSString*)primitivePaymentMethod;
- (void)setPrimitivePaymentMethod:(NSString*)value;




- (NSString*)primitivePaymentType;
- (void)setPrimitivePaymentType:(NSString*)value;




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





- (Account*)primitiveAccount;
- (void)setPrimitiveAccount:(Account*)value;



- (Contact*)primitiveContact;
- (void)setPrimitiveContact:(Contact*)value;



- (Order*)primitiveOrder;
- (void)setPrimitiveOrder:(Order*)value;



- (NSMutableSet*)primitiveOrderCreditItems;
- (void)setPrimitiveOrderCreditItems:(NSMutableSet*)value;


@end
