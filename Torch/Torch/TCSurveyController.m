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
#import <OCTotallyLazy.h>

@interface TCSurveyController ()

@property (nonatomic, retain) NSArray* surveyOptions;
@property (atomic) CGRect pickerHeight;
@property (atomic) BOOL pickerSingle;
@property (nonatomic, retain) NSMutableSet* selected;

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

    DDProgressView *progressBar = [[DDProgressView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, self.view.bounds.size.width - 30.0f, 100.0f)];
    progressBar.outerColor = [UIColor clearColor];
    progressBar.emptyColor = TCColorProgressLtBlue;
    progressBar.progress = 0.5f;
    progressBar.innerColor = TCColorProgressBlue;

    UILabel *progressText = [[UILabel alloc] initWithFrame:(CGRect) {0, 5, progressBar.bounds.size.width, progressBar.bounds.size.height-5}];
    progressText.adjustsFontSizeToFitWidth = NO;
    progressText.textAlignment = NSTextAlignmentCenter;
    progressText.numberOfLines = 1;
    progressText.textColor = [UIColor whiteColor];
    progressText.backgroundColor = [UIColor clearColor];
    progressText.text = @"8 of 10";
    progressText.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
    [progressBar addSubview:progressText];

    [table.topLines addObject:mgline(progressBar)];

    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:(CGRect) {0, 0, 320, 300}];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    picker.dataSource = self;
    [table.topLines addObject:mgline(picker)];
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
    return [self.surveyOptions objectAtIndex:row];
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 300;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return self.pickerHeight.size.height;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString* obj = [self.surveyOptions objectAtIndex:row];
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
    NSString* str = [self.surveyOptions objectAtIndex:row];
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
