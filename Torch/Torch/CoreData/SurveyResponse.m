#import "SurveyResponse.h"
#import <RKEntityMapping.h>

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
@end
