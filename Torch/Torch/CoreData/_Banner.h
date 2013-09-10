// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Banner.h instead.

#import <CoreData/CoreData.h>


extern const struct BannerAttributes {
	__unsafe_unretained NSString *bannerName;
	__unsafe_unretained NSString *lastModifiedDate;
	__unsafe_unretained NSString *remoteKey;
} BannerAttributes;

extern const struct BannerRelationships {
	__unsafe_unretained NSString *salesRep;
	__unsafe_unretained NSString *stores;
} BannerRelationships;

extern const struct BannerFetchedProperties {
} BannerFetchedProperties;

@class SalesRep;
@class Store;





@interface BannerID : NSManagedObjectID {}
@end

@interface _Banner : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BannerID*)objectID;





@property (nonatomic, strong) NSString* bannerName;



//- (BOOL)validateBannerName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lastModifiedDate;



@property double lastModifiedDateValue;
- (double)lastModifiedDateValue;
- (void)setLastModifiedDateValue:(double)value_;

//- (BOOL)validateLastModifiedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteKey;



//- (BOOL)validateRemoteKey:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) SalesRep *salesRep;

//- (BOOL)validateSalesRep:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *stores;

- (NSMutableSet*)storesSet;





@end

@interface _Banner (CoreDataGeneratedAccessors)

- (void)addStores:(NSSet*)value_;
- (void)removeStores:(NSSet*)value_;
- (void)addStoresObject:(Store*)value_;
- (void)removeStoresObject:(Store*)value_;

@end

@interface _Banner (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBannerName;
- (void)setPrimitiveBannerName:(NSString*)value;




- (NSNumber*)primitiveLastModifiedDate;
- (void)setPrimitiveLastModifiedDate:(NSNumber*)value;

- (double)primitiveLastModifiedDateValue;
- (void)setPrimitiveLastModifiedDateValue:(double)value_;




- (NSString*)primitiveRemoteKey;
- (void)setPrimitiveRemoteKey:(NSString*)value;





- (SalesRep*)primitiveSalesRep;
- (void)setPrimitiveSalesRep:(SalesRep*)value;



- (NSMutableSet*)primitiveStores;
- (void)setPrimitiveStores:(NSMutableSet*)value;


@end
