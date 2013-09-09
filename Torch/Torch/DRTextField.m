//
//  DRTextField.m
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "DRTextField.h"
#import "NSObject+Association.h"

@implementation DRTextField

#define DRTextField_PropObserved @"text"

- (void) dealloc {
    [self removeObserver:self forKeyPath:DRTextField_PropObserved];
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // observe self's text property
        [self addObserver:self forKeyPath:DRTextField_PropObserved options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:DRTextField_PropObserved]) { // text change, save change to the dataObject
        if (self.dataObject && self.dataProperty) {
            [self.dataObject setValue:[change objectForKey:NSKeyValueChangeNewKey] forKey:self.dataProperty];
            [self.dataObject setModified];
        }
    }
}

+ (DRTextField *) instance:(CGRect)frame data:(NSObject *)object prop:(NSString *)prop {
    DRTextField * result = [[DRTextField alloc] initWithFrame:frame];
    result.dataObject = object;
    result.dataProperty = prop;
    return result;
}
@end
