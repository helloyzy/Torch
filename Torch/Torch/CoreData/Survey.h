#import "_Survey.h"
#import "NSManagedObject+TCRestkit.h"

typedef enum {
    MarketingSurvey,
    SegmentationSurvey
} SurveyType;

typedef enum {
    ChoiceQuestion,
    NumericQuestion,
    TextQuestion
} SurveyQuestionType;

@class Store;

@interface Survey : _Survey {}

@property (getter=answersFromString, readonly) NSArray* answerArray;
@property (readonly) SEL selector;

- (SurveyType)surveyType;
- (SurveyQuestionType)surveyQuestionType;

+ (NSArray *)marketingSurveyQuestions:(Store *)store;
+ (NSArray *)segmentationSurveyQuestions:(Store *)store;

+ (void)generateMockSurveys;

@end
