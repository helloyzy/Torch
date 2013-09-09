//
//  TCEditingCell.m
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCEditingCell.h"
#import "DRTextField.h"

@interface TCEditingCell() {
    TCEditingCellStyle _editingStyle;
    DRTextField * centerField;
    DRTextField * leftField;
    DRTextField * rightField;
}

@end

@implementation TCEditingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithEditStyle:(TCEditingCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _editingStyle = style;
        [self initInternal];
    }
    return self;
}

- (void)initInternal {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (_editingStyle) {
        case TCEditingCellStyleCenter:
            centerField = [[DRTextField alloc] init];
            [self.contentView addSubview:centerField];
            break;
        case TCEditingCellStyleLeftRight:
            leftField = [[DRTextField alloc] init];
            rightField = [[DRTextField alloc] init];
            [self.contentView addSubview:leftField];
            [self.contentView addSubview:rightField];
        default:
            break;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat p_x = 15;
    CGFloat p_y = 11;
    CGFloat s_w = 270;
    CGFloat s_w_half = s_w / 2;
    CGFloat s_h = self.bounds.size.height - 2 * 10;
    switch (_editingStyle) {
        case TCEditingCellStyleCenter:
            centerField.frame = CGRectMake(p_x, p_y, s_w, s_h);
            break;
        case TCEditingCellStyleLeftRight:
            // CGFloat leftWidth;// , rightWidth;
            // leftw
            leftField.frame = CGRectMake(p_x, p_y, s_w_half, s_h);
            rightField.frame = CGRectMake(p_x + s_w_half + 5, p_y, s_w_half, s_h);
        default:
            break;
    }
}

- (DRTextField *) centerField {
    return centerField;
}

- (DRTextField *) leftField {
    return leftField;
}

- (DRTextField *) rightField {
    return rightField;
}

@end
