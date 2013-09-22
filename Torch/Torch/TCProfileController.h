//
//  TCProfileController.h
//  SingleView
//
//  Created by Whitman Yang on 8/26/13.
//  Copyright (c) 2013 Whitman Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YIInnerShadowView;

@interface TCProfileController : UIViewController <UIGestureRecognizerDelegate> {
    
    __weak IBOutlet YIInnerShadowView *vwLeftShadow;
    __weak IBOutlet UIImageView *imgVwMyDay;
}

@end
