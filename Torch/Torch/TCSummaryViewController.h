//
//  TCSummaryViewController.h
//  Torch
//
//  Created by Yuan Mai on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
#import "StoreCall.h"
#import "OrderCredit.h"

@class TCCallSummary;

@interface TCSummaryViewController : UIViewController {
}
@property (nonatomic, strong) Store *store;
@property (nonatomic, strong) StoreCall *storeCall;

@end
