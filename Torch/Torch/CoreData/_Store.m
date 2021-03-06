// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Store.m instead.

#import "_Store.h"

const struct StoreAttributes StoreAttributes = {
	.accountRecordType = @"accountRecordType",
	.address = @"address",
	.analytics = @"analytics",
	.callFrequency = @"callFrequency",
	.city = @"city",
	.country = @"country",
	.creditAddress = @"creditAddress",
	.creditType = @"creditType",
	.currency = @"currency",
	.customerType = @"customerType",
	.distributor = @"distributor",
	.faxNumber = @"faxNumber",
	.gstTaxNumber = @"gstTaxNumber",
	.isSendInvoice = @"isSendInvoice",
	.lastModifiedDate = @"lastModifiedDate",
	.latitude = @"latitude",
	.localStatus = @"localStatus",
	.longitude = @"longitude",
	.modelTime = @"modelTime",
	.municipality = @"municipality",
	.name = @"name",
	.number = @"number",
	.phone = @"phone",
	.postalCode = @"postalCode",
	.priority = @"priority",
	.products = @"products",
	.pstTaxNumber = @"pstTaxNumber",
	.remoteKey = @"remoteKey",
	.rfc = @"rfc",
	.schedule = @"schedule",
	.soldToName = @"soldToName",
	.soldToNumber = @"soldToNumber",
	.state = @"state",
	.street = @"street",
	.streetRef1 = @"streetRef1",
	.streetRef2 = @"streetRef2",
};

const struct StoreRelationships StoreRelationships = {
	.banner = @"banner",
	.contacts = @"contacts",
	.storeCalls = @"storeCalls",
};

const struct StoreFetchedProperties StoreFetchedProperties = {
};

@implementation StoreID
@end

@implementation _Store

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Store" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Store";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Store" inManagedObjectContext:moc_];
}

- (StoreID*)objectID {
	return (StoreID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"callFrequencyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"callFrequency"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"isSendInvoiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isSendInvoice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"modelTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"modelTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"priorityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"priority"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"scheduleValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"schedule"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic accountRecordType;






@dynamic address;






@dynamic analytics;






@dynamic callFrequency;



- (double)callFrequencyValue {
	NSNumber *result = [self callFrequency];
	return [result doubleValue];
}

- (void)setCallFrequencyValue:(double)value_ {
	[self setCallFrequency:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveCallFrequencyValue {
	NSNumber *result = [self primitiveCallFrequency];
	return [result doubleValue];
}

- (void)setPrimitiveCallFrequencyValue:(double)value_ {
	[self setPrimitiveCallFrequency:[NSNumber numberWithDouble:value_]];
}





@dynamic city;






@dynamic country;






@dynamic creditAddress;






@dynamic creditType;






@dynamic currency;






@dynamic customerType;






@dynamic distributor;






@dynamic faxNumber;






@dynamic gstTaxNumber;






@dynamic isSendInvoice;



- (BOOL)isSendInvoiceValue {
	NSNumber *result = [self isSendInvoice];
	return [result boolValue];
}

- (void)setIsSendInvoiceValue:(BOOL)value_ {
	[self setIsSendInvoice:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsSendInvoiceValue {
	NSNumber *result = [self primitiveIsSendInvoice];
	return [result boolValue];
}

- (void)setPrimitiveIsSendInvoiceValue:(BOOL)value_ {
	[self setPrimitiveIsSendInvoice:[NSNumber numberWithBool:value_]];
}





@dynamic lastModifiedDate;



- (double)lastModifiedDateValue {
	NSNumber *result = [self lastModifiedDate];
	return [result doubleValue];
}

- (void)setLastModifiedDateValue:(double)value_ {
	[self setLastModifiedDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLastModifiedDateValue {
	NSNumber *result = [self primitiveLastModifiedDate];
	return [result doubleValue];
}

- (void)setPrimitiveLastModifiedDateValue:(double)value_ {
	[self setPrimitiveLastModifiedDate:[NSNumber numberWithDouble:value_]];
}





@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic localStatus;






@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic modelTime;



- (double)modelTimeValue {
	NSNumber *result = [self modelTime];
	return [result doubleValue];
}

- (void)setModelTimeValue:(double)value_ {
	[self setModelTime:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveModelTimeValue {
	NSNumber *result = [self primitiveModelTime];
	return [result doubleValue];
}

- (void)setPrimitiveModelTimeValue:(double)value_ {
	[self setPrimitiveModelTime:[NSNumber numberWithDouble:value_]];
}





@dynamic municipality;






@dynamic name;






@dynamic number;






@dynamic phone;






@dynamic postalCode;






@dynamic priority;



- (BOOL)priorityValue {
	NSNumber *result = [self priority];
	return [result boolValue];
}

- (void)setPriorityValue:(BOOL)value_ {
	[self setPriority:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePriorityValue {
	NSNumber *result = [self primitivePriority];
	return [result boolValue];
}

- (void)setPrimitivePriorityValue:(BOOL)value_ {
	[self setPrimitivePriority:[NSNumber numberWithBool:value_]];
}





@dynamic products;






@dynamic pstTaxNumber;






@dynamic remoteKey;






@dynamic rfc;






@dynamic schedule;



- (double)scheduleValue {
	NSNumber *result = [self schedule];
	return [result doubleValue];
}

- (void)setScheduleValue:(double)value_ {
	[self setSchedule:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveScheduleValue {
	NSNumber *result = [self primitiveSchedule];
	return [result doubleValue];
}

- (void)setPrimitiveScheduleValue:(double)value_ {
	[self setPrimitiveSchedule:[NSNumber numberWithDouble:value_]];
}





@dynamic soldToName;






@dynamic soldToNumber;






@dynamic state;






@dynamic street;






@dynamic streetRef1;






@dynamic streetRef2;






@dynamic banner;

	

@dynamic contacts;

	
- (NSMutableSet*)contactsSet {
	[self willAccessValueForKey:@"contacts"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"contacts"];
  
	[self didAccessValueForKey:@"contacts"];
	return result;
}
	

@dynamic storeCalls;

	
- (NSMutableSet*)storeCallsSet {
	[self willAccessValueForKey:@"storeCalls"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"storeCalls"];
  
	[self didAccessValueForKey:@"storeCalls"];
	return result;
}
	






@end
