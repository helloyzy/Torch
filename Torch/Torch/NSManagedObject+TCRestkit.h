//
//  NSManagedObject+TCRestkit.h
//  Torch
//
//  Created by Whitman Yang on 9/17/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <CoreData/CoreData.h>

@class RKEntityMapping, IBCoreDataStore;

@interface NSManagedObject (TCRestkit)

+ (RKEntityMapping *)objectMapping;
+ (id)newInstance;
+ (void)save;
+ (IBCoreDataStore *)dataStore;
- (void)deleteObj;

@end
