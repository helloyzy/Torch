//
//  TCAddNewCustomerVwCtl.h
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCBaseVwCtl.h"

@interface TCAddNewCustomerVwCtl : TCBaseVwCtl <UITableViewDataSource, UITableViewDelegate> {
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UITableView *tblVw;
    
}

@end
