//
//  TCViewController.h
//  Torch
//
//  Created by Yuan Mai on 8/19/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCSliderView.h"

@interface TCViewController : UIViewController <TCSliderViewDelegate> {
    
    __weak IBOutlet TCSliderView *sliderVw;
}
@end
