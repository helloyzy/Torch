//
//  TCStoreHomeView.h
//  Torch
//
//  Created by xu cheng on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavVwCtl.h"


@interface TCStoreHomeView : TCNavVwCtl {
    
    __weak IBOutlet UILabel *lblStoredetail;
    __weak IBOutlet UILabel *lblStorename;
    NSArray *displayList;

}
// @property (weak, nonatomic) IBOutlet UILabel *lblStoreName;
// @property (weak, nonatomic) IBOutlet UILabel *lblStoreDetail;
@property (nonatomic, retain) NSArray *displayList;
@end
