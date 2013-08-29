//
//  TCOrderStatusCell.h
//  Torch
//
//  Created by xu cheng on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCOrderStatusCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblOrderNum;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderFee;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderDate;

@property (weak, nonatomic) IBOutlet UILabel *lblOrderStatusTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderStatus1;
@property (weak, nonatomic) IBOutlet UILabel *lblOrderStatus2;

@end
