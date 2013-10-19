// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SurveyResponse.m instead.

#import "_SurveyResponse.h"

const struct SurveyResponseAttributes SurveyResponseAttributes = {
	.accountId = @"accountId",
	.pickAnswer = @"pickAnswer",
	.questionId = @"questionId",
	.textAnswer = @"textAnswer",
};

const struct SurveyResponseRelationships SurveyResponseRelationships = {
	.orderCredit = @"orderCredit",
	.storeCall = @"storeCall",
};

const struct SurveyResponseFetchedProperties SurveyResponseFetchedProperties = {
};

@implementation SurveyResponseID
@end

@implementation _SurveyResponse

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SurveyResponse" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SurveyResponse";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SurveyResponse" inManagedObjectContext:moc_];
}

- (SurveyResponseID*)objectID {
	return (SurveyResponseID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic accountId;






@dynamic pickAnswer;






@dynamic questionId;






@dynamic textAnswer;






@dynamic orderCredit;

	

@dynamic storeCall;

	






@end
