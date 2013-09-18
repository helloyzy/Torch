//
//  TCDBUtils.h
//  Torch
//
//  Created by Yang Whitman on 13-9-15.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IBCoreDataStore;

@interface TCDBUtils : NSObject

+(void) initDB;
+(void) seed;
+(void) copySeed;
+(void) resetDB;

+(IBCoreDataStore *) ibDataStore;

@end
