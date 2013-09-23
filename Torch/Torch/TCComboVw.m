//
//  TCComboVw.m
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCComboVw.h"

@interface SimplePickerDelegate : NSObject<UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray *_ds;
}

- (NSString *) valueFromIndex:(NSInteger)index;

@property(nonatomic, copy) NSArray * ds;

@end

@implementation SimplePickerDelegate

- (id) initWithArrayAsDs:(NSArray *)ds {
    self = [super init];
    if (self) {
        _ds = [ds copy];
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.ds.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.ds[row];
}

- (NSString *)valueFromIndex:(NSInteger)index {
    return self.ds[index];
}

@end

@interface TCComboVw() {
    __weak UIPickerView * _picker;
    __weak UIDatePicker * _datePicker;
    UISegmentedControl * cancelButton;
    UISegmentedControl * closeButton;
    TCComboVwStyle _style;
}

@property(nonatomic, readonly)UIPickerView * picker;
@property(nonatomic, readonly)UIDatePicker * datePicker;
@property(nonatomic, copy) TCComboVwCallback callback;
@property(nonatomic, strong) SimplePickerDelegate * pickerDelegate;

@end

@implementation TCComboVw

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame comboStyle:TCComboVwStyleDefault];
}

- (id)initWithFrame:(CGRect)frame comboStyle:(TCComboVwStyle)comboStyle {
    self = [super initWithFrame:frame];
    if (self) {
        _style = comboStyle;
        [self initInternal];
    }
    return self;
}

- (void)initInternal {
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    if (_style == TCComboVwStyleShortDate) {
        UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:pickerFrame];
        datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker = datePicker;
        [self addSubview:datePicker];
    } else {
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
        pickerView.showsSelectionIndicator= YES;
        _picker = pickerView;
        [self addSubview:pickerView];
    }
    
    NSString * doneText = NSLocalizedString(@"Done", nil);
    closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:doneText]];
	closeButton.momentary = YES;
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor colorWithRed:61.0/255 green:111.0/255 blue:153.0/255 alpha:1];
	[closeButton addTarget:self action:@selector(done) forControlEvents:UIControlEventValueChanged];
    closeButton.frame = CGRectMake(260, 7, 50, 30);
	[self addSubview:closeButton];
    
  
    NSString * cancelText = NSLocalizedString(@"Cancel", nil);
    cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:cancelText]];
	cancelButton.momentary = YES;
	cancelButton.segmentedControlStyle = UISegmentedControlStyleBar;
	// cancelButton.tintColor = [UIColor colorWithRed:105.0/255 green:106.0/255 blue:107.0/255 alpha:1];
    UIImage * cancelImage = [UIImage imageNamed:@"cancel.png"];
    if (cancelImage) {
        [cancelButton setBackgroundImage:cancelImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else {
        cancelButton.tintColor = [UIColor redColor];
    }
	[cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventValueChanged];
    cancelButton.frame = CGRectMake(7, 7, 50, 30);
    [self addSubview:cancelButton];
    
}

- (void) layoutSubviews {
    self.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

#pragma mark - done, cancel button actions

- (void) cancel {
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)done {
    [self cancel];
    if (self.callback) {
        self.callback(self);
    }
}

#pragma mark - public methods

- (void)show {
    [self showInView:[UIApplication sharedApplication].keyWindow];
}

- (void) setCompletionCallback:(TCComboVwCallback)callback {
    self.callback = callback;
}

+ (TCComboVw *)instanceWithType:(TCComboVwStyle)comboStyle {
    return [[TCComboVw alloc] initWithFrame:CGRectZero comboStyle:comboStyle];
}

#pragma mark - public methods for short date style

+ (TCComboVw *)shortDateInstance {
    return [self instanceWithType:TCComboVwStyleShortDate];
}

- (NSDate *)selectedDate {
    return self.datePicker.date;
}

#pragma mark - public methods for default style

- (NSUInteger) selectedRow {
    return [self.picker selectedRowInComponent:0];
}

- (NSString *) selectedItem {
    if (self.pickerDelegate) {
        return [self.pickerDelegate valueFromIndex:[self selectedRow]];
    }
    return nil;
}

- (void)setDataSource:(NSArray *)ds {
    if (self.picker && ds && ds.count > 0) {
        self.pickerDelegate = [[SimplePickerDelegate alloc]initWithArrayAsDs:ds];
        self.picker.dataSource = self.pickerDelegate;
        self.picker.delegate = self.pickerDelegate;
    }
}

+ (TCComboVw *)instance {
    return [self instanceWithType:TCComboVwStyleDefault];
    // return [[TCComboVw alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
}

+ (TCComboVw *) instance:(id)delegate callback:(TCComboVwCallback)callback {
    TCComboVw * result = [self instance:delegate];
    result.callback = callback;
    return result;
}

+ (TCComboVw *) instance:(id)delegate {
    TCComboVw * result = [self instance];
    result.picker.dataSource = delegate;
    result.picker.delegate = delegate;
    return result;
}

+ (TCComboVw *) instanceWithDataSource:(NSArray *)ds {
    TCComboVw * result = [self instance];
    [result setDataSource:ds];
    return result;
}

@end
