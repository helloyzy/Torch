// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SalesRep.h instead.

#import <CoreData/CoreData.h>


extern const struct SalesRepAttributes {
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *lastUpdated;
	__unsafe_unretained NSString *managerNetworkId;
	__unsafe_unretained NSString *networkId;
	__unsafe_unretained NSString *remoteKey;
	__unsafe_unretained NSString *salesOrg;
	__unsafe_unretained NSString *startDate;
	__unsafe_unretained NSString *status;
} SalesRepAttributes;

extern const struct SalesRepRelationships {
	__unsafe_unretained NSString *banners;
} SalesRepRelationships;

extern const struct SalesRepFetchedProperties {
} SalesRepFetchedProperties;

@class Banner;












@interface SalesRepID : NSManagedObjectID {}
@end

@interface _SalesRep : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SalesRepID*)objectID;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lastModifiedDate;



@property double lastModifiedDateValue;
- (double)lastModifiedDateValue;
- (void)setLastModifiedDateValue:(double)value_;

//- (BOOL)validateLastModifiedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lastUpdated;



@property double lastUpdatedValue;
- (double)lastUpdatedValue;
- (void)setLastUpdatedValue:(double)value_;

//- (BOOL)validateLastUpdated:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* managerNetworkId;



//- (BOOL)validateManagerNetworkId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* networkId;



//- (BOOL)validateNetworkId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteKey;



//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* salesOrg;



//- (BOOL)validateSalesOrg:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startDate;



@property double startDateValue;
- (double)startDateValue;
- (void)setStartDateValue:(double)value_;

//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* status;



//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *banners;

- (NSMutableSet*)bannersSet;





@end

@interface _SalesRep (CoreDataGeneratedAccessors)

- (void)addBanners:(NSSet*)value_;
- (void)removeBanners:(NSSet*)value_;
- (void)addBannersObject:(Banner*)value_;
- (void)removeBannersObject:(Banner*)value_;

@end

@interface _SalesRep (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSNumber*)primitiveLastModifiedDate;
- (void)setPrimitiveLastModifiedDate:(NSNumber*)value;

- (double)primitiveLastModifiedDateValue;
- (void)setPrimitiveLastModifiedDateValue:(double)value_;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSNumber*)primitiveLastUpdated;
- (void)setPrimitiveLastUpdated:(NSNumber*)value;

- (double)primitiveLastUpdatedValue;
- (void)setPrimitiveLastUpdatedValue:(double)value_;




- (NSString*)primitiveManagerNetworkId;
- (void)setPrimitiveManagerNetworkId:(NSString*)value;




- (NSString*)primitiveNetworkId;
- (void)setPrimitiveNetworkId:(NSString*)value;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;




- (NSString*)primitiveSalesOrg;
- (void)setPrimitiveSalesOrg:(NSString*)value;




- (NSNumber*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSNumber*)value;

- (double)primitiveStartDateValue;
- (void)setPrimitiveStartDateValue:(double)value_;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;





- (NSMutableSet*)primitiveBanners;
- (void)setPrimitiveBanners:(NSMutableSet*)value;


@end
