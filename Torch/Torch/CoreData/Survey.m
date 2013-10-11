#import "Survey.h"
#import <RestKit/RestKit.h>

@interface Survey ()

@property (getter=answersFromString, readonly) NSArray* answerArray;

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

- (NSArray*) answersFromString {
    assert(self.answers != NULL);
    return [self.answers componentsSeparatedByString:@","];
}

@end
