//
//  TCStoreHomeView.h
//  Torch
//
//  Created by xu cheng on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"


@interface TCStoreHomeView : TCNavVwCtl 
@property (weak, nonatomic) IBOutlet UITextField *txtStoreName;
@property (weak, nonatomic) IBOutlet UITextField *txtStoreDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblStoreNumber;
@property (nonatomic, retain) NSArray *displayList;
@property (weak, nonatomic) IBOutlet UITableView *tvItemList;
@property(nonatomic, strong) IBOutlet UIView* shadow;
@end
