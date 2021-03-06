// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.h instead.

#import <CoreData/CoreData.h>


extern const struct ContactAttributes {
	__unsafe_unretained NSString *bestDays;
	__unsafe_unretained NSString *bestTimes;
	__unsafe_unretained NSString *contactType;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *externalId;
	__unsafe_unretained NSString *faxNumber;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *isKdm;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *localStatus;
	__unsafe_unretained NSString *mobilePhone;
	__unsafe_unretained NSString *phoneNumber;
	__unsafe_unretained NSString *picture;
	__unsafe_unretained NSString *preferredContactMethod;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *textNumber;
	__unsafe_unretained NSString *title;
} ContactAttributes;

extern const struct ContactRelationships {
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *orderCredit;
	__unsafe_unretained NSString *store;
} ContactRelationships;

extern const struct ContactFetchedProperties {
} ContactFetchedProperties;

@class Note;
@class OrderCredit;
@class Store;



















@interface ContactID : NSManagedObjectID {}
@end

@interface _Contact : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ContactID*)objectID;




@property (nonatomic, strong) NSNumber* bestDays;


@property double bestDaysValue;
- (double)bestDaysValue;
- (void)setBestDaysValue:(double)value_;

//- (BOOL)validateBestDays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* bestTimes;


@property double bestTimesValue;
- (double)bestTimesValue;
- (void)setBestTimesValue:(double)value_;

//- (BOOL)validateBestTimes:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* contactType;


//- (BOOL)validateContactType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* email;


//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* externalId;


//- (BOOL)validateExternalId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* faxNumber;


//- (BOOL)validateFaxNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* firstName;


//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* isKdm;


@property BOOL isKdmValue;
- (BOOL)isKdmValue;
- (void)setIsKdmValue:(BOOL)value_;

//- (BOOL)validateIsKdm:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* lastName;


//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* localStatus;


//- (BOOL)validateLocalStatus:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* mobilePhone;


//- (BOOL)validateMobilePhone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* phoneNumber;


//- (BOOL)validatePhoneNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* picture;


//- (BOOL)validatePicture:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* preferredContactMethod;


//- (BOOL)validatePreferredContactMethod:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* remoteKey;


//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* textNumber;


//- (BOOL)validateTextNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* notes;

- (NSMutableSet*)notesSet;




@property (nonatomic, strong) OrderCredit* orderCredit;

//- (BOOL)validateOrderCredit:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Store* store;

//- (BOOL)validateStore:(id*)value_ error:(NSError**)error_;





@end

@interface _Contact (CoreDataGeneratedAccessors)

- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(Note*)value_;
- (void)removeNotesObject:(Note*)value_;

@end

@interface _Contact (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveBestDays;
- (void)setPrimitiveBestDays:(NSNumber*)value;

- (double)primitiveBestDaysValue;
- (void)setPrimitiveBestDaysValue:(double)value_;




- (NSNumber*)primitiveBestTimes;
- (void)setPrimitiveBestTimes:(NSNumber*)value;

- (double)primitiveBestTimesValue;
- (void)setPrimitiveBestTimesValue:(double)value_;




- (NSString*)primitiveContactType;
- (void)setPrimitiveContactType:(NSString*)value;




- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveExternalId;
- (void)setPrimitiveExternalId:(NSString*)value;




- (NSString*)primitiveFaxNumber;
- (void)setPrimitiveFaxNumber:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSNumber*)primitiveIsKdm;
- (void)setPrimitiveIsKdm:(NSNumber*)value;

- (BOOL)primitiveIsKdmValue;
- (void)setPrimitiveIsKdmValue:(BOOL)value_;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSString*)primitiveLocalStatus;
- (void)setPrimitiveLocalStatus:(NSString*)value;




- (NSString*)primitiveMobilePhone;
- (void)setPrimitiveMobilePhone:(NSString*)value;




- (NSString*)primitivePhoneNumber;
- (void)setPrimitivePhoneNumber:(NSString*)value;




- (NSString*)primitivePicture;
- (void)setPrimitivePicture:(NSString*)value;




- (NSString*)primitivePreferredContactMethod;
- (void)setPrimitivePreferredContactMethod:(NSString*)value;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveTextNumber;
- (void)setPrimitiveTextNumber:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;



- (OrderCredit*)primitiveOrderCredit;
- (void)setPrimitiveOrderCredit:(OrderCredit*)value;



- (Store*)primitiveStore;
- (void)setPrimitiveStore:(Store*)value;


@end
