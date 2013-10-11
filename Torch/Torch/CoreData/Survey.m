#import "Survey.h"
#import <RestKit/RestKit.h>

#define MARKETING_SURVEY @"1"
#define SEGMENTATION_SURVEY @"2"

#define CHOICE_QUESTION @"choice"
#define NUMERIC_QUESTION @"numeric"
#define TEXT_QUESTION @"text"

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

- (SurveyType)surveyType {
    if ([self.questionTypeId isEqualToString:MARKETING_SURVEY]) {
        return MarketingSurvey;
    } else {
        return SegmentationSurvey;
    }
}

- (SurveyQuestionType)surveyQuestionType {
    if ([self.questionType isEqualToString:CHOICE_QUESTION]) {
        return ChoiceQuestion;
    } else if ([self.questionType isEqualToString:NUMERIC_QUESTION]) {
        return NumericQuestion;
    } else {
        return TextQuestion;
    }
}

#pragma mark - mock data

+ (void)generateMockSurveys:(NSString *)storeId groupId:(NSString *)groupId {
    Survey *survey = [Survey newInstance];
    survey.accountId = storeId;
    survey.questionTypeId = groupId;
    survey.questionType = CHOICE_QUESTION;
    survey.question = @"Choice question";
    survey.answers = @"Yes,No";
    [Survey save];
    survey = [Survey newInstance];
    survey.accountId = storeId;
    survey.questionTypeId = groupId;
    survey.questionType = NUMERIC_QUESTION;
    survey.question = @"Numeric question";
    survey.answers = @"";
    [Survey save];
    survey = [Survey newInstance];
    survey.accountId = storeId;
    survey.questionTypeId = groupId;
    survey.questionType = TEXT_QUESTION;
    survey.question = @"Text question";
    survey.answers = @"";
    [Survey save];
}

+ (void)generateMockMarketingSurveys:(NSString *)storeId {
    [self generateMockSurveys:storeId groupId:MARKETING_SURVEY];
}

+ (void)generateMockSegmentationSurveys:(NSString *)storeId {
    [self generateMockSurveys:storeId groupId:SEGMENTATION_SURVEY];
}

+ (void)generateMockSurveys:(NSString *)storeId {
    [self generateMockSurveys:storeId groupId:MARKETING_SURVEY];
    [self generateMockSurveys:storeId groupId:SEGMENTATION_SURVEY];
}

@end
