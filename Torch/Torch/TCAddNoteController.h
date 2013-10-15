//
//  TCAddNoteController.h
//  Torch
//
//  Created by Yuan Mai on 9/25/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoreCall, Contact;

@interface TCAddNoteController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet UILabel* titleSwitch;
@property (nonatomic, strong) IBOutlet UITextView* notes;
@property (nonatomic, strong) IBOutlet UISwitch* externalSwitch;
@property (nonatomic, strong) IBOutlet UIButton* button;
@property (nonatomic, strong) StoreCall* call;
// @property (nonatomic, assign) BOOL addContactNoteFlag;

- (IBAction) addNote: (id) sender;

@end
