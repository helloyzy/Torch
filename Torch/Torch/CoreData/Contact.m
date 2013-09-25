#import "Contact.h"
#import <RestKit/RestKit.h>
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
     ContactAttributes.title,
     ContactAttributes.externalId
     ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"notes" toKeyPath:@"notes" withMapping:[Note objectMapping]]];
    return mapping;
}

+ (RKEntityMapping *)objectMappingForOrder {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Contact" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     ContactAttributes.bestDays,
     ContactAttributes.lastName,
     ContactAttributes.contactType,
     ContactAttributes.firstName,
     ContactAttributes.title,
     ContactAttributes.phoneNumber,
     ContactAttributes.isKdm,
     ContactAttributes.email,
     ContactAttributes.remoteKey,
     ContactAttributes.textNumber,
     ContactAttributes.faxNumber,
     ContactAttributes.bestTimes,
     ContactAttributes.picture,
     ContactAttributes.preferredContactMethod
     ]];
    return mapping;

}

@end
