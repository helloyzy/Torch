// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SurveyResponse.h instead.

#import <CoreData/CoreData.h>


extern const struct SurveyResponseAttributes {
	__unsafe_unretained NSString *pickAnswer;
	__unsafe_unretained NSString *questionId;
	__unsafe_unretained NSString *textAnswer;
} SurveyResponseAttributes;

extern const struct SurveyResponseRelationships {
} SurveyResponseRelationships;

extern const struct SurveyResponseFetchedProperties {
} SurveyResponseFetchedProperties;






@interface SurveyResponseID : NSManagedObjectID {}
@end

@interface _SurveyResponse : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SurveyResponseID*)objectID;





@property (nonatomic, strong) NSString* pickAnswer;



//- (BOOL)validatePickAnswer:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* questionId;



//- (BOOL)validateQuestionId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* textAnswer;



//- (BOOL)validateTextAnswer:(id*)value_ error:(NSError**)error_;






@end

@interface _SurveyResponse (CoreDataGeneratedAccessors)

@end

@interface _SurveyResponse (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitivePickAnswer;
- (void)setPrimitivePickAnswer:(NSString*)value;




- (NSString*)primitiveQuestionId;
- (void)setPrimitiveQuestionId:(NSString*)value;




- (NSString*)primitiveTextAnswer;
- (void)setPrimitiveTextAnswer:(NSString*)value;




@end
