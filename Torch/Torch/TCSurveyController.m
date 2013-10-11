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
#import "MGTableBox.h"
#import "Survey.h"
#import <OCTotallyLazy.h>
#import "UIViewController+MGBox.h"

@interface TCSurveyController ()

@property (nonatomic, retain) NSArray* surveyOptions;
@property (atomic) CGRect pickerHeight;
@property (atomic) BOOL pickerSingle;
@property (nonatomic, retain) NSMutableSet* selected;
@property (atomic) NSArray* questions;

@end

@implementation TCSurveyController

@synthesize surveyOptions;

UIFont* pickerFont;
CGSize pickerConstraint = (CGSize){265, FLT_MAX};

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
    
    pickerFont = [UIFont boldSystemFontOfSize:24.0];
    self.selected = [[NSMutableSet alloc] init];
    self.pickerSingle = NO;
    self.surveyOptions = @[@"A little late, this works a charm, to use the default keyboard height, specify a height of 0", @"B", @"C"];
    CGFloat height = [[[self.surveyOptions map:^(NSString* str) {
        return [NSNumber numberWithFloat:
                [str sizeWithFont:pickerFont
                constrainedToSize:pickerConstraint].height];
    }] reduce:^(NSNumber* x, NSNumber* y) {
        return [x compare:y] == NSOrderedDescending ? x : y;
    }] floatValue];
    self.pickerHeight = (CGRect) {0, 0, 265, height};

    MGTableBox *table = [MGTableBox boxWithSize:self.view.size];
    
    [table.topLines addObject:[self sectionHeader:@"de Marketing" backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] fontName:@"HelveticaNeueLTCom-Md"]];

    DDProgressView *progressBar = [[DDProgressView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, self.view.bounds.size.width - 30.0f, 100.0f)];
    progressBar.outerColor = [UIColor clearColor];
    progressBar.emptyColor = TCColorProgressLtBlue;
    progressBar.progress = 0.5f;
    progressBar.innerColor = TCColorProgressBlue;

    UILabel *progressText = [[UILabel alloc] initWithFrame:(CGRect) {0, 5, progressBar.bounds.size.width, progressBar.bounds.size.height-5}];
    progressText.adjustsFontSizeToFitWidth = NO;
    progressText.textAlignment = NSTextAlignmentLeft;
    progressText.numberOfLines = 1;
    progressText.textColor = [UIColor whiteColor];
    progressText.backgroundColor = [UIColor clearColor];
    progressText.text = [NSString stringWithFormat:@"   Pregunta %d de %d", 8, 10];
    progressText.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
    [progressBar addSubview:progressText];

    [table.topLines addObject:padding(mgline(progressBar))];
    
    [table.topLines addObject:[self sectionHeader:@"Promp" backgroundColor:[UIColor clearColor] underlineColor:[UIColor clearColor] fontName:@"HelveticaNeueLTCom-Md"]];

    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:(CGRect) {0, 0, 320, 300}];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self;
    //[table.topLines addObject:mgline(picker)];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:(CGRect) {0, 0, 300, 30}];
    textField.placeholder = @"Answer";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [table.topLines addObject:padding(mgline(textField))];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRect) {0, 0, 300, 60}];
    textView.editable = YES;
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
    [textView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [textView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [textView.layer setBorderWidth: 1.0];
    [textView.layer setCornerRadius:8.0f];
    [textView.layer setMasksToBounds:YES];
    
    [table.topLines addObject:padding(mgline(textView))];
    [table.topLines addObject:padding(mgline(blueButton(@"Next")))];
    
    [table layout];
    [self.view addSubview:table];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    assert(self.surveyOptions != NULL);
    return [surveyOptions count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.surveyOptions[row];
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 300;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return self.pickerHeight.size.height;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString* obj = self.surveyOptions[row];
    if ([self.selected containsObject:obj]) {
        [self.selected removeObject:obj];
        [pickerView reloadAllComponents];
        return;
    }
    if (self.pickerSingle) {
        [self.selected removeAllObjects];
    }
    [self.selected addObject:obj];
    [pickerView reloadAllComponents];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    NSString* str = self.surveyOptions[row];
    if (!self.pickerSingle && [self.selected containsObject:str]) {
        str = [str stringByAppendingString:@" ✔"];
    }
    UILabel *pickerLabel = [[UILabel alloc] initWithFrame:self.pickerHeight];
    [pickerLabel setBackgroundColor:[UIColor clearColor]];
    [pickerLabel setFont:[UIFont boldSystemFontOfSize:24.0]];
    [pickerLabel setNumberOfLines:0];
    [pickerLabel setText:str];
    return pickerLabel;
}

@end
