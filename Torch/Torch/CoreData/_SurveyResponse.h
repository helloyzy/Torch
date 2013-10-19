// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SurveyResponse.h instead.

#import <CoreData/CoreData.h>


extern const struct SurveyResponseAttributes {
	__unsafe_unretained NSString *accountId;
	__unsafe_unretained NSString *pickAnswer;
	__unsafe_unretained NSString *questionId;
	__unsafe_unretained NSString *textAnswer;
} SurveyResponseAttributes;

extern const struct SurveyResponseRelationships {
	__unsafe_unretained NSString *orderCredit;
	__unsafe_unretained NSString *storeCall;
} SurveyResponseRelationships;

extern const struct SurveyResponseFetchedProperties {
} SurveyResponseFetchedProperties;

@class OrderCredit;
@class StoreCall;






@interface SurveyResponseID : NSManagedObjectID {}
@end

@interface _SurveyResponse : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SurveyResponseID*)objectID;




@property (nonatomic, strong) NSString* accountId;


//- (BOOL)validateAccountId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* pickAnswer;


//- (BOOL)validatePickAnswer:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* questionId;


//- (BOOL)validateQuestionId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* textAnswer;


//- (BOOL)validateTextAnswer:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OrderCredit* orderCredit;

//- (BOOL)validateOrderCredit:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) StoreCall* storeCall;

//- (BOOL)validateStoreCall:(id*)value_ error:(NSError**)error_;





@end

@interface _SurveyResponse (CoreDataGeneratedAccessors)

@end

@interface _SurveyResponse (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountId;
- (void)setPrimitiveAccountId:(NSString*)value;




- (NSString*)primitivePickAnswer;
- (void)setPrimitivePickAnswer:(NSString*)value;




- (NSString*)primitiveQuestionId;
- (void)setPrimitiveQuestionId:(NSString*)value;




- (NSString*)primitiveTextAnswer;
- (void)setPrimitiveTextAnswer:(NSString*)value;





- (OrderCredit*)primitiveOrderCredit;
- (void)setPrimitiveOrderCredit:(OrderCredit*)value;



- (StoreCall*)primitiveStoreCall;
- (void)setPrimitiveStoreCall:(StoreCall*)value;


@end
