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
#import "TCSysRes.h"
#import "TCStoreHomeView.h"
#import "Store.h"
#import "TCUtils.h"
#import <IBFunctions.h>
#import "SurveyResponse.h"

@interface TCSurveyController () {
    __weak UITextView *_textField;
    __weak UIPickerView *_picker;
}

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.index == 0) {
        self.questionAnswers = [[NSMutableDictionary alloc]init];
    }
    
    _survey = self.questions[self.index];
    self.selected = [[NSMutableSet alloc] init];
    
    table = [MGScrollView scrollerWithSize:self.view.size];
    // table.height = 420;
    
    [table.boxes addObject:[self sectionHeader:self.subtitle backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] font:TCFont_HNLTComMd(17)]];

    DDProgressView *progressBar = [[DDProgressView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, self.view.bounds.size.width - 30.0f, 100.0f)];
    progressBar.outerColor = [UIColor clearColor];
    progressBar.emptyColor = TCColorProgressLtBlue;
    progressBar.progress = (self.index+1.0) / (self.questions.count + 0.000001);
    progressBar.innerColor = TCColorProgressBlue;

    UILabel *progressText = [[UILabel alloc] initWithFrame:(CGRect) {0, 3, progressBar.bounds.size.width, progressBar.bounds.size.height - 6}];
    progressText.adjustsFontSizeToFitWidth = NO;
    progressText.textAlignment = NSTextAlignmentLeft;
    progressText.numberOfLines = 1;
    progressText.textColor = [UIColor whiteColor];
    progressText.backgroundColor = [UIColor clearColor];
    progressText.text = [NSString stringWithFormat:[self localString:@"survey.progressinfo"], self.index+1, self.questions.count];
    progressText.font = TCFont_HNLTComBd(15);
    [progressBar addSubview:progressText];

    [table.boxes addObject:padding(mgline(progressBar))];
    
    // [table.boxes addObject:[self sectionHeader:_survey.question backgroundColor:[UIColor clearColor] underlineColor:[UIColor clearColor] font:TCFont_HNLTComMd(17)]];
    [self addQuestionSection];
    
    switch ([_survey surveyQuestionType]) {
        case NumericQuestion:
        case TextQuestion:
            [self textSurvey];
            break;
        case ChoiceQuestion:
            [self choiceSurvey];
            break;
        default:
            break;
    }
    
    //[table.boxes addObject:padding(mgline(textView))];
    
    NSString *buttonText = [self localString:@"Next"];
    if ([self isLastQuestion]) {
        buttonText = [self localString:@"survey.completeSurvey"];
    }
    UIButton *button = blueButton(buttonText);
    [table.boxes addObject:padding(padding(mgline(button)))];
    [button addTarget:self action:@selector(moveToNext) forControlEvents:UIControlEventTouchUpInside];
    [table layout];
    [self.view addSubview:table];
}

- (void) moveToNext {
    if (! [self collectAnswer]) {
        showAlert(nil, [self localString:@"survey.provideAnswer"], nil);
        return;
    }
    if (! [self isLastQuestion]) {
        TCSurveyController *next = [[TCSurveyController alloc] init];
        next.index = self.index + 1;
        next.storeHomeView = self.storeHomeView;
        next.store = self.store;
        next.questions = self.questions;
        next.questionAnswers = self.questionAnswers;
        next.subtitle = self.subtitle;
        [self.navigationController pushViewController:next animated:YES];
    } else {
        // save questions - TODO
        int i = 0;
        for (Survey *survey in self.questions) {
            NSString *surveyAnswer = [self.questionAnswers objectForKey:IB_STRINGIFY_INT(i++)];
            SurveyResponse *response = [SurveyResponse newInstance];
            response.questionId = survey.questionId;
            response.accountId = survey.accountId;
            response.accountName = self.store.name;
            if ([survey surveyQuestionType] == ChoiceQuestion) {
                response.pickAnswer = surveyAnswer;
            } else {
                response.textAnswer = surveyAnswer;
            }
            [response save];
        }
        [self.navigationController popToViewController:self.storeHomeView animated:YES];
    }
}

- (BOOL)collectAnswer {
    NSString *answer = nil;
    switch ([_survey surveyQuestionType]) {
        case NumericQuestion:
        case TextQuestion:
            [_textField resignFirstResponder];
            answer = _textField.text;
            break;
        case ChoiceQuestion:
            answer = _survey.answerArray[[_picker selectedRowInComponent:0]];
            break;
        default:
            break;
    }
    if (answer && answer.length > 0) {
        [self.questionAnswers setObject:answer forKey:IB_STRINGIFY_INT(self.index)];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isLastQuestion {
    return self.index + 1 >= self.questions.count;
}

#pragma mark - UI stuff

- (void)addQuestionSection {
    CGSize size = (CGSize) {280, 50};
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    label.text = _survey.question;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = TCColorLineBlue;
    label.font = TCFont_HNLTComMd(15);
    label.adjustsLetterSpacingToFitWidth = YES;
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.6;
    
    MGLine *line = [MGLine lineWithLeft:label right:nil size:(CGSize){320, 35}];
    line.topPadding = line.leftPadding = 16;
    
    [table.boxes addObject:line];
}

- (void) choiceSurvey {
    pickerFont = TCFont_HNLTComBd(28);
    CGFloat height = [[[_survey.answerArray map:^(NSString* str) {
        return [NSNumber numberWithFloat:
                [str sizeWithFont:pickerFont
                constrainedToSize:pickerConstraint].height];
    }] reduce:^(NSNumber* x, NSNumber* y) {
        return [x compare:y] == NSOrderedDescending ? x : y;
    }] floatValue];
    self.pickerHeight = (CGRect) {0, 0, 265, height};

    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:(CGRect) {0, 0, 320, 100}];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self;
    MGLine *line = [MGLine lineWithLeft:picker right:nil size:picker.size];
    // line.topMargin = 150;
    [self.table.boxes addObject:line];
    _picker = picker;
}

- (void) textSurvey {
//    UITextField *textField = [[UITextField alloc] initWithFrame:(CGRect) {0, 0, 300, 30}];
//    textField.placeholder = [self localString:@"survey.textquestion.placeholder"];
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.returnKeyType = UIReturnKeyDone;
//    textField.delegate = self;
//    textField.font = TCFont_HNLTComMd(17);
//    [table.boxes addObject:padding(mgline(textField))];
//    _textField = textField;
    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRect) {0, 0, 300, 100}];
    textView.editable = YES;
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
    textView.font = TCFont_HNLTComMd(15);
    textView.returnKeyType = UIReturnKeyDone;
    textView.delegate = self;   
    [textView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [textView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [textView.layer setBorderWidth: 1.0];
    [textView.layer setCornerRadius:8.0f];
    [textView.layer setMasksToBounds:YES];
    [table.boxes addObject:padding(mgline(textView))];
    _textField = textView;
}

- (void) numericSurvey {
    [self textSurvey];
}

#pragma mark - text field delegate 

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
//    // [self moveToNext];
//    return YES;
//}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - picker delegate

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    NSString* obj = _survey.answerArray[row];
//    if ([self.selected containsObject:obj]) {
//        [self.selected removeObject:obj];
//        // [pickerView reloadAllComponents];
//        return;
//    }
//   /* if (self.pickerSingle) {
//        [self.selected removeAllObjects];
//    } */
//    [self.selected addObject:obj];
//    // [pickerView reloadAllComponents];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    NSString* str = _survey.answerArray[row];
   // if (!self.pickerSingle && [self.selected containsObject:str]) {
   //     str = [str stringByAppendingString:@" ✔"];
   // }
    UILabel *pickerLabel = [[UILabel alloc] initWithFrame:self.pickerHeight];
    [pickerLabel setBackgroundColor:[UIColor clearColor]];
    [pickerLabel setFont:TCFont_HNLTComBd(24)];
    [pickerLabel setNumberOfLines:0];
    [pickerLabel setText:str];
    return pickerLabel;
}

@end
