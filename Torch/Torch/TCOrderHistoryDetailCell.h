//
//  TCOrderHistoryDetailCell.h
//  Torch
//
//  Created by bo hu on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCOrderHistoryDetailCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *productName;
@property (nonatomic,weak) IBOutlet UILabel *productSN;
@property (nonatomic,weak) IBOutlet UILabel *productUnitPrice;
@property (nonatomic,weak) IBOutlet UILabel *productDescription;
@property (nonatomic,weak) IBOutlet UILabel *productTotalAmount;

@end
