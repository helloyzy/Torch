//
//  TCPromotionTableCell.h
//  Torch
//
//  Created by bo hu on 9/2/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCPromotionTableCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel *promotionTitle;
@property(nonatomic,weak) IBOutlet UILabel *promotionDetails;
@property(nonatomic,weak) IBOutlet UIButton *deleteButton;

@end
