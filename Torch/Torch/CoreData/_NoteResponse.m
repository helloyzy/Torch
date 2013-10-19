// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to NoteResponse.m instead.

#import "_NoteResponse.h"

const struct NoteResponseAttributes NoteResponseAttributes = {
	.message = @"message",
	.type = @"type",
};

const struct NoteResponseRelationships NoteResponseRelationships = {
	.orderCredit = @"orderCredit",
};

const struct NoteResponseFetchedProperties NoteResponseFetchedProperties = {
};

@implementation NoteResponseID
@end

@implementation _NoteResponse

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"NoteResponse" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"NoteResponse";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"NoteResponse" inManagedObjectContext:moc_];
}

- (NoteResponseID*)objectID {
	return (NoteResponseID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic message;






@dynamic type;






@dynamic orderCredit;

	






@end
