#import "SurveyResponse.h"
#import <RKEntityMapping.h>
#import <NSManagedObject+InnerBand.h>

@interface SurveyResponse ()

// Private interface goes here.

@end


@implementation SurveyResponse

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [super objectMapping];
    [mapping addAttributeMappingsFromArray:@[SurveyResponseAttributes.questionId,
     SurveyResponseAttributes.accountId,
     SurveyResponseAttributes.pickAnswer,
     SurveyResponseAttributes.textAnswer]];
    return mapping;
}

+ (id)newInstance {
    SurveyResponse *result = [super newInstance];
    result.localStatus = LOCAL_STATUS_NEW;
    [result save];
    return result;
}

+ (NSArray *)surveyResponsesToSend {
    NSString * predicate = [NSString stringWithFormat:@"%@ = '%@'", SurveyResponseAttributes.localStatus, LOCAL_STATUS_NEW];
    return [self allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[self dataStore]];
}

// should be invoked in main thread
+ (void)markAsDelivered:(NSArray *)surveyResponses {
    for (SurveyResponse *surveyResponse in surveyResponses) {
        surveyResponse.localStatus = LOCAL_STATUS_DELIVERED;
    }
    [SurveyResponse save];
}

+ (NSSet *)storeNamesForSurveyResponses {
    NSArray *surveyResponses = [self surveyResponsesToSend];
    NSMutableSet *result = [[NSMutableSet alloc]init];
    for (SurveyResponse *surveyResponse in surveyResponses) {
        [result addObject:surveyResponse.accountName];
    }
    return result;
}

@end
