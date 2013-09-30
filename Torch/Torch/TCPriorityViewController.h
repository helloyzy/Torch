//
//  TCPriorityViewController.h
//  Torch
//
//  Created by bo hu on 8/19/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Utils.h"
#import "TCNavVwCtl.h"

@class Store;
@interface TCPriorityViewController : TCNavVwCtl <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic,strong) Store *currentStore;
@end
