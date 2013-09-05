//
//  TCOrderHistory.h
//  Torch
//
//  Created by xu cheng on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"

@interface TCOrderHistory : TCNavVwCtl <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblStoreName;
@property (weak, nonatomic) IBOutlet UILabel *lblHistory;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
