// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Survey.h instead.

#import <CoreData/CoreData.h>


extern const struct SurveyAttributes {
	__unsafe_unretained NSString *accountId;
	__unsafe_unretained NSString *answers;
	__unsafe_unretained NSString *question;
	__unsafe_unretained NSString *questionId;
	__unsafe_unretained NSString *questionType;
	__unsafe_unretained NSString *questionTypeId;
	__unsafe_unretained NSString *recordType;
} SurveyAttributes;

extern const struct SurveyRelationships {
} SurveyRelationships;

extern const struct SurveyFetchedProperties {
} SurveyFetchedProperties;










@interface SurveyID : NSManagedObjectID {}
@end

@interface _Survey : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SurveyID*)objectID;





@property (nonatomic, strong) NSString* accountId;



//- (BOOL)validateAccountId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* answers;



//- (BOOL)validateAnswers:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* question;



//- (BOOL)validateQuestion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* questionId;



//- (BOOL)validateQuestionId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* questionType;



//- (BOOL)validateQuestionType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* questionTypeId;



//- (BOOL)validateQuestionTypeId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* recordType;



//- (BOOL)validateRecordType:(id*)value_ error:(NSError**)error_;






@end

@interface _Survey (CoreDataGeneratedAccessors)

@end

@interface _Survey (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountId;
- (void)setPrimitiveAccountId:(NSString*)value;




- (NSString*)primitiveAnswers;
- (void)setPrimitiveAnswers:(NSString*)value;




- (NSString*)primitiveQuestion;
- (void)setPrimitiveQuestion:(NSString*)value;




- (NSString*)primitiveQuestionId;
- (void)setPrimitiveQuestionId:(NSString*)value;




- (NSString*)primitiveQuestionType;
- (void)setPrimitiveQuestionType:(NSString*)value;




- (NSString*)primitiveQuestionTypeId;
- (void)setPrimitiveQuestionTypeId:(NSString*)value;




- (NSString*)primitiveRecordType;
- (void)setPrimitiveRecordType:(NSString*)value;




@end
