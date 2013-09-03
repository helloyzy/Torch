//
//  InventoryTableCell.h
//  Torch
//
//  Created by bo hu on 8/22/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InventoryTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *vwDelete;
@property (nonatomic, weak) IBOutlet UILabel *productName;
@property (nonatomic, weak) IBOutlet UILabel *productSequenceNum;
@property (nonatomic, weak) IBOutlet UILabel *unitPrice;
@property (nonatomic, weak) IBOutlet UILabel *productDescription;

@property (nonatomic, weak) IBOutlet UILabel *productQuantity;
@property (nonatomic, weak) IBOutlet UILabel *productQuantityUnitLabel;

@property (nonatomic, weak) IBOutlet UIStepper *stepper;
@property (nonatomic, weak) IBOutlet UIButton *deleteButton;

@end
