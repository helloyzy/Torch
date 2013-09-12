#import "Account.h"
#import <RestKit.h>

@interface Account ()

// Private interface goes here.

@end


@implementation Account

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     AccountAttributes.accountID,
     AccountAttributes.address,
     AccountAttributes.city,
     AccountAttributes.currency,
     AccountAttributes.fax,
     AccountAttributes.name,
     AccountAttributes.phone,
     AccountAttributes.postalcode,
     AccountAttributes.recordType,
     AccountAttributes.state,
     AccountAttributes.streetref1,
     AccountAttributes.streetref2
     ]];
    return mapping;
}

@end