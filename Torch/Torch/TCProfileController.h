//
//  TCProfileController.h
//  SingleView
//
//  Created by Whitman Yang on 8/26/13.
//  Copyright (c) 2013 Whitman Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YIInnerShadowView;

@interface TCProfileController : UIViewController <UIGestureRecognizerDelegate, UIAlertViewDelegate> {
    
    __weak IBOutlet YIInnerShadowView *vwLeftShadow;
    __weak IBOutlet UIImageView *imgVwMyDay;
    __weak IBOutlet UIImageView *imgVwDataStatus;
    __weak IBOutlet UIImageView *imgVwLogout;
    __weak IBOutlet UILabel *lblName;
    __weak IBOutlet UILabel *lblUserDetailed;
    __weak IBOutlet UILabel *lblMyDay;
    __weak IBOutlet UILabel *lblDataStatus;
    __weak IBOutlet UILabel *lblLogout;
}
- (IBAction)jumpToDataStatus:(id)sender;
- (IBAction)logoutAction:(id)sender;

@end
