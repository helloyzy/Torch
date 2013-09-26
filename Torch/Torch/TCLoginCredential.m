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
    if (! gSharedInstance) {
        gSharedInstance = [[TCLoginCredential alloc] init];
    }
    return gSharedInstance;
}

+ (void)setUsername:(NSString *)username password:(NSString *)password {
    TCLoginCredential * instance = [self sharedInstance];
    instance.username = username;
    instance.password = password;
}

@end
