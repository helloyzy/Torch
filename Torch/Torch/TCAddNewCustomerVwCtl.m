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
#import "TCContact.h"
#import "TCUtils.h"
#import "TCDBUtils.h"
#import "Store.h"
#import "Contact.h"

#import "NSManagedObject+InnerBand.h"
#import "IBCoreDataStore.h"


#define _TV_ROW_HEIGHT 36
#define _TV_FIELD_FONTSIZE 14
#define WIDTH(x) x.size.width
#define HEIGHT(x) x.size.height
#define _TAG_BTN_SHOWCOMBO1 10098
#define _TAG_BTN_SHOWCOMBO2 10099
#define _CONTACT_SECTION_START 6
#define _AddNewContact_Section [self sectionFromContact:0]
#define _AddNewNote_Section [self sectionFromContact:1]
#define _AlertViewTag_CancelConfirmation 100
#define _AlertViewTag_SaveConfirmation 101

// only for sections which has rows containing two columns (like city and state)
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
    // previous sections - sections above CONTACTS
    for (int i = 0; i < indexPath.section && i < _CONTACT_SECTION_START; i++) {
        result += countPerSection[i];
    }
    // CONTACTS sections
    if (indexPath.section >= _CONTACT_SECTION_START) {
        result += 4 * (indexPath.section - _CONTACT_SECTION_START);
    }
    result += indexPath.row + rowDeviation(indexPath);
    result += column; // for rows which have more than 1 column
    result += START_EDIT_VIEW_TAG;
    // NSLog(@"Section: %i, Row: %i, Tag is %i", indexPath.section, indexPath.row, result);
    if (result >= END_EDIT_VIEW_TAG) {
        NSLog(@"Not enough tag values in 'Add New Customer' view, current tag value is %i", result);
        return -1; // NOT ENOUGH TAG VALUES!
    }
    return result;
}

void customizeField(DRTextField * textField, NSIndexPath * indexPath, int column, NSObject * modelObject, NSString * modelProp, NSString * textPlaceHolder, UIKeyboardType keyboardType, id delegate) {
    textField.font = TCFont_HNLTComLt(_TV_FIELD_FONTSIZE);
    textField.placeholder = textPlaceHolder;
    [textField setDataObject:modelObject dataProperty:modelProp];
    textField.keyboardType = keyboardType;
    textField.tag = calculateTag(indexPath, column);
    textField.returnKeyType = UIReturnKeyNext;
    textField.delegate = delegate;
    
}

@interface TCAddNewCustomerVwCtl () {
    BOOL _isAddNew;
}

@property (nonatomic, strong) TCCustomer * customer;
@property (nonatomic, strong) NSMutableArray * contacts;

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

- (BOOL)shouldObserveKeyboardInfo {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.customer = [[TCCustomer alloc] init];
    self.contacts = [[NSMutableArray alloc] init];
    _isAddNew = YES;
    if (self.store) {
        _isAddNew = NO;
        self.customer.storeName = self.store.name;
        self.customer.streetName = self.store.address;
        self.customer.city = self.store.city;
        self.customer.state = self.store.state;
        self.customer.postcode = self.store.postalCode;
        // ? Municipality
        self.customer.country = self.store.country;
        // ? Street Ref 1
        // ? Street Ref 2
        // ? Phone
        // ? RFC
        // ? CustomerType
        if (self.store.lastModifiedDate) {
            self.customer.visitDay = millisecondToDateStr(self.store.lastModifiedDateValue);
        }
        if (self.store.contacts) {
            for (Contact * contact in self.store.contacts) {
                TCContact * temp = [[TCContact alloc] init];
                temp.name = contact.firstName;
                temp.surname = contact.lastName;
                temp.position = contact.title;
                temp.phone = contact.phoneNumber;
                [self.contacts addObject:temp];
            }
        }
    }
    [self initInternal];
}

- (UIBarButtonItem *)navItemWithImage:(NSString *)imageName title:(NSString *)title action:(SEL)action {
    UIImage * image = [UIImage imageNamed:imageName];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 71, 30);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = TCFont_HNLTComBd(15);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


- (void)initInternal {
    TCLbl_Title_Ext(lblTitle);
    if (_isAddNew) {
        lblTitle.text = [self localString:@"addnewcustomer.title"];
    } else {
        lblTitle.text = [self localString:@"editcustomer.title"];
    }
    
    if (self.navigationController) {
        NSString * cancelText = [self localString:@"Cancel"];
        NSString * saveText = [self localString:@"Save"];
        self.navigationItem.leftBarButtonItem = [self navItemWithImage:@"cancel.png" title:cancelText action:@selector(cancelAction)];
        [self.navigationItem.leftBarButtonItem setAction:@selector(cancelAction)];
        [self.navigationItem.leftBarButtonItem setTarget:self];
        self.navigationItem.rightBarButtonItem = [self navItemWithImage:@"save.png" title:saveText action:@selector(saveAction)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - nav items actions

-(void) cancelAction {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil
                                                     message:[self localString:@"addnewcustomer.cancelConfirmation"]
                                                    delegate:self
                                           cancelButtonTitle:[self localString:@"Yes"]
                                           otherButtonTitles:[self localString:@"No"], nil];
    alert.tag = _AlertViewTag_CancelConfirmation;
    [alert show];
}

-(void) saveAction {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil
                                                     message:[self localString:@"addnewcustomer.saveConfirmation"]
                                                    delegate:self
                                           cancelButtonTitle:[self localString:@"Yes"]
                                           otherButtonTitles:[self localString:@"No"], nil];
    alert.tag = _AlertViewTag_SaveConfirmation;
    [alert show];
}

#pragma mark - alert view delegate

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == _AlertViewTag_CancelConfirmation) { // cancel?
        if (buttonIndex == 0) { // confirm on cancel
            [self.navigationController popViewControllerAnimated:YES];
        } else {  
            // donot cancel, do nothing
        }
    } else if (alertView.tag == _AlertViewTag_SaveConfirmation) { // save?
        if (buttonIndex == 0) { // confirm on save
            if (!self.store) {
                self.store = [Store createInStore:[TCDBUtils ibDataStore]];
            }
            self.store.name = self.customer.storeName;
            self.store.address = self.customer.streetName;
            self.store.city = self.customer.city;
            self.store.state = self.customer.state;
            self.store.postalCode = self.customer.postcode;
            self.store.country = self.customer.country;
            if (self.customer.visitDay) {
                self.store.lastModifiedDate = dateStrToMilliseconds(self.customer.visitDay);
            }
            
            NSMutableSet * tempContacts = [[NSMutableSet alloc] init];
            for (TCContact *tempTCContact in self.contacts) {
                Contact *tempContact = [Contact create];
                tempContact.firstName = tempTCContact.name;
                tempContact.lastName = tempTCContact.surname;
                tempContact.phoneNumber = tempTCContact.phone;
                tempContact.title = tempTCContact.position;
                [tempContacts addObject:tempContact];
            }
            NSSet *originalContacts = [self.store.contacts copy];
            for (Contact *tempContact in originalContacts) {
                [[TCDBUtils ibDataStore] removeEntity:tempContact];
            }
            self.store.contacts = tempContacts;
            [[TCDBUtils ibDataStore] save];
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            // do nothing
        }
    }
}

#pragma mark - table view delegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8 + self.contacts.count;
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
            return 1;
            break;
        default:
            break;
    }
    if (section == _AddNewContact_Section || section == _AddNewNote_Section) {
        return 1;
    }
    return 4; // contact section
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
            [btn addTarget:self action:@selector(requestLocation) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:btn];
        }
    } else if (indexPath.section == 3) {
        editCell = [self singleTextCell];
        customizeField(editCell.centerField, indexPath, 0, self.customer, @"rfc", [self localString:@"addnewcustomer.rfc"], UIKeyboardTypeDefault, self);
    } else if (indexPath.section == 4) {
        editCell = [self comboCell:@[@"Text1", @"Text2"]];
        editCell.rightBtn.tag = _TAG_BTN_SHOWCOMBO1;
        // editCell.backgroundColor = [UIColor darkGrayColor];
        customizeField(editCell.leftField, indexPath, 0, self.customer, @"customerType", [self localString:@"addnewcustomer.typeOfClient"], UIKeyboardTypeDefault, self);
    } else if (indexPath.section == 5) {
        // editCell = [self comboCell:@[@"Text8", @"Text9"]];
        editCell = [self dateComboCell];
        editCell.rightBtn.tag = _TAG_BTN_SHOWCOMBO2;
        // editCell.backgroundColor = [UIColor darkGrayColor];
        customizeField(editCell.leftField, indexPath, 0, self.customer, @"visitDay", [self localString:@"addnewcustomer.visitingDay"], UIKeyboardTypeDefault, self);
    } else if (indexPath.section == _AddNewContact_Section || indexPath.section == _AddNewNote_Section) {
        static NSString * addCellIdentifier = @"addCell";
        cell = [tblVw dequeueReusableCellWithIdentifier:addCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCellIdentifier];
            cell.imageView.image = [UIImage imageNamed:@"focus.png"];
            cell.textLabel.font = TCFont_HNLTComBd(_TV_FIELD_FONTSIZE);
            cell.textLabel.textColor = TCColor_DarkBlue();
        }
        if (indexPath.section == _AddNewContact_Section) {
            cell.textLabel.text = [self localString:@"addnewcustomer.addContact"];
        } else {
            cell.textLabel.text = [self localString:@"addnewcustomer.addNote"];
        }
    } else { // if we have contacts section if (self.contacts.count > 0) 
        TCContact *contact = self.contacts[indexPath.section - _CONTACT_SECTION_START];
        switch (indexPath.row) {
            case 0:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, contact, @"name", [self localString:@"addnewcustomer.name"], UIKeyboardTypeDefault, self);
                break;
            case 1:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, contact, @"surname", [self localString:@"addnewcustomer.surname"], UIKeyboardTypeDefault, self);
                break;
            case 2:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, contact, @"position", [self localString:@"addnewcustomer.position"], UIKeyboardTypeDefault, self);
                break;
            case 3:
                editCell = [self singleTextCell];
                customizeField(editCell.centerField, indexPath, 0, contact, @"phone", [self localString:@"addnewcustomer.phone"], UIKeyboardTypePhonePad, self);
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

- (void)showCombo:(UITableView *)tbVw tag:(NSInteger)tag indexPath:(NSIndexPath *)indexPath {
    UIButton * btn = (UIButton *)[tbVw viewWithTag:tag];
    [btn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // NSLog(@"%@_%@_%i", self.customer.storeName, self.customer.streetName, [self.customer isModified]);
    if (indexPath.section == 4) {
        [self showCombo:tableView tag:_TAG_BTN_SHOWCOMBO1 indexPath:indexPath];
    } else if (indexPath.section == 5) {
        [self showCombo:tableView tag:_TAG_BTN_SHOWCOMBO2 indexPath:indexPath];
    } else if (indexPath.section == _AddNewContact_Section) { // just after contact section
        // NSLog(@"Add new contact!!");
        [self addNewContact];
    } else if (indexPath.section == _AddNewNote_Section) {
        NSLog(@"Add new note");
    }
}

- (NSInteger)sectionFromContact:(NSInteger)deviation {
    return _CONTACT_SECTION_START + self.contacts.count + deviation;
}

- (void)addNewContact {
    TCContact * contact = [[TCContact alloc] init];
    [self.contacts addObject:contact];
    // [tblVw reloadData];
    
    NSIndexSet * indexSetToAdd = [NSIndexSet indexSetWithIndex:_CONTACT_SECTION_START + self.contacts.count - 1];
    [tblVw insertSections:indexSetToAdd withRowAnimation:UITableViewRowAnimationFade];
    
//    // also need to refresh ADD CONTACT and ADD NOTES sections
//    NSRange sectionsRange = NSMakeRange(_CONTACT_SECTION_START, self.contacts.count + 2);
//    NSIndexSet * sectionsToReload = [NSIndexSet indexSetWithIndexesInRange:sectionsRange];
//    [tblVw reloadSections:sectionsToReload withRowAnimation:UITableViewRowAnimationFade];
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
}

- (TCEditingCell *)dateComboCell {
    static NSString * dateComboCellIdentifier = @"DateComboCell";
    TCEditingCell * cell = [self editingCell:TCEditingCellStyleDateCombo reuseIdentifier:dateComboCellIdentifier];
    return cell;
}

#pragma mark - text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [super textFieldDidBeginEditing:textField];
    // NSLog(@"did begin");
    // [tblVw scrollRectToVisible:textField.frame animated:YES];
    // [tblVw scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - location manager delegate

- (void)requestLocation {
    registerLocationService(self);
    showProgressIndicator(nil, [self localString:@"addnewcustomer.requestGPS.message"]);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"%f,%f", location.coordinate.latitude, location.coordinate.longitude);
    [manager stopUpdatingLocation];
    hideProgressIndicator();
    showAlert(nil, [self localString:@"addnewcustomer.requestGPS.success"], nil);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [manager stopUpdatingLocation];
    hideProgressIndicator();
    showAlert(nil, [self localString:@"addnewcustomer.requestGPS.failure"], nil);
}

@end
