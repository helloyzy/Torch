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

@interface Survey : _Survey {}
// Custom logic goes here.

- (SurveyType)surveyType;
- (SurveyQuestionType)surveyQuestionType;

+ (void)generateMockSurveys:(NSString *)storeId;

@end
