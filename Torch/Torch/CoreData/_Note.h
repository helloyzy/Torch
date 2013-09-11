// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Note.h instead.

#import <CoreData/CoreData.h>


extern const struct NoteAttributes {
	__unsafe_unretained NSString *body;
	__unsafe_unretained NSString *createdDate;
	__unsafe_unretained NSString *externalDate;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
} NoteAttributes;

extern const struct NoteRelationships {
	__unsafe_unretained NSString *contact;
	__unsafe_unretained NSString *storeCall;
} NoteRelationships;

extern const struct NoteFetchedProperties {
} NoteFetchedProperties;

@class Contact;
@class StoreCall;









@interface NoteID : NSManagedObjectID {}
@end

@interface _Note : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (NoteID*)objectID;





@property (nonatomic, strong) NSString* body;



//- (BOOL)validateBody:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* createdDate;



@property double createdDateValue;
- (double)createdDateValue;
- (void)setCreatedDateValue:(double)value_;

//- (BOOL)validateCreatedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* externalDate;



@property double externalDateValue;
- (double)externalDateValue;
- (void)setExternalDateValue:(double)value_;

//- (BOOL)validateExternalDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lastModifiedDate;



@property double lastModifiedDateValue;
- (double)lastModifiedDateValue;
- (void)setLastModifiedDateValue:(double)value_;

//- (BOOL)validateLastModifiedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteKey;



//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Contact *contact;

//- (BOOL)validateContact:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) StoreCall *storeCall;

//- (BOOL)validateStoreCall:(id*)value_ error:(NSError**)error_;





@end

@interface _Note (CoreDataGeneratedAccessors)

@end

@interface _Note (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBody;
- (void)setPrimitiveBody:(NSString*)value;




- (NSNumber*)primitiveCreatedDate;
- (void)setPrimitiveCreatedDate:(NSNumber*)value;

- (double)primitiveCreatedDateValue;
- (void)setPrimitiveCreatedDateValue:(double)value_;




- (NSNumber*)primitiveExternalDate;
- (void)setPrimitiveExternalDate:(NSNumber*)value;

- (double)primitiveExternalDateValue;
- (void)setPrimitiveExternalDateValue:(double)value_;




- (NSNumber*)primitiveLastModifiedDate;
- (void)setPrimitiveLastModifiedDate:(NSNumber*)value;

- (double)primitiveLastModifiedDateValue;
- (void)setPrimitiveLastModifiedDateValue:(double)value_;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (Contact*)primitiveContact;
- (void)setPrimitiveContact:(Contact*)value;



- (StoreCall*)primitiveStoreCall;
- (void)setPrimitiveStoreCall:(StoreCall*)value;


@end
