//
//  DRTextField.m
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "DRTextField.h"
#import "NSObject+Association.h"

@interface DRTextField () {
    BOOL _hasObserversForText;
}

@end

@implementation DRTextField

#define DRTextField_PropObserved @"text"

- (void) dealloc {
    if (_hasObserversForText) {
        [self removeObserver:self forKeyPath:DRTextField_PropObserved];
    }
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // observe self's text property
        _hasObserversForText = NO;
    }
    return self;
}

-(void) setDataObject:(NSObject *)dataObject {
    _dataObject = dataObject;
    [self bindIfNecessary];
}

-(void) setDataProperty:(NSString *)dataProperty {
    _dataProperty = [dataProperty copy];
    [self bindIfNecessary];
}

-(void) reset {
    if (_hasObserversForText) {
        [self removeObserver:self forKeyPath:DRTextField_PropObserved];
        _hasObserversForText = NO;
    }
    self.text = nil;
    _dataProperty = nil;
    _dataObject = nil;
}

-(void) bindIfNecessary {
    if (_dataObject && _dataProperty) {
        if (_hasObserversForText) {
            [self removeObserver:self forKeyPath:DRTextField_PropObserved];
            _hasObserversForText = NO;
        }
        NSObject *value = [_dataObject valueForKey:_dataProperty];
        if (value) {
            NSString *strVal = [NSString stringWithFormat:@"%@", value];
            self.text = strVal;
        }
        [self addObserver:self forKeyPath:DRTextField_PropObserved options:NSKeyValueObservingOptionNew context:NULL];
        _hasObserversForText = YES;
    }
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
