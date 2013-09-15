//
//  TCDBUtils.m
//  Torch
//
//  Created by Yang Whitman on 13-9-15.
//  Copyright (c) 2013年 Hershey. All rights reserved.
//

#import "TCDBUtils.h"
#import <RestKit/RestKit.h>

#import "SalesRep.h"

#define TC_DB_NAME @"CoreDataStore.sqlite"
#define TC_DB_PATH [RKApplicationDataDirectory() stringByAppendingPathComponent:TC_DB_NAME]

@implementation TCDBUtils

+(void) initDB {
    BOOL hasDB = [[NSFileManager defaultManager] fileExistsAtPath: TC_DB_PATH];
    if (hasDB) {
        NSLog(@"Documents dir %@ has DB %@", RKApplicationDataDirectory(), TC_DB_NAME);
    } else {
        NSLog(@"Documents dir %@ missing DB %@!!", RKApplicationDataDirectory(), TC_DB_NAME);
        return;
    }
    
    // NSArray * salesReps = [SalesRep all];
    // NSLog(@"Count of salesRep is %i", [salesReps count]);
    
    NSManagedObjectModel * managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore * managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    NSError * error = nil;    
    NSPersistentStore * persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:TC_DB_PATH fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    if (!persistentStore) {
        RKLogError(@"Failed adding persistent store at path '%@' : %@", TC_DB_PATH, error);
        return;
    }
    [managedObjectStore createManagedObjectContexts];

    // TODO init innerband coredata
}

+(void) seed {
    RKEntityMapping *objectMapping = [SalesRep objectMapping];
    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
    RKManagedObjectImporter *importer = [[RKManagedObjectImporter alloc] initWithManagedObjectModel:managedObjectStore.managedObjectModel storePath:TC_DB_PATH];
    
    // Import the files "articles.json" from the Main Bundle using our RKEntityMapping
    // JSON looks like {"articles": [ {"title": "Article 1", "body": "Text", "author": "Blake" ]}
    NSError *error;
    NSBundle *mainBundle = [NSBundle mainBundle];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"login" ofType:@"json"]
                              withMapping:objectMapping
                                  keyPath:nil
                                    error:&error];
    
    BOOL success = [importer finishImporting:&error];
    if (success) {
        [importer logSeedingInfo];
    }
}



@end
