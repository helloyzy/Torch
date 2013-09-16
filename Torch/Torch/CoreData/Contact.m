#import "Contact.h"
#import <RestKit.h>
#import "Note.h"

@interface Contact ()

// Private interface goes here.

@end


@implementation Contact

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Contact" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
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
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"notes" toKeyPath:@"notes" withMapping:[Note objectMapping]]];
    return mapping;
}

@end
