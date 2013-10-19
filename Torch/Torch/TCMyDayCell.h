//
//  TCMyDayCell.h
//  Torch
//
//  Created by Yuan Mai on 8/26/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoreCall;

@interface TCMyDayCell : UITableViewCell

- (TCMyDayCell*) cellWithData: (StoreCall*) call cellForRowAtIndexPath:(NSInteger)index;

- (void)setTodayCallsStyle;
- (void)setCompletedCallsStyle;
- (void)setFutureCallsStyle;

@end
