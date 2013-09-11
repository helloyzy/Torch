// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Banner.m instead.

#import "_Banner.h"

const struct BannerAttributes BannerAttributes = {
	.analytics = @"analytics",
	.bannerId = @"bannerId",
	.bannerName = @"bannerName",
	.lastModifiedDate = @"lastModifiedDate",
	.remoteKey = @"remoteKey",
};

const struct BannerRelationships BannerRelationships = {
	.salesRep = @"salesRep",
	.stores = @"stores",
};

const struct BannerFetchedProperties BannerFetchedProperties = {
};

@implementation BannerID
@end

@implementation _Banner

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Banner" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Banner";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Banner" inManagedObjectContext:moc_];
}

- (BannerID*)objectID {
	return (BannerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic analytics;






@dynamic bannerId;






@dynamic bannerName;






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





@dynamic remoteKey;






@dynamic salesRep;

	

@dynamic stores;

	
- (NSMutableSet*)storesSet {
	[self willAccessValueForKey:@"stores"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stores"];
  
	[self didAccessValueForKey:@"stores"];
	return result;
}
	






@end
