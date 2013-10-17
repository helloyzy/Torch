// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Survey.m instead.

#import "_Survey.h"

const struct SurveyAttributes SurveyAttributes = {
	.accountId = @"accountId",
	.answers = @"answers",
	.question = @"question",
	.questionId = @"questionId",
	.questionType = @"questionType",
	.questionTypeId = @"questionTypeId",
	.recordType = @"recordType",
};

const struct SurveyRelationships SurveyRelationships = {
};

const struct SurveyFetchedProperties SurveyFetchedProperties = {
};

@implementation SurveyID
@end

@implementation _Survey

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Survey" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Survey";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Survey" inManagedObjectContext:moc_];
}

- (SurveyID*)objectID {
	return (SurveyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic accountId;






@dynamic answers;






@dynamic question;






@dynamic questionId;






@dynamic questionType;






@dynamic questionTypeId;






@dynamic recordType;











@end
