#import "_SurveyResponse.h"
#import "NSManagedObject+TCRestkit.h"

@interface SurveyResponse : _SurveyResponse {}
// Custom logic goes here.

+ (NSArray *)surveyResponsesToSend;
+ (void)markAsDelivered:(NSArray *)surveyResponses;
+ (NSSet *)storeNamesForSurveyResponses;

@end
