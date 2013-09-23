//
//  TCSummaryViewController.h
//  Torch
//
//  Created by Yuan Mai on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

@interface TCSummaryViewController : UIViewController {
    Store *store;
}
@property(nonatomic, strong) Store *store;


@end
