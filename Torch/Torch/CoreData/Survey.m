#import "Survey.h"
#import <RestKit/RestKit.h>

@interface Survey ()

// Private interface goes here.

@end


@implementation Survey

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [super objectMapping];
    [mapping addAttributeMappingsFromArray:@[SurveyAttributes.accountId,
     SurveyAttributes.answers,
     SurveyAttributes.question,
     SurveyAttributes.questionType,
     SurveyAttributes.questionTypeId]];
    return mapping;
}

@end
