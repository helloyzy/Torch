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
#import "TCComboVw.h"

@interface TCPrinterCtl () {
    TCComboVw * printCombo;
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
    [btnPrint setTitle:[self localString:@"printer.btn.print"] forState:UIControlStateNormal];
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
    if (!printCombo) {
        __block TCPrinterCtl * temp = self;
        printCombo = [TCComboVw instance:self callback:^(TCComboVw * combo) {
            [temp dismissCombo:combo];
        }];
    }
    [printCombo showInView:self.view];
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {}

- (void)dismissCombo:(TCComboVw *)combo {
    lblPrinterName.text = [NSString stringWithFormat:@"Printer %i", [combo selectedRow]];
}

@end
