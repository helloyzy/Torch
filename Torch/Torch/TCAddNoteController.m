//
//  TCAddNoteController.m
//  Torch
//
//  Created by Yuan Mai on 9/25/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCAddNoteController.h"
#import "GraphicsUtils.h"
#import "Note.h"
#import <UIKit/UIKit.h>

@interface TCAddNoteController ()

@end

@implementation TCAddNoteController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *sepertor = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 2)];
    sepertor.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    [self.view addSubview:sepertor];
    self.titleLabel.text = Lo(addnote.title);
    self.titleSwitch.text = Lo(addnote.switch);
    [self.button setTitle:Lo(addnote.button) forState:UIControlStateNormal];
    
    self.notes.layer.cornerRadius = 5;
    self.notes.clipsToBounds = YES;
    [self.notes.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [self.notes.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [self.notes.layer setBorderWidth: 1.0];
    [self.notes.layer setCornerRadius:8.0f];
    [self.notes.layer setMasksToBounds:YES];
    self.notes.delegate = self;
}

- (IBAction) addNote: (id) sender {
    Note* note = [Note newInstance];
    note.type = @"Nota Añadida";
    note.title = self.notes.text;
    [self.call addNotesObject:note];
    [self.call save];
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

@end
