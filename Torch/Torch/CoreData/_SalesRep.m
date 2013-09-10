// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SalesRep.m instead.

#import "_SalesRep.h"

const struct SalesRepAttributes SalesRepAttributes = {
	.firstName = @"firstName",
	.lastModifiedDate = @"lastModifiedDate",
	.lastName = @"lastName",
	.lastUpdated = @"lastUpdated",
	.managerNetworkId = @"managerNetworkId",
	.networkId = @"networkId",
	.remoteKey = @"remoteKey",
	.status = @"status",
};

const struct SalesRepRelationships SalesRepRelationships = {
	.banners = @"banners",
};

const struct SalesRepFetchedProperties SalesRepFetchedProperties = {
};

@implementation SalesRepID
@end

@implementation _SalesRep

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SalesRep" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SalesRep";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SalesRep" inManagedObjectContext:moc_];
}

- (SalesRepID*)objectID {
	return (SalesRepID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lastUpdatedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastUpdated"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic firstName;






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





@dynamic lastName;






@dynamic lastUpdated;



- (double)lastUpdatedValue {
	NSNumber *result = [self lastUpdated];
	return [result doubleValue];
}

- (void)setLastUpdatedValue:(double)value_ {
	[self setLastUpdated:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLastUpdatedValue {
	NSNumber *result = [self primitiveLastUpdated];
	return [result doubleValue];
}

- (void)setPrimitiveLastUpdatedValue:(double)value_ {
	[self setPrimitiveLastUpdated:[NSNumber numberWithDouble:value_]];
}





@dynamic managerNetworkId;






@dynamic networkId;






@dynamic remoteKey;






@dynamic status;






@dynamic banners;

	
- (NSMutableSet*)bannersSet {
	[self willAccessValueForKey:@"banners"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"banners"];
  
	[self didAccessValueForKey:@"banners"];
	return result;
}
	






@end
