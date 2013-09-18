//
//  TCLoginCredential.m
//  Torch
//
//  Created by Whitman Yang on 9/18/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCLoginCredential.h"

static TCLoginCredential *gSharedInstance;

@implementation TCLoginCredential

+ (TCLoginCredential *)sharedInstance {
    return gSharedInstance;
}

+ (void)setUsername:(NSString *)username password:(NSString *)password {
    if (! gSharedInstance) {
        gSharedInstance = [TCLoginCredential new];
    }
    gSharedInstance.username = username;
    gSharedInstance.password = password;
}

@end
