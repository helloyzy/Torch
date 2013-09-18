//
//  TCLoginCredential.h
//  Torch
//
//  Created by Whitman Yang on 9/18/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCLoginCredential : NSObject

@property(nonatomic, copy)NSString *username;
@property(nonatomic, copy)NSString *password;

+ (TCLoginCredential *)sharedInstance;
+ (void)setUsername:(NSString *)username password:(NSString *)password;

@end
