// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Store.h instead.

#import <CoreData/CoreData.h>


extern const struct StoreAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *country;
	__unsafe_unretained NSString *creditAddress;
	__unsafe_unretained NSString *creditType;
	__unsafe_unretained NSString *distributor;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *modelTime;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *number;
	__unsafe_unretained NSString *postalCode;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *schedule;
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





@property (nonatomic, strong) NSString* remoteKey;



//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* schedule;



//- (BOOL)validateSchedule:(id*)value_ error:(NSError**)error_;





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




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveSchedule;
- (void)setPrimitiveSchedule:(NSString*)value;




- (NSString*)primitiveState;
- (void)setPrimitiveState:(NSString*)value;





- (Banner*)primitiveBanner;
- (void)setPrimitiveBanner:(Banner*)value;



- (NSMutableSet*)primitiveContacts;
- (void)setPrimitiveContacts:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStoreCalls;
- (void)setPrimitiveStoreCalls:(NSMutableSet*)value;


@end
