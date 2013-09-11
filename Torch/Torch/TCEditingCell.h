//
//  TCEditingCell.h
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TCEditingCellStyleCenter,
    TCEditingCellStyleLeftRight,
    TCEditingCellStyleLeftFieldRightBtn,
    TCEditingCellStyleCombo
} TCEditingCellStyle;

@class DRTextField;
@class TCComboVw;

@interface TCEditingCell : UITableViewCell

- (id)initWithEditStyle:(TCEditingCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (id)initWithComboStyle:(NSArray *)dataSource reuseIdentifier:(NSString *)reuseIdentifier;

@property(nonatomic, readonly) DRTextField * centerField;
@property(nonatomic, readonly) DRTextField * leftField;
@property(nonatomic, readonly) DRTextField * rightField;
@property(nonatomic, readonly) UIButton * rightBtn;
@property(nonatomic, readonly) TCComboVw * comboVw;

@end
