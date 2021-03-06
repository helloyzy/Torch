//
//  TCMyDayCell.m
//  Torch
//
//  Created by Yuan Mai on 8/26/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCMyDayCell.h"
#import "Store.h"
#import "StoreCall.h"
#import <QuartzCore/QuartzCore.h>
#import "TCSysRes.h"

@implementation TCMyDayCell {
    UILabel *storeLabel;
    UILabel *addressLabel;
    UILabel *numberLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        storeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 10.0, 280.0, 21.0)];
        storeLabel.adjustsFontSizeToFitWidth = NO;
        storeLabel.alpha = 1.000;
        storeLabel.autoresizesSubviews = YES;
        storeLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        storeLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        storeLabel.clearsContextBeforeDrawing = YES;
        storeLabel.clipsToBounds = YES;
        storeLabel.contentMode = UIViewContentModeLeft;
        storeLabel.numberOfLines = 1;
        storeLabel.backgroundColor = [UIColor clearColor];
        storeLabel.opaque = NO;
        storeLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        storeLabel.text = @"Store Name Here";
        storeLabel.font = TCFont_HNLTComBd(15);
        storeLabel.adjustsFontSizeToFitWidth = YES;
        storeLabel.adjustsLetterSpacingToFitWidth = YES;
        storeLabel.minimumScaleFactor = 0.6;
        
        addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 30.0, 209.0, 63.0)];
        addressLabel.backgroundColor = [UIColor clearColor];
        addressLabel.adjustsFontSizeToFitWidth = NO;
        addressLabel.autoresizesSubviews = YES;
        addressLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        addressLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        addressLabel.clearsContextBeforeDrawing = YES;
        addressLabel.clipsToBounds = YES;
        addressLabel.contentMode = UIViewContentModeLeft;
        addressLabel.numberOfLines = 3;
        addressLabel.opaque = NO;
        addressLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        addressLabel.text = @"Line1\nLine2\nLine3";
        addressLabel.font = TCFont_HNLTComMd(14);
        addressLabel.adjustsFontSizeToFitWidth = YES;
        addressLabel.adjustsLetterSpacingToFitWidth = YES;
        addressLabel.minimumScaleFactor = 0.6;
        addressLabel.textColor = [UIColor colorWithWhite:0.667 alpha:1.000];
        
        numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(237.0, 30.0, 40.0, 33.0)];
        numberLabel.adjustsFontSizeToFitWidth = NO;
        numberLabel.backgroundColor = [UIColor colorWithRed:0.231 green:0.431 blue:0.627 alpha:1.000];
        numberLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        numberLabel.clearsContextBeforeDrawing = YES;
        numberLabel.clipsToBounds = YES;
        numberLabel.contentMode = UIViewContentModeCenter;
        numberLabel.numberOfLines = 1;
        numberLabel.opaque = NO;
        numberLabel.textAlignment = NSTextAlignmentCenter;
        numberLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        numberLabel.textColor = [UIColor whiteColor];
        numberLabel.text = @"#1";
        numberLabel.layer.cornerRadius = 3;
        
        [self addSubview:storeLabel];
        [self addSubview:addressLabel];
        [self addSubview:numberLabel];
    }
    return self;
}

- (TCMyDayCell*) cellWithData: (StoreCall*) call cellForRowAtIndexPath:(NSInteger)index {
    Store* store = call.store;
    storeLabel.text = store.name;
    addressLabel.text = [NSString stringWithFormat:@"%@\n%@ , %@ %@", store.address, store.city, store.country, store.postalCode];
    [numberLabel setHidden:(index < 0)];
    numberLabel.text = [NSString stringWithFormat:@"#%@", [NSNumber numberWithInteger:index+1]];
    return self;
}

- (void)setTodayCallsStyle {
    self.userInteractionEnabled = YES;
    storeLabel.textColor = [UIColor blackColor];
    numberLabel.hidden = NO;
    numberLabel.backgroundColor = [UIColor colorWithRed:0.231 green:0.431 blue:0.627 alpha:1.000];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setDisabledStyle {
    self.userInteractionEnabled = NO;
    storeLabel.textColor = [UIColor colorWithWhite:0.667 alpha:1.000];
    numberLabel.backgroundColor = [UIColor grayColor];
}

- (void)setCompletedCallsStyle {
    [self setDisabledStyle];
    numberLabel.hidden = NO;
    self.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)setFutureCallsStyle {
    [self setDisabledStyle];
    numberLabel.hidden = YES;
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
