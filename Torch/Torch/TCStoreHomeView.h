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

@class Store;

@interface TCStoreHomeView : TCNavVwCtl<TCSliderViewDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) Store *currentStore;
@property (nonatomic,strong) NSString *currentIndex;

@end
