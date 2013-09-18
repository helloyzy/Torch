//
//  TCLoginViewController.h
//  Torch
//
//  Created by Whitman Yang on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCBaseVwCtl.h"

@class YIInnerShadowView;
@interface TCLoginViewController : TCBaseVwCtl {
    
    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UITextField *txtUsername;
    __weak IBOutlet UITextField *txtPwd;
   //  __weak IBOutlet UIButton *btnSignin;
    __weak IBOutlet UILabel *lblPwd;
    __weak IBOutlet UILabel *lblDisclaim;
    __weak IBOutlet UIImageView *bgImgView;
    __weak IBOutlet UIButton *btnReadMore;
    __weak IBOutlet UIButton *btnSignIn;
    __weak IBOutlet YIInnerShadowView *bgVwUsername;
    __weak IBOutlet YIInnerShadowView *bgVwPwd;
}

- (IBAction)displayDisclaimView:(id)sender;
- (IBAction)signIn:(id)sender;

@end
