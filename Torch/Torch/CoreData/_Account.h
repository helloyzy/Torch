// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.h instead.

#import <CoreData/CoreData.h>


extern const struct AccountAttributes {
	__unsafe_unretained NSString *accountRecordType;
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *coachId;
	__unsafe_unretained NSString *currency;
	__unsafe_unretained NSString *fax;
	__unsafe_unretained NSString *invoice;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *postalcode;
	__unsafe_unretained NSString *recordType;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *repId;
	__unsafe_unretained NSString *state;
	__unsafe_unretained NSString *street;
	__unsafe_unretained NSString *streetref1;
	__unsafe_unretained NSString *streetref2;
} AccountAttributes;

extern const struct AccountRelationships {
	__unsafe_unretained NSString *orderCredit;
} AccountRelationships;

extern const struct AccountFetchedProperties {
} AccountFetchedProperties;

@class OrderCredit;





















@interface AccountID : NSManagedObjectID {}
@end

@interface _Account : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AccountID*)objectID;




@property (nonatomic, strong) NSString* accountRecordType;


//- (BOOL)validateAccountRecordType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* address;


//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* city;


//- (BOOL)validateCity:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* coachId;


//- (BOOL)validateCoachId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* currency;


//- (BOOL)validateCurrency:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* fax;


//- (BOOL)validateFax:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* invoice;


@property BOOL invoiceValue;
- (BOOL)invoiceValue;
- (void)setInvoiceValue:(BOOL)value_;

//- (BOOL)validateInvoice:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* latitude;


//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* longitude;


//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* phone;


//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* postalcode;


//- (BOOL)validatePostalcode:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* recordType;


//- (BOOL)validateRecordType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* remoteKey;


//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* repId;


//- (BOOL)validateRepId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* state;


//- (BOOL)validateState:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* street;


//- (BOOL)validateStreet:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* streetref1;


//- (BOOL)validateStreetref1:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* streetref2;


//- (BOOL)validateStreetref2:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OrderCredit* orderCredit;

//- (BOOL)validateOrderCredit:(id*)value_ error:(NSError**)error_;





@end

@interface _Account (CoreDataGeneratedAccessors)

@end

@interface _Account (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountRecordType;
- (void)setPrimitiveAccountRecordType:(NSString*)value;




- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSString*)primitiveCity;
- (void)setPrimitiveCity:(NSString*)value;




- (NSString*)primitiveCoachId;
- (void)setPrimitiveCoachId:(NSString*)value;




- (NSString*)primitiveCurrency;
- (void)setPrimitiveCurrency:(NSString*)value;




- (NSString*)primitiveFax;
- (void)setPrimitiveFax:(NSString*)value;




- (NSNumber*)primitiveInvoice;
- (void)setPrimitiveInvoice:(NSNumber*)value;

- (BOOL)primitiveInvoiceValue;
- (void)setPrimitiveInvoiceValue:(BOOL)value_;




- (NSString*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSString*)value;




- (NSString*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;




- (NSString*)primitivePostalcode;
- (void)setPrimitivePostalcode:(NSString*)value;




- (NSString*)primitiveRecordType;
- (void)setPrimitiveRecordType:(NSString*)value;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveRepId;
- (void)setPrimitiveRepId:(NSString*)value;




- (NSString*)primitiveState;
- (void)setPrimitiveState:(NSString*)value;




- (NSString*)primitiveStreet;
- (void)setPrimitiveStreet:(NSString*)value;




- (NSString*)primitiveStreetref1;
- (void)setPrimitiveStreetref1:(NSString*)value;




- (NSString*)primitiveStreetref2;
- (void)setPrimitiveStreetref2:(NSString*)value;





- (OrderCredit*)primitiveOrderCredit;
- (void)setPrimitiveOrderCredit:(OrderCredit*)value;


@end
