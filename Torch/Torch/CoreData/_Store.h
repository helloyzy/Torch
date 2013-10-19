// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Store.h instead.

#import <CoreData/CoreData.h>


extern const struct StoreAttributes {
	__unsafe_unretained NSString *accountRecordType;
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *analytics;
	__unsafe_unretained NSString *callFrequency;
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *country;
	__unsafe_unretained NSString *creditAddress;
	__unsafe_unretained NSString *creditType;
	__unsafe_unretained NSString *currency;
	__unsafe_unretained NSString *customerType;
	__unsafe_unretained NSString *distributor;
	__unsafe_unretained NSString *faxNumber;
	__unsafe_unretained NSString *gstTaxNumber;
	__unsafe_unretained NSString *isSendInvoice;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *localStatus;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *modelTime;
	__unsafe_unretained NSString *municipality;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *number;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *postalCode;
	__unsafe_unretained NSString *priority;
	__unsafe_unretained NSString *products;
	__unsafe_unretained NSString *pstTaxNumber;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *rfc;
	__unsafe_unretained NSString *schedule;
	__unsafe_unretained NSString *soldToName;
	__unsafe_unretained NSString *soldToNumber;
	__unsafe_unretained NSString *state;
	__unsafe_unretained NSString *street;
	__unsafe_unretained NSString *streetRef1;
	__unsafe_unretained NSString *streetRef2;
} StoreAttributes;

extern const struct StoreRelationships {
	__unsafe_unretained NSString *banner;
	__unsafe_unretained NSString *contacts;
	__unsafe_unretained NSString *storeCalls;
} StoreRelationships;

extern const struct StoreFetchedProperties {
} StoreFetchedProperties;

@class Banner;
@class Contact;
@class StoreCall;






































@interface StoreID : NSManagedObjectID {}
@end

@interface _Store : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StoreID*)objectID;




@property (nonatomic, strong) NSString* accountRecordType;


//- (BOOL)validateAccountRecordType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* address;


//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* analytics;


//- (BOOL)validateAnalytics:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* callFrequency;


@property double callFrequencyValue;
- (double)callFrequencyValue;
- (void)setCallFrequencyValue:(double)value_;

//- (BOOL)validateCallFrequency:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* city;


//- (BOOL)validateCity:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* country;


//- (BOOL)validateCountry:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* creditAddress;


//- (BOOL)validateCreditAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* creditType;


//- (BOOL)validateCreditType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* currency;


//- (BOOL)validateCurrency:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* customerType;


//- (BOOL)validateCustomerType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* distributor;


//- (BOOL)validateDistributor:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* faxNumber;


//- (BOOL)validateFaxNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* gstTaxNumber;


//- (BOOL)validateGstTaxNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* isSendInvoice;


@property BOOL isSendInvoiceValue;
- (BOOL)isSendInvoiceValue;
- (void)setIsSendInvoiceValue:(BOOL)value_;

//- (BOOL)validateIsSendInvoice:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* lastModifiedDate;


@property double lastModifiedDateValue;
- (double)lastModifiedDateValue;
- (void)setLastModifiedDateValue:(double)value_;

//- (BOOL)validateLastModifiedDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* latitude;


@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* localStatus;


//- (BOOL)validateLocalStatus:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* longitude;


@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* modelTime;


@property double modelTimeValue;
- (double)modelTimeValue;
- (void)setModelTimeValue:(double)value_;

//- (BOOL)validateModelTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* municipality;


//- (BOOL)validateMunicipality:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* number;


//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* phone;


//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* postalCode;


//- (BOOL)validatePostalCode:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* priority;


@property BOOL priorityValue;
- (BOOL)priorityValue;
- (void)setPriorityValue:(BOOL)value_;

//- (BOOL)validatePriority:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* products;


//- (BOOL)validateProducts:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* pstTaxNumber;


//- (BOOL)validatePstTaxNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* remoteKey;


//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* rfc;


//- (BOOL)validateRfc:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* schedule;


@property double scheduleValue;
- (double)scheduleValue;
- (void)setScheduleValue:(double)value_;

//- (BOOL)validateSchedule:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* soldToName;


//- (BOOL)validateSoldToName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* soldToNumber;


//- (BOOL)validateSoldToNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* state;


//- (BOOL)validateState:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* street;


//- (BOOL)validateStreet:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* streetRef1;


//- (BOOL)validateStreetRef1:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* streetRef2;


//- (BOOL)validateStreetRef2:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Banner* banner;

//- (BOOL)validateBanner:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* contacts;

- (NSMutableSet*)contactsSet;




@property (nonatomic, strong) NSSet* storeCalls;

- (NSMutableSet*)storeCallsSet;





@end

@interface _Store (CoreDataGeneratedAccessors)

- (void)addContacts:(NSSet*)value_;
- (void)removeContacts:(NSSet*)value_;
- (void)addContactsObject:(Contact*)value_;
- (void)removeContactsObject:(Contact*)value_;

- (void)addStoreCalls:(NSSet*)value_;
- (void)removeStoreCalls:(NSSet*)value_;
- (void)addStoreCallsObject:(StoreCall*)value_;
- (void)removeStoreCallsObject:(StoreCall*)value_;

@end

@interface _Store (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountRecordType;
- (void)setPrimitiveAccountRecordType:(NSString*)value;




- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSString*)primitiveAnalytics;
- (void)setPrimitiveAnalytics:(NSString*)value;




- (NSNumber*)primitiveCallFrequency;
- (void)setPrimitiveCallFrequency:(NSNumber*)value;

- (double)primitiveCallFrequencyValue;
- (void)setPrimitiveCallFrequencyValue:(double)value_;




- (NSString*)primitiveCity;
- (void)setPrimitiveCity:(NSString*)value;




- (NSString*)primitiveCountry;
- (void)setPrimitiveCountry:(NSString*)value;




- (NSString*)primitiveCreditAddress;
- (void)setPrimitiveCreditAddress:(NSString*)value;




- (NSString*)primitiveCreditType;
- (void)setPrimitiveCreditType:(NSString*)value;




- (NSString*)primitiveCurrency;
- (void)setPrimitiveCurrency:(NSString*)value;




- (NSString*)primitiveCustomerType;
- (void)setPrimitiveCustomerType:(NSString*)value;




- (NSString*)primitiveDistributor;
- (void)setPrimitiveDistributor:(NSString*)value;




- (NSString*)primitiveFaxNumber;
- (void)setPrimitiveFaxNumber:(NSString*)value;




- (NSString*)primitiveGstTaxNumber;
- (void)setPrimitiveGstTaxNumber:(NSString*)value;




- (NSNumber*)primitiveIsSendInvoice;
- (void)setPrimitiveIsSendInvoice:(NSNumber*)value;

- (BOOL)primitiveIsSendInvoiceValue;
- (void)setPrimitiveIsSendInvoiceValue:(BOOL)value_;




- (NSNumber*)primitiveLastModifiedDate;
- (void)setPrimitiveLastModifiedDate:(NSNumber*)value;

- (double)primitiveLastModifiedDateValue;
- (void)setPrimitiveLastModifiedDateValue:(double)value_;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSString*)primitiveLocalStatus;
- (void)setPrimitiveLocalStatus:(NSString*)value;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSNumber*)primitiveModelTime;
- (void)setPrimitiveModelTime:(NSNumber*)value;

- (double)primitiveModelTimeValue;
- (void)setPrimitiveModelTimeValue:(double)value_;




- (NSString*)primitiveMunicipality;
- (void)setPrimitiveMunicipality:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNumber;
- (void)setPrimitiveNumber:(NSString*)value;




- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;




- (NSString*)primitivePostalCode;
- (void)setPrimitivePostalCode:(NSString*)value;




- (NSNumber*)primitivePriority;
- (void)setPrimitivePriority:(NSNumber*)value;

- (BOOL)primitivePriorityValue;
- (void)setPrimitivePriorityValue:(BOOL)value_;




- (NSString*)primitiveProducts;
- (void)setPrimitiveProducts:(NSString*)value;




- (NSString*)primitivePstTaxNumber;
- (void)setPrimitivePstTaxNumber:(NSString*)value;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveRfc;
- (void)setPrimitiveRfc:(NSString*)value;




- (NSNumber*)primitiveSchedule;
- (void)setPrimitiveSchedule:(NSNumber*)value;

- (double)primitiveScheduleValue;
- (void)setPrimitiveScheduleValue:(double)value_;




- (NSString*)primitiveSoldToName;
- (void)setPrimitiveSoldToName:(NSString*)value;




- (NSString*)primitiveSoldToNumber;
- (void)setPrimitiveSoldToNumber:(NSString*)value;




- (NSString*)primitiveState;
- (void)setPrimitiveState:(NSString*)value;




- (NSString*)primitiveStreet;
- (void)setPrimitiveStreet:(NSString*)value;




- (NSString*)primitiveStreetRef1;
- (void)setPrimitiveStreetRef1:(NSString*)value;




- (NSString*)primitiveStreetRef2;
- (void)setPrimitiveStreetRef2:(NSString*)value;





- (Banner*)primitiveBanner;
- (void)setPrimitiveBanner:(Banner*)value;



- (NSMutableSet*)primitiveContacts;
- (void)setPrimitiveContacts:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStoreCalls;
- (void)setPrimitiveStoreCalls:(NSMutableSet*)value;


@end
