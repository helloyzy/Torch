//
//  TCSurveyListController.h
//  Torch
//
//  Created by Yuan Mai on 10/12/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCViewController.h"
#import "TCNavVwCtl.h"
#import "Store.h"

@interface TCSurveyListController : TCNavVwCtl

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Store* store;

@end
