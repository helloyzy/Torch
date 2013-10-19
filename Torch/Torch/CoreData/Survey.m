#import "Survey.h"
#import "Store.h"
#import <RestKit/RestKit.h>
#import <NSManagedObject+InnerBand.h>


#define MARKETING_SURVEY @"Market Survey"
#define SEGMENTATION_SURVEY @"Segmentation Survey"

#define CHOICE_QUESTION @"choice"
#define NUMERIC_QUESTION @"numeric"
#define TEXT_QUESTION @"text"

@interface Survey ()

@end


@implementation Survey

+ (RKEntityMapping *)objectMapping {
    RKEntityMapping *mapping = [super objectMapping];
    [mapping addAttributeMappingsFromArray:@[SurveyAttributes.accountId,
     SurveyAttributes.questionId,
     SurveyAttributes.recordType,
     SurveyAttributes.answers,
     SurveyAttributes.question,
     SurveyAttributes.questionType,
     SurveyAttributes.questionTypeId]];
    return mapping;
}

- (NSArray*) answersFromString {
    assert(self.answers != NULL);
    return [self.answers componentsSeparatedByString:@";"];
}

- (SurveyType)surveyType {
    if ([self.recordType isEqualToString:MARKETING_SURVEY]) {
        return MarketingSurvey;
    } else {
        return SegmentationSurvey;
    }
}

- (SurveyQuestionType)surveyQuestionType {
//    if ([self.questionType isEqualToString:CHOICE_QUESTION]) {
//        return ChoiceQuestion;
//    } else if ([self.questionType isEqualToString:NUMERIC_QUESTION]) {
//        return NumericQuestion;
//    } else {
//        return TextQuestion;
//    }
    if ([self surveyType] == MarketingSurvey) {
        return TextQuestion;
    } else {
        return ChoiceQuestion;
    }
}

#pragma mark - retrieving different type of questions

+ (NSArray *)marketingSurveyQuestions:(Store *)store {
    NSString *storeId = store.remoteKey;
    return [self retrieveSurveyQuestions:storeId surveyType:MARKETING_SURVEY];
}

+ (NSArray *)segmentationSurveyQuestions:(Store *)store {
    NSString *storeId = store.remoteKey;
    return [self retrieveSurveyQuestions:storeId surveyType:SEGMENTATION_SURVEY];
}

+ (NSArray *)retrieveSurveyQuestions:(NSString *)storeId surveyType:(NSString *)surveyType {
    NSString * predicate = [NSString stringWithFormat:@"%@ = '%@' and %@ = '%@'", SurveyAttributes.accountId, storeId, SurveyAttributes.recordType, surveyType];
    return [self allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[self dataStore]];
}

//+ (id)newInstance {
//    Survey *result = [super newInstance];
//    result.localStatus = LOCAL_STATUS_NEW;
//    [result save];
//    return result;
//}

#pragma mark - mock data

+ (void)generateMockSurveys:(NSString *)storeId groupId:(NSString *)groupId {
    /**
    Survey *survey = [Survey newInstance];
    survey.accountId = storeId;
    survey.questionTypeId = groupId;
    survey.questionType = CHOICE_QUESTION;
    survey.question = @"Choice question";
    survey.answers = @"Yes,No";
    [self save];
    survey = [Survey newInstance];
    survey.accountId = storeId;
    survey.questionTypeId = groupId;
    survey.questionType = NUMERIC_QUESTION;
    survey.question = @"Numeric question";
    survey.answers = @"";
    [self save];
    survey = [Survey newInstance];
    survey.accountId = storeId;
    survey.questionTypeId = groupId;
    survey.questionType = TEXT_QUESTION;
    survey.question = @"Text question";
    survey.answers = @"";
    [self save];
     */
    int key = 1;
    if ([groupId isEqualToString:MARKETING_SURVEY]) { // all text questions
        for (int i = 1; i <= 3; i++) {
            Survey *survey = [Survey newInstance];
            survey.questionId = [NSString stringWithFormat:@"%i", key++];
            survey.accountId = storeId;
            survey.recordType = groupId;
            survey.question = [NSString stringWithFormat:@"Cuantas barras de la competencia hay de 14 gr? -  %d", i];
            [self save];
        }
        Survey *survey = [Survey newInstance];
        survey.questionId = [NSString stringWithFormat:@"%i", key++];
        survey.accountId = storeId;
        survey.recordType = groupId;
        survey.question = @"A very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text question?";
        [self save];
    } else {
        for (int i = 1; i <= 3; i++) {
            Survey *survey = [Survey newInstance];
            survey.questionId = [NSString stringWithFormat:@"%i", key++];
            survey.accountId = storeId;
            survey.recordType = groupId;
            survey.question = [NSString stringWithFormat:@"¿Tiene productos de coca? -- %d", i];
            survey.answers = @"Yes;No;N/A";
            [self save];
        }
    }
}

+ (void)generateMockMarketingSurveys:(NSString *)storeId {
    [self generateMockSurveys:storeId groupId:MARKETING_SURVEY];
}

+ (void)generateMockSegmentationSurveys:(NSString *)storeId {
    [self generateMockSurveys:storeId groupId:SEGMENTATION_SURVEY];
}

+ (void)generateMockSurveys {
    NSArray *stores = [Store sortedStores];
    for (Store *store in stores) {
        NSString *storeId = store.remoteKey;
        [self generateMockSurveys:storeId groupId:MARKETING_SURVEY];
        [self generateMockSurveys:storeId groupId:SEGMENTATION_SURVEY];
    }
}

@end
