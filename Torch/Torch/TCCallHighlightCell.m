//
//  TCCallHighlightCell.m
//  Torch
//
//  Created by Yuan Mai on 8/26/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCCallHighlightCell.h"

@implementation TCCallHighlightCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 10.0, 280.0, 21.0)];
        title.adjustsFontSizeToFitWidth = NO;
        title.alpha = 1.000;
        title.autoresizesSubviews = YES;
        title.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        title.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        title.clearsContextBeforeDrawing = YES;
        title.clipsToBounds = YES;
        title.contentMode = UIViewContentModeLeft;
        title.numberOfLines = 1;
        title.backgroundColor = [UIColor clearColor];
        title.opaque = NO;
        title.shadowOffset = CGSizeMake(0.0, -1.0);
        title.text = @"Store Name Here";
        title.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];
        
        UILabel *subtitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 30.0, 280.0, 33.0)];
        subtitle.backgroundColor = [UIColor clearColor];
        subtitle.adjustsFontSizeToFitWidth = NO;
        subtitle.autoresizesSubviews = YES;
        subtitle.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        subtitle.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        subtitle.clearsContextBeforeDrawing = YES;
        subtitle.clipsToBounds = YES;
        subtitle.contentMode = UIViewContentModeLeft;
        subtitle.numberOfLines = 1;
        subtitle.opaque = NO;
        subtitle.shadowOffset = CGSizeMake(0.0, -1.0);
        subtitle.text = @"Line1 abbb dddd eeee eeee eeee eeee eeee eee";
        subtitle.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16];
        subtitle.textColor = [UIColor colorWithWhite:0.667 alpha:1.000];    
        
        [self addSubview:title];
        [self addSubview:subtitle];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
