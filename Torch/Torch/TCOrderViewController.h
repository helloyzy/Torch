//
//  TCOrderViewController.h
//  Torch
//
//  Created by bo hu on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Utils.h"
#import "TCNavVwCtl.h"
#import "PromotionItem.h"
@class Store;

@interface TCOrderViewController : TCNavVwCtl <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

-(void)setSelectedPromotionItem:(PromotionItem *)promotionItem;
@property (nonatomic,strong) Store *currentStore;

@end
