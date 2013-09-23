//
//  TCDBUtils.m
//  Torch
//
//  Created by Yang Whitman on 13-9-15.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCDBUtils.h"
#import "IBCoreDataStore.h"

#import "SalesRep.h"
#import "Order.h"
#import <RestKit/RestKit.h>

#import "NSManagedObject+InnerBand.h"

#define TC_DB_NAME @"CoreDataStore.sqlite"
#define TC_DB_PATH [RKApplicationDataDirectory() stringByAppendingPathComponent:TC_DB_NAME]

#define TC_DB_IBSTORE [TCDBUtils ibDataStore]

static IBCoreDataStore * ibDataStore;

@implementation TCDBUtils

+(void) initDB {
//    BOOL hasDB = [[NSFileManager defaultManager] fileExistsAtPath: TC_DB_PATH];
//    if (hasDB) {
//        NSLog(@"Documents dir %@ has DB %@", RKApplicationDataDirectory(), TC_DB_NAME);
//    } else {
//        NSLog(@"Documents dir %@ missing DB %@!!", RKApplicationDataDirectory(), TC_DB_NAME);
//    }
    
    // if no DB at the given path, a new one will be generated automatically
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

    // init innerband coredata
    ibDataStore = [IBCoreDataStore createStoreWithContext:managedObjectStore.mainQueueManagedObjectContext];
}

+(void) removeDB {
    if ([[NSFileManager defaultManager] fileExistsAtPath:TC_DB_PATH]) {
        NSLog(@"Remove database at %@", TC_DB_PATH);
        [[NSFileManager defaultManager] removeItemAtPath:TC_DB_PATH error:nil];
    }
}

// remove and init
+(void) resetDB {
    [self removeDB];
    [self initDB];
}

#pragma mark - integration with InnerBand

+(IBCoreDataStore *) ibDataStore {
    return [IBCoreDataStore mainStore];
}

#pragma mark - seed

+(void) seed {
    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
    RKManagedObjectImporter *importer = [[RKManagedObjectImporter alloc] initWithManagedObjectModel:managedObjectStore.managedObjectModel storePath:TC_DB_PATH];
    
    NSError *error;
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    RKEntityMapping *dataMapping = [SalesRep objectMapping];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"login" ofType:@"json"]
                              withMapping:dataMapping
                                  keyPath:nil
                                    error:&error];
    RKEntityMapping *orderMapping = [Order objectMapping];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"order" ofType:@"json"]
                              withMapping:orderMapping
                                  keyPath:nil
                                    error:&error];
    
    BOOL success = [importer finishImporting:&error];
    if (success) {
        [importer logSeedingInfo];
    }
}

+(void) copySeed {
    [self removeDB];
    NSString * fromPath = [[NSBundle mainBundle] pathForResource:@"CoreDataStore" ofType:@"sqlite"];
    NSLog(@"Copy database from %@ to %@", fromPath, TC_DB_PATH);
    [[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:TC_DB_PATH error:nil];
}


@end
