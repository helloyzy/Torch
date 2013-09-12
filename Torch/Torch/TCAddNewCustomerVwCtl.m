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
#import "TCComboVw.h"

#define _TV_ROW_HEIGHT 36
#define _TV_FIELD_FONTSIZE 14
#define WIDTH(x) x.size.width
#define HEIGHT(x) x.size.height
#define _TAG_BTN_SHOWCOMBO1 10098
#define _TAG_BTN_SHOWCOMBO2 10099

int rowDeviation(NSIndexPath * indexPath) {
    int result = 0;
    if (indexPath.section == 1) {  // || indexPath.section == 2
        if (indexPath.row == 2) {
            result = 1;
        } else if (indexPath.row > 2) {
            result = 2;
        }
    }
    return result;
}

int calculateTag(NSIndexPath * indexPath, int column) {
    static int countPerSection[] = {1, 9, 0, 1, 0, 0};
    int result = 0;
    // previous sections
    for (int i = 0; i < indexPath.section; i++) {
        result += countPerSection[i];
    }
    result += indexPath.row + rowDeviation(indexPath);
    result += column;
    result += START_EDIT_VIEW_TAG;
    if (result >= END_EDIT_VIEW_TAG) {
        NSLog(@"Not enough tag values in 'Add New Customer' view");
        return -1; // NOT ENOUGH TAG VALUES!
    }
    // NSLog(@"Section: %i, Row: %i, Tag is %i", indexPath.section, indexPath.row, result);
    return result;
}

void customizeField(DRTextField * textField, NSIndexPath * indexPath, int column, NSObject * modelObject, NSString * modelProp, NSString * textPlaceHolder, UIKeyboardType keyboardType, id delegate) {
    textField.font = TCFont_HNLTComLt(_TV_FIELD_FONTSIZE);
    textField.placeholder = textPlaceHolder;
    textField.dataObject = modelObject;
    textField.dataProperty = modelProp;
    textField.keyboardType = keyboardType;
    textField.tag = calculateTag(indexPath, column);
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
    return 8;
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
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            return 1;
            break;
        default:
            break;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _TV_ROW_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) { //section ==2 --> button section
        return 13.0;
    }
    return 5.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return  10.0;
    }
    return 5.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell;
    TCEditingCell * editCell;
    if (indexPath.section == 0) {
        editCell = [self singleTextCell];
        customizeField(editCell.centerField, indexPath, 0, self.customer, @"storeName", [self localString:@"addnewcustomer.storeName"], UIKeyboardTypeDefault, self);
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, self.customer, @"streetName", [self localString:@"addnewcustomer.housenameAndStreet"], UIKeyboardTypeDefault, self);
                break;
            case 1:
                editCell = [self doubleTextCell];
                customizeField(editCell.leftField, indexPath, 0, self.customer, @"city", [self localString:@"addnewcustomer.city"], UIKeyboardTypeDefault, self);
                customizeField(editCell.rightField, indexPath, 1, self.customer, @"state", [self localString:@"addnewcustomer.state"], UIKeyboardTypeDefault, self);
                break;
            case 2:
                editCell = [self doubleTextCell];
                customizeField(editCell.leftField, indexPath, 0, self.customer, @"postcode", [self localString:@"addnewcustomer.postcode"], UIKeyboardTypeDefault, self);
                customizeField(editCell.rightField, indexPath, 1, self.customer, @"municipality", [self localString:@"addnewcustomer.municipality"], UIKeyboardTypeDefault, self);
                break;
            case 3:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0,  self.customer, @"country", [self localString:@"addnewcustomer.country"], UIKeyboardTypeDefault, self);
                break;
            case 4:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, self.customer, @"streetRef1", [self localString:@"addnewcustomer.referenceStreet1"], UIKeyboardTypeDefault, self);
                break;
            case 5:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, self.customer, @"streetRef2", [self localString:@"addnewcustomer.referenceStreet2"], UIKeyboardTypeDefault, self);
                break;
            case 6:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, self.customer, @"storePhoneNum", [self localString:@"addnewcustomer.storePhoneNumber"], UIKeyboardTypePhonePad, self);
                break;
            default:
                break;
        }

    } else if (indexPath.section == 2) {
        static NSString * btnCellIdentifier = @"btnCell";
        cell = [tblVw dequeueReusableCellWithIdentifier:btnCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellIdentifier];
            UIView * bgVw = [[UIView alloc] initWithFrame:CGRectZero];
            bgVw.backgroundColor = [UIColor clearColor];
            cell.backgroundView = bgVw;
            // cell.backgroundColor = [UIColor clearColor];
            // cell.contentView.backgroundColor = [UIColor clearColor];
            CGRect btnFrame = CGRectMake(0, 0, cell.contentView.bounds.size.width - 18, CGRectGetHeight(cell.contentView.bounds));
            UIButton * btn = [[UIButton alloc] initWithFrame:btnFrame]; // CGRectInset(cell.bounds, 5, 5)
            btn.titleLabel.font = TCFont_HNLTComBd(14);
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:[self localString:@"addnewcustomer.obtainGPSInfo"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"bluebutton.png"] forState:UIControlStateNormal];
            [cell.contentView addSubview:btn];
        }
    } else if (indexPath.section == 3) {
        editCell = [self singleTextCell];
        customizeField(editCell.centerField, indexPath, 0, self.customer, @"rfc", [self localString:@"addnewcustomer.rfc"], UIKeyboardTypeDefault, self);
    } else if (indexPath.section == 4) {
        editCell = [self comboCell:@[@"Text1", @"Text2"]];
        editCell.rightBtn.tag = _TAG_BTN_SHOWCOMBO1;
        editCell.backgroundColor = [UIColor darkGrayColor];
        customizeField(editCell.leftField, indexPath, 0, self.customer, @"customerType", [self localString:@"addnewcustomer.typeOfClient"], UIKeyboardTypeDefault, self);
        // [editCell.rightBtn removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    } else if (indexPath.section == 5) {
        editCell = [self comboCell:@[@"Text8", @"Text9"]];
        editCell.rightBtn.tag = _TAG_BTN_SHOWCOMBO2;
        editCell.backgroundColor = [UIColor darkGrayColor];
        customizeField(editCell.leftField, indexPath, 0, self.customer, @"visitDay", [self localString:@"addnewcustomer.visitingDay"], UIKeyboardTypeDefault, self);
        // [editCell.rightBtn removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    } else if (indexPath.section == 6 || indexPath.section == 7) {
        static NSString * addCellIdentifier = @"addCell";
        cell = [tblVw dequeueReusableCellWithIdentifier:addCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.imageView.image = [UIImage imageNamed:@"focus.png"];
            cell.textLabel.font = TCFont_HNLTComBd(_TV_FIELD_FONTSIZE);
            cell.textLabel.textColor = TCColor_DarkBlue();
        }
        if (indexPath.section == 6) {
            cell.textLabel.text = [self localString:@"addnewcustomer.addContact"];
        } else {
            cell.textLabel.text = [self localString:@"addnewcustomer.addNote"];
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
    if (indexPath.section == 4) {
        UIButton * btn = (UIButton *)[tableView viewWithTag:_TAG_BTN_SHOWCOMBO1];
        [btn sendActionsForControlEvents:UIControlEventTouchUpInside];
    } else if (indexPath.section == 5) {
        UIButton * btn = (UIButton *)[tableView viewWithTag:_TAG_BTN_SHOWCOMBO2];
        [btn sendActionsForControlEvents:UIControlEventTouchUpInside];

    } else if (indexPath.section == 6) {
        NSLog(@"Add new contact!!");
    } else if (indexPath.section == 7) {
        NSLog(@"Add new note");
    }
}

#pragma mark - customized table view cell

- (TCEditingCell *)editingCell:(TCEditingCellStyle)editingStyle reuseIdentifier:(NSString *)reuseIdentifier {
    TCEditingCell * cell = (TCEditingCell *)[tblVw dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[TCEditingCell alloc] initWithEditStyle:editingStyle reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (TCEditingCell *)singleTextCell {
    static NSString * singleReuseIdentifier = @"SingleCell";
    return [self editingCell:TCEditingCellStyleCenter reuseIdentifier:singleReuseIdentifier];
}

- (TCEditingCell *)doubleTextCell {
    static NSString * doubleTextReuseIdentifier = @"DoubleTextCell";
    return [self editingCell:TCEditingCellStyleLeftRight reuseIdentifier:doubleTextReuseIdentifier];
}

- (TCEditingCell *)comboCell:(NSArray *)ds {
    static NSString * comboCellIdentifier = @"ComboCell";
    TCEditingCell * cell = [self editingCell:TCEditingCellStyleCombo reuseIdentifier:comboCellIdentifier];
    [cell.comboVw setDataSource:ds];
    return cell;
    // return [self editingCell:TCEditingCellStyleLeftFieldRightBtn reuseIdentifier:comboCellIdentifier];
}

#pragma mark - decorate text field for cell

//- (NSInteger) availableViewTags:(UIView *)superVw initialTagVal:(NSInteger)tagVal {
//    NSInteger result = tagVal;
//    while ([superVw viewWithTag:result]) {
//        result ++;
//    }
//    return result;
//}
//
//- (NSInteger) calculateTag:(NSIndexPath *)indexPath column:(NSInteger)column {
//    static int countPerSection[] = {1, 9, 6, 0};
//    int result = 0;
//    // previous sections
//    for (int i = 0; i < indexPath.section; i++) {
//        result += countPerSection[i];
//    }
//    result += indexPath.row;
//    result += column;
//    result += START_EDIT_VIEW_TAG;
//    result = [self availableViewTags:tblVw initialTagVal:result];
//    if (result >= END_EDIT_VIEW_TAG) {
//        NSLog(@"Not enough tag values in 'Add New Customer' view");
//        return -1; // NOT ENOUGH TAG VALUES!
//    }
//    NSLog(@"Tag is %i", result);
//    return result;
//}

#pragma mark - text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"did begin");
    // [tblVw scrollRectToVisible:textField.frame animated:YES];
    // [tblVw scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
