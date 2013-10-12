#import "Account.h"
#import <RestKit.h>

@interface Account ()

// Private interface goes here.

@end


@implementation Account

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Account" inManagedObjectStore:[RKManagedObjectStore defaultStore]];;
   
    [mapping addAttributeMappingsFromArray:@[
     AccountAttributes.address,
     AccountAttributes.city,
     AccountAttributes.currency,
     AccountAttributes.name,
     AccountAttributes.phone,
     AccountAttributes.postalcode,
     AccountAttributes.state,
     AccountAttributes.remoteKey,
     AccountAttributes.accountRecordType,
     AccountAttributes.repId,
     AccountAttributes.coachId,
     AccountAttributes.longitude,
     AccountAttributes.latitude
     ]];
    return mapping;
}

@end
