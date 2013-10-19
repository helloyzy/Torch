//
//  TCStoreNoVisit.h
//  Torch
//
//  Created by bo hu on 9/16/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"

@class StoreCall;

@interface TCStoreNoVisit : TCNavVwCtl <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong)StoreCall * storeCall;

@end
