//
//  TCAddNewCustomerVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCAddNewCustomerVwCtl.h"
#import "TCSysRes.h"
#import "NSObject+Association.h"
#import "TCCustomer.h"
#import "DRTextField.h"
#import "TCEditingCell.h"

#define _TV_ROW_HEIGHT 40
#define _TV_FIELD_FONTSIZE 14
#define WIDTH(x) x.size.width
#define HEIGHT(x) x.size.height

static int textFieldTag = START_EDIT_VIEW_TAG;

int calculateTag(NSIndexPath * indexPath) {
    if (indexPath.section == 0 && indexPath.row == 0) {
        // reset on first editing control
        textFieldTag = START_EDIT_VIEW_TAG;
    }
    if (textFieldTag == END_EDIT_VIEW_TAG) {
        NSLog(@"Not enough tag values in 'Add New Customer' view");
        return -1; // NOT ENOUGH TAG VALUES!
    }
    return textFieldTag ++;
}

void customizeField(DRTextField * textField, NSIndexPath * indexPath, NSObject * modelObject, NSString * modelProp, NSString * textPlaceHolder, UIKeyboardType keyboardType, id delegate) {
    textField.font = TCFont_HNLTComLt(_TV_FIELD_FONTSIZE);
    textField.placeholder = textPlaceHolder;
    textField.dataObject = modelObject;
    textField.dataProperty = modelProp;
    textField.keyboardType = keyboardType;
    textField.tag = calculateTag(indexPath);
    textField.returnKeyType = UIReturnKeyNext;
    textField.delegate = delegate;
    
}

@interface TCAddNewCustomerVwCtl () {
}

@property (nonatomic,strong) TCCustomer * customer;

@end

@implementation TCAddNewCustomerVwCtl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIView *) viewForTapToDismissKeyboard {
    return self.view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.customer = [[TCCustomer alloc] init];
    [self initInternal];
}

- (UIBarButtonItem *)navItemWithImage:(NSString *)imageName title:(NSString *)title {
    UIImage * image = [UIImage imageNamed:imageName];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 71, 30);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = TCFont_HNLTComBd(15);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
//    if ([self respondsToSelector:@selector(toggleProfileView:)]) {
//        [btn addTarget:self action:@selector(toggleProfileView:) forControlEvents:UIControlEventTouchUpInside];
//    }
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


- (void)initInternal {
    TCLbl_Title_Ext(lblTitle);
    lblTitle.text = [self localString:@"addnewcustomer.title"];
    
    if (self.navigationController) {
        NSString * cancelText = [self localString:@"Cancel"];
        NSString * saveText = [self localString:@"Save"];
        self.navigationItem.leftBarButtonItem = [self navItemWithImage:@"cancel.png" title:cancelText];
        self.navigationItem.rightBarButtonItem = [self navItemWithImage:@"save.png" title:saveText];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - table view delegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 7;
            break;
        case 2:
            return 4;
            break;
        default:
            break;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _TV_ROW_HEIGHT;
}

- (TCEditingCell *)singleTextCell {
    return [[TCEditingCell alloc] initWithEditStyle:TCEditingCellStyleCenter reuseIdentifier:nil];
}

- (TCEditingCell *)doubleTextCell {
    return [[TCEditingCell alloc] initWithEditStyle:TCEditingCellStyleLeftRight reuseIdentifier:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell;
    TCEditingCell * editCell;
    if (indexPath.section == 0) {
        editCell = [self singleTextCell];
        customizeField(editCell.centerField, indexPath, self.customer, @"storeName", [self localString:@"storeName"], UIKeyboardTypeDefault, self);
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, self.customer, @"streetName", [self localString:@"streetName"], UIKeyboardTypeDefault, self);
                break;
            case 1:
                editCell = [self doubleTextCell];
                customizeField(editCell.leftField, indexPath, self.customer, @"city", [self localString:@"city"], UIKeyboardTypeDefault, self);
                customizeField(editCell.rightField, indexPath, self.customer, @"state", [self localString:@"state"], UIKeyboardTypeDefault, self);
                break;
            case 2:
                editCell = [self doubleTextCell];
                customizeField(editCell.leftField, indexPath, self.customer, @"zip", [self localString:@"zip"], UIKeyboardTypeDefault, self);
                customizeField(editCell.rightField, indexPath, self.customer, @"mexico", [self localString:@"mexico"], UIKeyboardTypeDefault, self);
                break;
            case 3:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, nil, nil, [self localString:@"Pais"], UIKeyboardTypeDefault, self);
                break;
            case 4:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, nil, nil, [self localString:@"Calle de 1"], UIKeyboardTypeDefault, self);
                break;
            case 5:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, nil, nil, [self localString:@"Calle de 2"], UIKeyboardTypeDefault, self);
                break;
            case 6:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, self.customer, @"storePhoneNum", [self localString:@"storePhoneNum"], UIKeyboardTypePhonePad, self);
                break;
            default:
                break;
        }

    } else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, self.customer, @"streetName", [self localString:@"streetName"], UIKeyboardTypeDefault, self);
                break;
            case 1:
                editCell = [self doubleTextCell];
                customizeField(editCell.leftField, indexPath, self.customer, @"city", [self localString:@"city"], UIKeyboardTypeDefault, self);
                customizeField(editCell.rightField, indexPath, self.customer, @"state", [self localString:@"state"], UIKeyboardTypeDefault, self);
                break;
            case 2:
                editCell = [self doubleTextCell];
                customizeField(editCell.leftField, indexPath, self.customer, @"zip", [self localString:@"zip"], UIKeyboardTypeDefault, self);
                customizeField(editCell.rightField, indexPath, self.customer, @"mexico", [self localString:@"mexico"], UIKeyboardTypeDefault, self);
                break;
            case 3:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, self.customer, @"storePhoneNum", [self localString:@"storePhoneNum"], UIKeyboardTypeDefault, self);
                break;
            default:
                break;
        }
    }
    if (cell) {
        return cell;
    } else if (editCell) {
        return editCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@_%@_%i", self.customer.storeName, self.customer.streetName, [self.customer isModified]);
}

#pragma mark - text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [tblVw scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
