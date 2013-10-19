//
//  TCAddNoteController.h
//  Torch
//
//  Created by Yuan Mai on 9/25/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoreCall, Contact, Store, Note;

@protocol TCAddNoteDelegate <NSObject>

- (void)noteAdded:(Note *)note;

@end

@interface TCAddNoteController : UIViewController<UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;
@property (nonatomic, weak) IBOutlet UILabel* titleSwitch;
@property (nonatomic, weak) IBOutlet UITextView* notes;
@property (nonatomic, weak) IBOutlet UISwitch* externalSwitch;
@property (nonatomic, weak) IBOutlet UIButton* button;
@property (nonatomic, strong) StoreCall* call;
@property (nonatomic ,strong) Store* store;
// @property (nonatomic, assign) BOOL addContactNoteFlag;
@property (nonatomic, weak) id<TCAddNoteDelegate> delegate;

- (IBAction) addNote: (id) sender;

@end
