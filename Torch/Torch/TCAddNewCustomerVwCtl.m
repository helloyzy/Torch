//
//  TCAddNewCustomerVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCAddNewCustomerVwCtl.h"
#import "TCSysRes.h"
#import <objc/runtime.h>

#define _TV_ROW_HEIGHT 40
#define _TV_FIELD_FONTSIZE 14
#define WIDTH(x) x.size.width
#define HEIGHT(x) x.size.height

//@interface DRTextPropObserver : NSObject
//
//@property (nonatomic, weak) UITextField * target;
//
//@end
//
//@implementation DRTextPropObserver
//
//-(id) initWithTarget:(UITextField *)target {
//    self = [super init];
//    if (self) {
//        self.target = target;
//    }
//}
//
//@end

@interface NSObject(Association)

@end

@implementation NSObject(Association)

#define KEY_MODIFY @"KEY_MODIFY"

- (BOOL)isModified {
    return (objc_getAssociatedObject(self, KEY_MODIFY) != nil);
}

- (void)setModified {
    NSNumber * value = [NSNumber numberWithInt:1];
    objc_setAssociatedObject(self, KEY_MODIFY, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface TCCustomer : NSObject

@property(nonatomic, copy) NSString * storeName;
@property(nonatomic, copy) NSString * streetName;
@property(nonatomic, copy) NSString * city;
@property(nonatomic, copy) NSString * state;
@property(nonatomic, copy) NSString * zip;
@property(nonatomic, copy) NSString * Mexico;
@property(nonatomic, copy) NSString * storePhoneNum;

@end

@implementation TCCustomer

@end

@interface DRTextField : UITextField

+(DRTextField *) instance:(CGRect)frame data:(NSObject *)object prop:(NSString *)prop;

@property (nonatomic, weak) NSObject * dataObject;
@property (nonatomic, copy) NSString * dataProperty;

@end

@implementation DRTextField

#define DRTextField_PropObserved @"text"

- (void) dealloc {
    [self removeObserver:self forKeyPath:DRTextField_PropObserved];
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // observe self's text property
        [self addObserver:self forKeyPath:DRTextField_PropObserved options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:DRTextField_PropObserved]) { // text change, save change to the dataObject
        if (self.dataObject && self.dataProperty) {
            [self.dataObject setValue:[change objectForKey:NSKeyValueChangeNewKey] forKey:self.dataProperty];
            [self.dataObject setModified];
        }
    }
}

+ (DRTextField *) instance:(CGRect)frame data:(NSObject *)object prop:(NSString *)prop {
    DRTextField * result = [[DRTextField alloc] initWithFrame:frame];
    result.dataObject = object;
    result.dataProperty = prop;
    return result;
}

@end


DRTextField * _createTextField(CGFloat p_x, CGFloat p_y, CGFloat s_w, CGFloat s_h) {
    DRTextField * result = [[DRTextField alloc] initWithFrame:CGRectMake(p_x, p_y, s_w, s_h)];
    
    // [cell.contentView addSubview:result];
    return result;
}

DRTextField * createCenterTextField(UITableViewCell * cell) {
    return  _createTextField(15, 11, 270, HEIGHT(cell.bounds) - 2 * 10);
}

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

void setupTextField(DRTextField * textField, NSIndexPath * indexPath, NSObject * modelObject, NSString * modelProp, NSString * textPlaceHolder, UIKeyboardType keyboardType, id delegate) {
    textField.font = TCFont_HNLTComLt(_TV_FIELD_FONTSIZE);
    textField.placeholder = textPlaceHolder;
    textField.dataObject = modelObject;
    textField.dataProperty = modelProp;
    textField.keyboardType = keyboardType;
    textField.tag = calculateTag(indexPath);
    textField.returnKeyType = UIReturnKeyNext;
    textField.delegate = delegate;
    
}

void customizeSingleTextCell(UITableViewCell * cell, NSIndexPath * indexPath, NSObject * modelObject, NSString * modelProp, NSString * textPlaceHolder, UIKeyboardType keyboardType, id delegate) {
    DRTextField * field = createCenterTextField(cell);
    setupTextField(field, indexPath, modelObject, modelProp, textPlaceHolder, keyboardType, delegate);
    [cell.contentView addSubview:field];
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
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _TV_ROW_HEIGHT;
}

//- (UITextField *)createTextField:(UITableViewCell *)cell {
//    CGFloat p_x = 15;
//    CGFloat p_y = 11;
//    CGRect textFrame = CGRectMake(p_x, p_y, 270, HEIGHT(cell.bounds) - 2 * 10);
//    UITextField * result = [[DRTextField alloc] initWithFrame:textFrame]; // [[UITextField alloc] initWithFrame:textFrame];
//    // result.borderStyle = UITextBorderStyleLine;
//    result.font = TCFont_HNLTComLt(14);
//    result.placeholder = @"123";
//    // result.text = @"123";
//    [cell.contentView addSubview:result];
//    return result;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                customizeSingleTextCell(cell, indexPath, self.customer, @"storeName", [self localString:@"storeName"], UIKeyboardTypeDefault, self);
                break;
            case 1:
                 customizeSingleTextCell(cell, indexPath, self.customer, @"streetName", [self localString:@"streetName"], UIKeyboardTypeDefault, self);
                break;
            default:
                break;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@_%@_%i", self.customer.storeName, self.customer.streetName, [self.customer isModified]);
}

@end
