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

@class Store;

@interface TCAddNewCustomerVwCtl : TCBaseVwCtl <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, CLLocationManagerDelegate> {
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UITableView *tblVw;
    
}

@property(nonatomic, strong)Store *store;

@end
