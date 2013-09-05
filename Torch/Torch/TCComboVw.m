//
//  TCComboVw.m
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCComboVw.h"

@interface TCComboVw() {
    UIPickerView * picker;
    UISegmentedControl * cancelButton;
    UISegmentedControl * closeButton;
}

@property(nonatomic, readonly)UIPickerView * picker;
@property(nonatomic, copy) TCComboVwCallback callback;

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

+ (TCComboVw *) instance:(id)delegate callback:(TCComboVwCallback)callback {
    TCComboVw * result = [self instance:delegate];
    result.callback = callback;
    return result;
}

+ (TCComboVw *) instance:(id)delegate {
    TCComboVw * result = [[TCComboVw alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    result.picker.dataSource = delegate;
    result.picker.delegate = delegate;
    return result;
}

- (NSUInteger) selectedRow {
    return [picker selectedRowInComponent:0];
}

@end
