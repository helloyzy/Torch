//
//  TCPromotionVwCtl.h
//  Torch
//
//  Created by Whitman Yang on 8/30/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"

@interface TCPromotionVwCtl : TCNavVwCtl <UITableViewDataSource, UITableViewDelegate> {
    
    __weak IBOutlet UIView *vwTop;
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UITableView *tblVw;
}

@end
