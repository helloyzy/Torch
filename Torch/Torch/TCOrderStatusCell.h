//
//  TCOrderStatusCell.h
//  Torch
//
//  Created by xu cheng on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCOrderStatusCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderID;
@property (weak, nonatomic) IBOutlet UILabel *orderAmount;
@property (weak, nonatomic) IBOutlet UILabel *orderDate;

@property (weak, nonatomic) IBOutlet UILabel *orderStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderStatus;

@end
