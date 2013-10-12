//
//  TCSurveyController.h
//  Torch
//
//  Created by Yuan Mai on 9/4/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"

@interface TCSurveyController : TCNavVwCtl<UIPickerViewDataSource, UIPickerViewDelegate>

@property (atomic, strong) NSArray* questions;
@property (atomic) NSInteger index;
@property (atomic, strong) NSString* subtitle;

@end
