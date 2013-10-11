// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Priority.h instead.

#import <CoreData/CoreData.h>


extern const struct PriorityAttributes {
	__unsafe_unretained NSString *accountId;
	__unsafe_unretained NSString *desp;
	__unsafe_unretained NSString *title;
} PriorityAttributes;

extern const struct PriorityRelationships {
} PriorityRelationships;

extern const struct PriorityFetchedProperties {
} PriorityFetchedProperties;






@interface PriorityID : NSManagedObjectID {}
@end

@interface _Priority : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PriorityID*)objectID;





@property (nonatomic, strong) NSString* accountId;



//- (BOOL)validateAccountId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* desp;



//- (BOOL)validateDesp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _Priority (CoreDataGeneratedAccessors)

@end

@interface _Priority (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountId;
- (void)setPrimitiveAccountId:(NSString*)value;




- (NSString*)primitiveDesp;
- (void)setPrimitiveDesp:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
