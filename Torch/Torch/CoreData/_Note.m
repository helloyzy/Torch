// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Note.m instead.

#import "_Note.h"

const struct NoteAttributes NoteAttributes = {
	.body = @"body",
	.createdDate = @"createdDate",
	.externalDate = @"externalDate",
	.lastModifiedDate = @"lastModifiedDate",
	.remoteKey = @"remoteKey",
	.title = @"title",
	.type = @"type",
};

const struct NoteRelationships NoteRelationships = {
	.contact = @"contact",
	.storeCall = @"storeCall",
};

const struct NoteFetchedProperties NoteFetchedProperties = {
};

@implementation NoteID
@end

@implementation _Note

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (NoteID*)objectID {
	return (NoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"createdDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"createdDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"externalDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"externalDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lastModifiedDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastModifiedDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic body;






@dynamic createdDate;



- (double)createdDateValue {
	NSNumber *result = [self createdDate];
	return [result doubleValue];
}

- (void)setCreatedDateValue:(double)value_ {
	[self setCreatedDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveCreatedDateValue {
	NSNumber *result = [self primitiveCreatedDate];
	return [result doubleValue];
}

- (void)setPrimitiveCreatedDateValue:(double)value_ {
	[self setPrimitiveCreatedDate:[NSNumber numberWithDouble:value_]];
}





@dynamic externalDate;



- (double)externalDateValue {
	NSNumber *result = [self externalDate];
	return [result doubleValue];
}

- (void)setExternalDateValue:(double)value_ {
	[self setExternalDate:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveExternalDateValue {
	NSNumber *result = [self primitiveExternalDate];
	return [result doubleValue];
}

- (void)setPrimitiveExternalDateValue:(double)value_ {
	[self setPrimitiveExternalDate:[NSNumber numberWithDouble:value_]];
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





@dynamic remoteKey;






@dynamic title;






@dynamic type;






@dynamic contact;

	

@dynamic storeCall;

	






@end
