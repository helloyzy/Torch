//
//  TCComboVw.m
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCComboVw.h"

@interface SimplePickerDelegate : NSObject<UIPickerViewDataSource, UIPickerViewDelegate>

- (NSString *) valueFromIndex:(NSInteger)index;

@property(nonatomic, copy) NSArray * ds;

@end

@implementation SimplePickerDelegate

- (id) initWithArrayAsDs:(NSArray *)ds {
    self = [super init];
    if (self) {
        self.ds = ds;
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
    UIPickerView * picker;
    UISegmentedControl * cancelButton;
    UISegmentedControl * closeButton;
}

@property(nonatomic, readonly)UIPickerView * picker;
@property(nonatomic, copy) TCComboVwCallback callback;
@property(nonatomic, strong) SimplePickerDelegate * pickerDelegate;

@end

@implementation TCComboVw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initInternal];
    }
    return self;
}

- (void)initInternal {    
	picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 0, 0)];
	picker.showsSelectionIndicator= YES;
	[self addSubview:picker];
    
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

- (void)cancel {
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)done {
    [self cancel];
    // self.selectedIndex = [self selectedRow];
    if (self.callback) {
        self.callback(self);
    }
}

#pragma mark - properties

- (UIPickerView *) picker {
    return picker;
}


#pragma mark - public methods

+ (TCComboVw *)instance {
    return [[TCComboVw alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
}

+ (TCComboVw *) instance:(id)delegate callback:(TCComboVwCallback)callback {
    TCComboVw * result = [self instance:delegate];
    result.callback = callback;
    return result;
}

+ (TCComboVw *) instance:(id)delegate {
    TCComboVw * result = [TCComboVw instance];
    result.picker.dataSource = delegate;
    result.picker.delegate = delegate;
    return result;
}

+ (TCComboVw *) instanceWithDataSource:(NSArray *)ds {
    TCComboVw * result = [self instance];
    [result setDataSource:ds];
    return result;
}

- (void)show {
    [self showInView:[UIApplication sharedApplication].keyWindow];
}

- (NSUInteger) selectedRow {
    return [picker selectedRowInComponent:0];
}

- (void)setDataSource:(NSArray *)ds {
    if (ds && ds.count > 0) {
        self.pickerDelegate = [[SimplePickerDelegate alloc]initWithArrayAsDs:ds];
        self.picker.dataSource = self.pickerDelegate;
        self.picker.delegate = self.pickerDelegate;
    }
}

- (NSString *) selectedItem {
    if (self.pickerDelegate) {
        return [self.pickerDelegate valueFromIndex:[picker selectedRowInComponent:0]];
    }
    return nil;
}

- (void) setCompletionCallback:(TCComboVwCallback)callback {
    self.callback = callback;
}

@end
