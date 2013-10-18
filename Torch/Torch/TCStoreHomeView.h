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
#import <CoreLocation/CoreLocation.h>

@class Store, StoreCall;

@interface TCStoreHomeView : TCNavVwCtl<TCSliderViewDelegate, CLLocationManagerDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) StoreCall *call;
@property (nonatomic,strong) NSString *currentIndex;

@end
