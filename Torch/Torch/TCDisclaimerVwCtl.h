//
//  TCDisclaimerVwCtl.h
//  Torch
//
//  Created by Whitman Yang on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCDisclaimerVwCtl : UIViewController {
    __weak IBOutlet UIBarButtonItem *btnDone;
    __weak IBOutlet UINavigationBar *navBar;
    __weak IBOutlet UITextView *txtVw;
}

- (IBAction)dismissView:(id)sender;

@end
