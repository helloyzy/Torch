// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.m instead.

#import "_Account.h"

const struct AccountAttributes AccountAttributes = {
	.accountRecordType = @"accountRecordType",
	.address = @"address",
	.city = @"city",
	.coachId = @"coachId",
	.currency = @"currency",
	.fax = @"fax",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.name = @"name",
	.phone = @"phone",
	.postalcode = @"postalcode",
	.recordType = @"recordType",
	.remoteKey = @"remoteKey",
	.repId = @"repId",
	.state = @"state",
	.street = @"street",
	.streetref1 = @"streetref1",
	.streetref2 = @"streetref2",
};

const struct AccountRelationships AccountRelationships = {
	.orderCredit = @"orderCredit",
};

const struct AccountFetchedProperties AccountFetchedProperties = {
};

@implementation AccountID
@end

@implementation _Account

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Account";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Account" inManagedObjectContext:moc_];
}

- (AccountID*)objectID {
	return (AccountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic accountRecordType;






@dynamic address;






@dynamic city;






@dynamic coachId;






@dynamic currency;






@dynamic fax;






@dynamic latitude;






@dynamic longitude;






@dynamic name;






@dynamic phone;






@dynamic postalcode;






@dynamic recordType;






@dynamic remoteKey;






@dynamic repId;






@dynamic state;






@dynamic street;






@dynamic streetref1;






@dynamic streetref2;






@dynamic orderCredit;

	






@end
