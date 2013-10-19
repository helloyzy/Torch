// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.m instead.

#import "_Contact.h"

const struct ContactAttributes ContactAttributes = {
	.bestDays = @"bestDays",
	.bestTimes = @"bestTimes",
	.contactType = @"contactType",
	.email = @"email",
	.externalId = @"externalId",
	.faxNumber = @"faxNumber",
	.firstName = @"firstName",
	.isKdm = @"isKdm",
	.lastName = @"lastName",
	.localStatus = @"localStatus",
	.mobilePhone = @"mobilePhone",
	.phoneNumber = @"phoneNumber",
	.picture = @"picture",
	.preferredContactMethod = @"preferredContactMethod",
	.remoteKey = @"remoteKey",
	.textNumber = @"textNumber",
	.title = @"title",
};

const struct ContactRelationships ContactRelationships = {
	.notes = @"notes",
	.orderCredit = @"orderCredit",
	.store = @"store",
};

const struct ContactFetchedProperties ContactFetchedProperties = {
};

@implementation ContactID
@end

@implementation _Contact

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Contact";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:moc_];
}

- (ContactID*)objectID {
	return (ContactID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"bestDaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"bestDays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"bestTimesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"bestTimes"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"isKdmValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isKdm"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic bestDays;



- (double)bestDaysValue {
	NSNumber *result = [self bestDays];
	return [result doubleValue];
}

- (void)setBestDaysValue:(double)value_ {
	[self setBestDays:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveBestDaysValue {
	NSNumber *result = [self primitiveBestDays];
	return [result doubleValue];
}

- (void)setPrimitiveBestDaysValue:(double)value_ {
	[self setPrimitiveBestDays:[NSNumber numberWithDouble:value_]];
}





@dynamic bestTimes;



- (double)bestTimesValue {
	NSNumber *result = [self bestTimes];
	return [result doubleValue];
}

- (void)setBestTimesValue:(double)value_ {
	[self setBestTimes:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveBestTimesValue {
	NSNumber *result = [self primitiveBestTimes];
	return [result doubleValue];
}

- (void)setPrimitiveBestTimesValue:(double)value_ {
	[self setPrimitiveBestTimes:[NSNumber numberWithDouble:value_]];
}





@dynamic contactType;






@dynamic email;






@dynamic externalId;






@dynamic faxNumber;






@dynamic firstName;






@dynamic isKdm;



- (BOOL)isKdmValue {
	NSNumber *result = [self isKdm];
	return [result boolValue];
}

- (void)setIsKdmValue:(BOOL)value_ {
	[self setIsKdm:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsKdmValue {
	NSNumber *result = [self primitiveIsKdm];
	return [result boolValue];
}

- (void)setPrimitiveIsKdmValue:(BOOL)value_ {
	[self setPrimitiveIsKdm:[NSNumber numberWithBool:value_]];
}





@dynamic lastName;






@dynamic localStatus;






@dynamic mobilePhone;






@dynamic phoneNumber;






@dynamic picture;






@dynamic preferredContactMethod;






@dynamic remoteKey;






@dynamic textNumber;






@dynamic title;






@dynamic notes;

	
- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];
  
	[self didAccessValueForKey:@"notes"];
	return result;
}
	

@dynamic orderCredit;

	

@dynamic store;

	






@end
