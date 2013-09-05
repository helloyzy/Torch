//
//  TCPrinterCtl.h
//  Torch
//
//  Created by Whitman Yang on 9/3/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCPrinterCtl : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    
    __weak IBOutlet UILabel *lblTitle;
    
    __weak IBOutlet UIView *vwPrintName;
    __weak IBOutlet UILabel *lblPrinter;
    __weak IBOutlet UILabel *lblPrinterName;
    
    __weak IBOutlet UIView *vwNumOfCopy;
    __weak IBOutlet UILabel *lblNumOfCopy;
    __weak IBOutlet UILabel *lblCopy;
    __weak IBOutlet UIStepper *slCopy;
    __weak IBOutlet UIButton *btnPrint;
}
- (IBAction)printCopyChanged:(id)sender;

- (IBAction)showAvailablePrinters:(id)sender;
@end
