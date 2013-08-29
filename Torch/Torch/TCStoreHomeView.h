//
//  TCStoreHomeView.h
//  Torch
//
//  Created by xu cheng on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"
#import "TCSliderView.h"

@interface TCStoreHomeView : TCNavVwCtl<TCSliderViewDelegate> {
    
    //__weak IBOutlet TCSliderView *sliderVw;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
