//
//  TCInventoryViewController.h
//  Torch
//
//  Created by bo hu on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Utils.h"
#import "TCNavVwCtl.h"

@class Store;

@interface TCInventoryViewController : TCNavVwCtl <UITableViewDelegate , UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic, strong)Store *currentStore;

@end
