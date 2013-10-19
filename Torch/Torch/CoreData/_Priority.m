// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Priority.m instead.

#import "_Priority.h"

const struct PriorityAttributes PriorityAttributes = {
	.accountId = @"accountId",
	.desp = @"desp",
	.title = @"title",
};

const struct PriorityRelationships PriorityRelationships = {
};

const struct PriorityFetchedProperties PriorityFetchedProperties = {
};

@implementation PriorityID
@end

@implementation _Priority

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Priority" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Priority";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Priority" inManagedObjectContext:moc_];
}

- (PriorityID*)objectID {
	return (PriorityID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic accountId;






@dynamic desp;






@dynamic title;











@end
