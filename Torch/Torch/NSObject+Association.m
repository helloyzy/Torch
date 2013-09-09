//
//  NSObject+Association.m
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "NSObject+Association.h"
#import <objc/runtime.h>

@implementation NSObject (Association)

// only need a const pointer, not caring about its value
static const char * KEY_MODIFY;

- (BOOL)isModified {
    return (objc_getAssociatedObject(self, KEY_MODIFY) != nil);
}

- (void)setModified {
    NSNumber * value = [NSNumber numberWithInt:1];
    objc_setAssociatedObject(self, KEY_MODIFY, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
