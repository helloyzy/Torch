// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Store.h instead.

#import <CoreData/CoreData.h>


extern const struct StoreAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *analytics;
	__unsafe_unretained NSString *callFrequency;
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *country;
	__unsafe_unretained NSString *creditAddress;
	__unsafe_unretained NSString *creditType;
	__unsafe_unretained NSString *distributor;
	__unsafe_unretained NSString *faxNumber;
	__unsafe_unretained NSString *gstTaxNumber;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *modelTime;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *number;
	__unsafe_unretained NSString *postalCode;
	__unsafe_unretained NSString *priority;
	__unsafe_unretained NSString *products;
	__unsafe_unretained NSString *pstTaxNumber;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *schedule;
	__unsafe_unretained NSString *soldToName;
	__unsafe_unretained NSString *soldToNumber;
	__unsafe_unretained NSString *state;
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





@property (nonatomic, strong) NSString* distributor;



//- (BOOL)validateDistributor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* faxNumber;



//- (BOOL)validateFaxNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* gstTaxNumber;



//- (BOOL)validateGstTaxNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lastModifiedDate;



@property double lastModifiedDateValue;
- (double)lastModifiedDateValue;
- (void)setLastModifiedDateValue:(double)value_;

//- (BOOL)validateLastModifiedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* modelTime;



@property double modelTimeValue;
- (double)modelTimeValue;
- (void)setModelTimeValue:(double)value_;

//- (BOOL)validateModelTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* number;



//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) Banner *banner;

//- (BOOL)validateBanner:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *contacts;

- (NSMutableSet*)contactsSet;




@property (nonatomic, strong) NSSet *storeCalls;

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




- (NSString*)primitiveDistributor;
- (void)setPrimitiveDistributor:(NSString*)value;




- (NSString*)primitiveFaxNumber;
- (void)setPrimitiveFaxNumber:(NSString*)value;




- (NSString*)primitiveGstTaxNumber;
- (void)setPrimitiveGstTaxNumber:(NSString*)value;




- (NSNumber*)primitiveLastModifiedDate;
- (void)setPrimitiveLastModifiedDate:(NSNumber*)value;

- (double)primitiveLastModifiedDateValue;
- (void)setPrimitiveLastModifiedDateValue:(double)value_;




- (NSNumber*)primitiveModelTime;
- (void)setPrimitiveModelTime:(NSNumber*)value;

- (double)primitiveModelTimeValue;
- (void)setPrimitiveModelTimeValue:(double)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNumber;
- (void)setPrimitiveNumber:(NSString*)value;




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





- (Banner*)primitiveBanner;
- (void)setPrimitiveBanner:(Banner*)value;



- (NSMutableSet*)primitiveContacts;
- (void)setPrimitiveContacts:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStoreCalls;
- (void)setPrimitiveStoreCalls:(NSMutableSet*)value;


@end
