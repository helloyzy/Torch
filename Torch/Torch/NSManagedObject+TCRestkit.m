//
//  NSManagedObject+TCRestkit.m
//  Torch
//
//  Created by Whitman Yang on 9/17/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "NSManagedObject+TCRestkit.h"
#import <RestKit/RestKit.h>
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"

@implementation NSManagedObject (TCRestkit)

+ (RKEntityMapping *)objectMapping {
    return [RKEntityMapping mappingForEntityForName:NSStringFromClass([self class]) inManagedObjectStore:[RKManagedObjectStore defaultStore]];
}

- (void)save {
    [NSManagedObject save];
}

- (void)deleteObj {
    [[TCDBUtils ibDataStore] removeEntity:self];
    [NSManagedObject save];
}

+ (id)newInstance {
    return [self createInStore:[self dataStore]];
}


+ (void)save {
    [[self dataStore] save];
}

+ (IBCoreDataStore *)dataStore {
    return [TCDBUtils ibDataStore];
}

+ (NSString *)generateUDID {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [dateformat stringFromDate:date];
    
    int randomNumber = (arc4random()%(99999-1))+1;
    return [NSString stringWithFormat:@"%@%d",dateString,randomNumber];
}

@end
