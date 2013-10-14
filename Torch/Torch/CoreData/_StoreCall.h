// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to StoreCall.h instead.

#import <CoreData/CoreData.h>


extern const struct StoreCallAttributes {
	__unsafe_unretained NSString *actualEndDate;
	__unsafe_unretained NSString *actualStartDate;
	__unsafe_unretained NSString *callTimeAdjustment;
	__unsafe_unretained NSString *externalId;
	__unsafe_unretained NSString *inventoryTime;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *plannedEndDate;
	__unsafe_unretained NSString *plannedStartDate;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *rider1;
	__unsafe_unretained NSString *rider2;
	__unsafe_unretained NSString *routed;
} StoreCallAttributes;

extern const struct StoreCallRelationships {
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *store;
} StoreCallRelationships;

extern const struct StoreCallFetchedProperties {
} StoreCallFetchedProperties;

@class Note;
@class Store;
















@interface StoreCallID : NSManagedObjectID {}
@end

@interface _StoreCall : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StoreCallID*)objectID;





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





@property (nonatomic, strong) NSString* externalId;



//- (BOOL)validateExternalId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* inventoryTime;



@property double inventoryTimeValue;
- (double)inventoryTimeValue;
- (void)setInventoryTimeValue:(double)value_;

//- (BOOL)validateInventoryTime:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) NSString* rider1;



//- (BOOL)validateRider1:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* rider2;



//- (BOOL)validateRider2:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* routed;



@property BOOL routedValue;
- (BOOL)routedValue;
- (void)setRoutedValue:(BOOL)value_;

//- (BOOL)validateRouted:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;




@property (nonatomic, strong) Store *store;

//- (BOOL)validateStore:(id*)value_ error:(NSError**)error_;





@end

@interface _StoreCall (CoreDataGeneratedAccessors)

- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(Note*)value_;
- (void)removeNotesObject:(Note*)value_;

@end

@interface _StoreCall (CoreDataGeneratedPrimitiveAccessors)


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




- (NSString*)primitiveExternalId;
- (void)setPrimitiveExternalId:(NSString*)value;




- (NSNumber*)primitiveInventoryTime;
- (void)setPrimitiveInventoryTime:(NSNumber*)value;

- (double)primitiveInventoryTimeValue;
- (void)setPrimitiveInventoryTimeValue:(double)value_;




- (NSNumber*)primitiveLastModifiedDate;
- (void)setPrimitiveLastModifiedDate:(NSNumber*)value;

- (double)primitiveLastModifiedDateValue;
- (void)setPrimitiveLastModifiedDateValue:(double)value_;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




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




- (NSString*)primitiveRider1;
- (void)setPrimitiveRider1:(NSString*)value;




- (NSString*)primitiveRider2;
- (void)setPrimitiveRider2:(NSString*)value;




- (NSNumber*)primitiveRouted;
- (void)setPrimitiveRouted:(NSNumber*)value;

- (BOOL)primitiveRoutedValue;
- (void)setPrimitiveRoutedValue:(BOOL)value_;





- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;



- (Store*)primitiveStore;
- (void)setPrimitiveStore:(Store*)value;


@end
