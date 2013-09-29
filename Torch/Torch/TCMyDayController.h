//
//  TCMyDayController.h
//  Torch
//
//  Created by Yuan Mai on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MYDAY_WILLAPPEAR_NOTIFICATION @"MYDAY_WILLAPPEAR_NOTIFICATION"
#define MYDAY_WILLDISAPPEAR_NOTIFICATION @"MYDAY_WILLDISAPPEAR_NOTIFICATION"

@interface TCMyDayController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView* tableView;
@property(nonatomic, strong) IBOutlet UILabel * header;

@property(nonatomic, strong) IBOutlet UIView* shadow;
@end
