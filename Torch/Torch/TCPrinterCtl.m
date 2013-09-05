//
//  TCPrinterCtl.m
//  Torch
//
//  Created by Whitman Yang on 9/3/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPrinterCtl.h"
#import "TCSysRes.h"
#import "UIViewController+Utils.h"
#import "UIViewController+Torch.h"
#import <QuartzCore/QuartzCore.h>
#import "GraphicsUtils.h"

@interface TCPrinterCtl () {
}

@end

@implementation TCPrinterCtl

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
    [self initCtl];
    
}

- (void)initVwContainer:(UIView *)vwContainer {
    vwContainer.backgroundColor = [UIColor whiteColor];
    vwContainer.layer.cornerRadius = 8.0f;
    CGColorRef borderColor = [[UIColor lightGrayColor] CGColor];
    vwContainer.layer.borderColor = borderColor;
    vwContainer.layer.borderWidth = 1.0;
}

static CGFloat FONT_SIZE = 15.0f;

- (void)initStaticLbl:(UILabel *)lbl {
    lbl.font = TCFont_HNLTComLt(FONT_SIZE);
    lbl.textColor = [UIColor darkGrayColor];
}

- (void)initTextLbl:(UILabel *)lbl {
    lbl.font = TCFont_HNLTComLt(FONT_SIZE);
    lbl.textColor = [UIColor blackColor];
}

- (void) initCtl {
    TCLbl_Title_Ext(lblTitle);
    lblTitle.text = [self localString:@"printer.title"];
    
    [self initVwContainer:vwPrintName];
    [self initVwContainer:vwNumOfCopy];
    
    [self initStaticLbl:lblPrinter];
    [self initStaticLbl:lblCopy];
    lblPrinter.text = [self localString:@"printer.lbl.titleName"];
    lblCopy.text = [self localString:@"printer.lbl.copy"];
    
    [self initTextLbl:lblPrinterName];
    [self initTextLbl:lblNumOfCopy];
    
    slCopy.value = 1;
    
    btnPrint.titleLabel.font = TCFont_HNLTComBd(14);
    btnPrint.titleLabel.text = [self localString:@"printer.btn.print"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)printCopyChanged:(id)sender {
    lblNumOfCopy.text = [NSString stringWithFormat:@"%i", (int)slCopy.value];
}

- (IBAction)showAvailablePrinters:(id)sender {
    // pVPrinters.hidden = NO;
    UIActionSheet * menu = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil
						 destructiveButtonTitle:nil otherButtonTitles:nil];
	CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
	
	UIPickerView * statePicker = [[UIPickerView alloc] initWithFrame:pickerFrame];
	statePicker.dataSource = self;
	statePicker.delegate = self;
	statePicker.showsSelectionIndicator= YES;
	[menu addSubview:statePicker];
	
	UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
	closeButton.momentary = YES;
	closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = TCColorProgressBlue;
	[closeButton addTarget:self action:@selector(dismissStateActionSheet:) forControlEvents:UIControlEventValueChanged];
	[menu addSubview:closeButton];
	
	[menu showInView:self.view];
	[menu setBounds:CGRectMake(0, 0, 320, 485)];
}


#pragma mark - pick view datasource and delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"Printer %i", row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // lblPrinterName.text = [NSString stringWithFormat:@"Printer %i", row];
    // pickerView.hidden = YES;
}

- (void)dismissStateActionSheet:(id)sender {
    
}

@end
