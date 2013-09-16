//
//  TCMyDayCell.h
//  Torch
//
//  Created by Yuan Mai on 8/26/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;

@interface TCMyDayCell : UITableViewCell

- (TCMyDayCell*) cellWithData: (Store*) store cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
