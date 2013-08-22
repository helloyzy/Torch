//
//  TCLoginViewController.h
//  Torch
//
//  Created by Whitman Yang on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCBaseVwCtl.h"

@interface TCLoginViewController : TCBaseVwCtl {
    
    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UITextField *txtUsername;
    __weak IBOutlet UITextField *txtPwd;
   //  __weak IBOutlet UIButton *btnSignin;
    __weak IBOutlet UILabel *lblPwd;
    __weak IBOutlet UIImageView *bgImgView;
}

- (IBAction)displayDisclaimView:(id)sender;
- (IBAction)login:(id)sender;

@end
