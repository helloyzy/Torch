// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Store.m instead.

#import "_Store.h"

const struct StoreAttributes StoreAttributes = {
	.address = @"address",
	.analytics = @"analytics",
	.city = @"city",
	.country = @"country",
	.creditAddress = @"creditAddress",
	.creditType = @"creditType",
	.distributor = @"distributor",
	.faxNumber = @"faxNumber",
	.lastModifiedDate = @"lastModifiedDate",
	.modelTime = @"modelTime",
	.name = @"name",
	.number = @"number",
	.postalCode = @"postalCode",
	.products = @"products",
	.remoteKey = @"remoteKey",
	.schedule = @"schedule",
	.state = @"state",
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

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"modelTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"modelTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic address;






@dynamic analytics;






@dynamic city;






@dynamic country;






@dynamic creditAddress;






@dynamic creditType;






@dynamic distributor;






@dynamic faxNumber;






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





@dynamic name;






@dynamic number;






@dynamic postalCode;






@dynamic products;






@dynamic remoteKey;






@dynamic schedule;






@dynamic state;






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
