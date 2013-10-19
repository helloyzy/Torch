// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to NoteResponse.h instead.

#import <CoreData/CoreData.h>


extern const struct NoteResponseAttributes {
	__unsafe_unretained NSString *message;
	__unsafe_unretained NSString *type;
} NoteResponseAttributes;

extern const struct NoteResponseRelationships {
	__unsafe_unretained NSString *orderCredit;
} NoteResponseRelationships;

extern const struct NoteResponseFetchedProperties {
} NoteResponseFetchedProperties;

@class OrderCredit;




@interface NoteResponseID : NSManagedObjectID {}
@end

@interface _NoteResponse : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (NoteResponseID*)objectID;




@property (nonatomic, strong) NSString* message;


//- (BOOL)validateMessage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* type;


//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OrderCredit* orderCredit;

//- (BOOL)validateOrderCredit:(id*)value_ error:(NSError**)error_;





@end

@interface _NoteResponse (CoreDataGeneratedAccessors)

@end

@interface _NoteResponse (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveMessage;
- (void)setPrimitiveMessage:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (OrderCredit*)primitiveOrderCredit;
- (void)setPrimitiveOrderCredit:(OrderCredit*)value;


@end
