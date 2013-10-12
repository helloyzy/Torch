//
//  TCDBUtils.m
//  Torch
//
//  Created by Yang Whitman on 13-9-15.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCDBUtils.h"
#import "TCUtils.h"
#import "IBCoreDataStore.h"

#import "SalesRep.h"
#import "Order.h"
#import "Product.h"
#import "Priority.h"
#import "Promotion.h"
#import "Survey.h"
#import "Store.h"
#import "Priority.h"
#import "Promotion.h"
#import "PromotionItem.h"
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
    RKEntityMapping *productMapping = [Product objectMapping];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"product" ofType:@"json"]
                              withMapping:productMapping
                                  keyPath:nil
                                    error:&error];
//    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"productNew" ofType:@"json"]
//                              withMapping:productMapping
//                                  keyPath:nil
//                                    error:&error];
    
    RKEntityMapping *priorityMapping = [Priority objectMapping];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"fetchmexico" ofType:@"json"]
                              withMapping:priorityMapping
                                  keyPath:@"priorities"
                                    error:&error];
    RKEntityMapping *promotionMapping = [Promotion objectMapping];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"fetchmexico" ofType:@"json"]
                              withMapping:promotionMapping
                                  keyPath:@"promotions"
                                    error:&error];
    RKEntityMapping *surveyMapping = [Survey objectMapping];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"fetchmexico" ofType:@"json"]
                              withMapping:surveyMapping
                                  keyPath:@"survey"
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

+(void) prepareMockData {
    [self adjustStoreSchedule];
    [self prepareSurveyData];
    [self preparePriority];
    [self preparePromotion];
}

+(void) adjustStoreSchedule {
    NSArray *stores = [Store sortedStores];
    NSNumber *temp = curdateToMilliseconds();
    double tempValue = [temp doubleValue];
    for (Store *store in stores) {
        store.schedule = [NSNumber numberWithDouble:tempValue];
        tempValue += 1;
    }
    [Store save];
}

+(void) prepareSurveyData {
    // only prepare data for the first scheduled store
    NSArray *stores = [Store sortedStores];
    Store *firstStore = [stores objectAtIndex:0];
    NSString *accountId = [firstStore remoteKey];
    [Survey generateMockSurveys:accountId];
    
}

+(void) preparePriority {
    NSArray *stores = [Store sortedStores];
    for(Store *store in stores) {
        [Priority generateMockData:store.remoteKey];
    }
}

+(void) preparePromotion {
    NSArray *stores = [Store sortedStores];
    for(Store *store in stores) {
        [Promotion generateMockData:store.remoteKey];
    }
}


@end
