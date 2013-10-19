//
//  TCAddNewCustomerVwCtl.h
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCBaseVwCtl.h"
#import <CoreLocation/CoreLocation.h>
#import "TCAddNoteController.h"

@class Store, StoreCall;

@interface TCAddNewCustomerVwCtl : TCBaseVwCtl <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, CLLocationManagerDelegate, TCAddNoteDelegate> {
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UITableView *tblVw;
    
}

@property(nonatomic, strong)Store *store;
@property(nonatomic, strong)StoreCall *storeCall;

@end
