#import "Contact.h"
#import <RestKit.h>

@interface Contact ()

// Private interface goes here.

@end


@implementation Contact

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromArray:@[
     ContactAttributes.bestDays,
     ContactAttributes.bestTimes,
     ContactAttributes.contactType,
     ContactAttributes.email,
     ContactAttributes.faxNumber,
     ContactAttributes.firstName,
     ContactAttributes.isKdm,
     ContactAttributes.lastName,
     ContactAttributes.mobilePhone,
     ContactAttributes.phoneNumber,
     ContactAttributes.picture,
     ContactAttributes.preferredContactMethod,
     ContactAttributes.remoteKey,
     ContactAttributes.textNumber,
     ContactAttributes.title
     ]];
    return mapping;
}

@end
