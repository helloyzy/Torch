//
//  TCSurveyController.m
//  Torch
//
//  Created by Yuan Mai on 9/4/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSurveyController.h"
#import "DDProgressView.h"
#import "GraphicsUtils.h"
#import <MGTableBox.h>
#import "Survey.h"
#import <OCTotallyLazy.h>
#import "UIViewController+MGBox.h"
#import <MGScrollView.h>
#import <UIView+MGEasyFrame.h>
#import <UIKit/UITextField.h>

@interface TCSurveyController ()

@property (atomic) CGRect pickerHeight;
//@property (atomic) BOOL pickerSingle;
@property (nonatomic, retain) NSMutableSet* selected;
@property (nonatomic, retain) MGScrollView* table;
@end

@implementation TCSurveyController

//@synthesize surveyOptions;
@synthesize table;

UIFont* pickerFont;
CGSize pickerConstraint = (CGSize){265, FLT_MAX};
Survey* _survey;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) choiceSurvey {
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:(CGRect) {0, 0, 320, 100}];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self;
    [self.table.boxes addObject:mgline(picker)];
}

- (void) textSurvey {
    UITextField *textField = [[UITextField alloc] initWithFrame:(CGRect) {0, 0, 300, 30}];
    textField.placeholder = @"Answer";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.returnKeyType = UIReturnKeyNext;
    textField.delegate = self;
    [table.boxes addObject:padding(mgline(textField))];
}

- (void) numericSurvey {
    [self textSurvey];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _survey = self.questions[self.index];
    
    pickerFont = [UIFont boldSystemFontOfSize:24.0];
    self.selected = [[NSMutableSet alloc] init];
    //self.pickerSingle = YES;
    //self.surveyOptions = _survey.answerArray;//  @[@"A little late", @"B", @"C"];
    CGFloat height = [[[_survey.answerArray map:^(NSString* str) {
        return [NSNumber numberWithFloat:
                [str sizeWithFont:pickerFont
                constrainedToSize:pickerConstraint].height];
    }] reduce:^(NSNumber* x, NSNumber* y) {
        return [x compare:y] == NSOrderedDescending ? x : y;
    }] floatValue];
    self.pickerHeight = (CGRect) {0, 0, 265, height};

//    MGTableBox *table = [MGTableBox boxWithSize:self.view.size];
    table = [MGScrollView scrollerWithSize:self.view.size];
    table.height = 420;
    
    [table.boxes addObject:[self sectionHeader:self.subtitle backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] fontName:@"HelveticaNeueLTCom-Md"]];

    DDProgressView *progressBar = [[DDProgressView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, self.view.bounds.size.width - 30.0f, 100.0f)];
    progressBar.outerColor = [UIColor clearColor];
    progressBar.emptyColor = TCColorProgressLtBlue;
    progressBar.progress = (self.index+1.0) / (self.questions.count + 0.000001);
    progressBar.innerColor = TCColorProgressBlue;

    UILabel *progressText = [[UILabel alloc] initWithFrame:(CGRect) {0, 5, progressBar.bounds.size.width, progressBar.bounds.size.height-5}];
    progressText.adjustsFontSizeToFitWidth = NO;
    progressText.textAlignment = NSTextAlignmentLeft;
    progressText.numberOfLines = 1;
    progressText.textColor = [UIColor whiteColor];
    progressText.backgroundColor = [UIColor clearColor];
    progressText.text = [NSString stringWithFormat:@"   Pregunta %d de %d", self.index+1, self.questions.count];
    progressText.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
    [progressBar addSubview:progressText];

    [table.boxes addObject:padding(mgline(progressBar))];
    
    [table.boxes addObject:[self sectionHeader:_survey.question backgroundColor:[UIColor clearColor] underlineColor:[UIColor clearColor] fontName:@"HelveticaNeueLTCom-Md"]];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRect) {0, 0, 300, 60}];
    textView.editable = YES;
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
    [textView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [textView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [textView.layer setBorderWidth: 1.0];
    [textView.layer setCornerRadius:8.0f];
    [textView.layer setMasksToBounds:YES];
    
    [self performSelector:[_survey selector]];

    //[table.boxes addObject:padding(mgline(textView))];
    
    UIButton *button = blueButton(@"Next");
    [table.boxes addObject:padding(padding(mgline(button)))];
    [button addTarget:self action:@selector(moveToNext) forControlEvents:UIControlEventTouchUpInside];
    [table layout];
    [self.view addSubview:table];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    assert(_survey.answerArray != NULL);
    return [_survey.answerArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _survey.answerArray[row];
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 300;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return self.pickerHeight.size.height;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self moveToNext];
    return YES;
}

- (void) moveToNext {
    if (self.index+1 < self.questions.count) {
        TCSurveyController *next = [[TCSurveyController alloc] init];
        next.questions = self.questions;
        next.index = self.index+1;
        [self.navigationController pushViewController:next animated:YES];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString* obj = _survey.answerArray[row];
    if ([self.selected containsObject:obj]) {
        [self.selected removeObject:obj];
        [pickerView reloadAllComponents];
        return;
    }
   /* if (self.pickerSingle) {
        [self.selected removeAllObjects];
    } */
    [self.selected addObject:obj];
    [pickerView reloadAllComponents];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    NSString* str = _survey.answerArray[row];
   // if (!self.pickerSingle && [self.selected containsObject:str]) {
   //     str = [str stringByAppendingString:@" ✔"];
   // }
    UILabel *pickerLabel = [[UILabel alloc] initWithFrame:self.pickerHeight];
    [pickerLabel setBackgroundColor:[UIColor clearColor]];
    [pickerLabel setFont:[UIFont boldSystemFontOfSize:24.0]];
    [pickerLabel setNumberOfLines:0];
    [pickerLabel setText:str];
    return pickerLabel;
}

@end
