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
    return nil;
}

+ (id)newInstance {
    return [self createInStore:[TCDBUtils ibDataStore]];
}

+ (void)save {
    [[TCDBUtils ibDataStore] save];
}

- (void)deleteObj {
    [[TCDBUtils ibDataStore] removeEntity:self];
    [NSManagedObject save];
}

@end
