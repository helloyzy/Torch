//
//  TCStoreHomeView.m
//  Torch
//
//  Created by xu cheng on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCStoreHomeView.h"
#import <QuartzCore/QuartzCore.h>
#import "TCPriorityViewController.h"
#import "TCInventoryViewController.h"
#import "TCOrderViewController.h"
#import "TCSummaryViewController.h"
#import "TCSurveyController.h"
#import "TCSurveyListController.h"
#import "TCStoreNoVisit.h"
#import "Contact.h"
#import "TCAddNewCustomerVwCtl.h"
#import "TCSysRes.h"
#import "Store.h"
#import "StoreCall.h"
#import "Survey.h"
#import <InnerBand.h>
#import "TCUtils.h"
#import <IBFunctions.h>

#define ROW_HEIGHT_MAX 110
#define ROW_HEIGHT 40
#define ROW_HEIGHT_SECTION2 40
#define ROW_HEIGHT_MIN 50
#define SECTION_TITLE_HEIGHT 25
#define FONT_SIZE 12.0f

#define TAG_SECTION2_NAME 101
#define TAG_SECTION2_TITLE 102
#define TAG_SECTION2_PHONE 103

static NSString *kTitleKey = @"title";
static NSString *kExplainKey = @"explanation";
static NSString *kViewControllerKey = @"viewController";

@interface TCStoreHomeView () <UIAlertViewDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *menuList;
@property (nonatomic, strong) UIButton *btnDirection;
@property (nonatomic, strong) UIButton *btnNovisit;
@property (nonatomic, strong) TCSliderView *tcSliderView;
@end

@implementation TCStoreHomeView {
    NSArray *contacts;
}



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
    UIImageView *topView  =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,72)];
    topView.image = [UIImage imageNamed:@"slideback.png"];
    [self.view addSubview:topView];
   
    _tcSliderView = [[TCSliderView alloc] initWithFrame:CGRectMake(10,14,300,50)];
    _tcSliderView.delegate = self;
    [topView addSubview:_tcSliderView];
    topView.userInteractionEnabled = YES;
  
    self.menuList = [NSMutableArray array];
	
	// object in the menu
	TCPriorityViewController *tcPriorityViewController =
    [[TCPriorityViewController alloc] initWithNibName:@"TCPriorityViewController" bundle:nil];
    tcPriorityViewController.currentStore = self.currentStore;
	[self.menuList addObject:@{ kTitleKey:[self localString:@"storehome.menu.priority"],
                 kExplainKey:@"go to priorities page",
          kViewControllerKey:tcPriorityViewController } ];
    TCInventoryViewController *tcInventoryViewController =
    [[TCInventoryViewController alloc] initWithNibName:@"TCInventoryViewController" bundle:nil];
	[self.menuList addObject:@{ kTitleKey:[self localString:@"storehome.menu.takeInventory"],
                 kExplainKey:@"go to inventory page",
          kViewControllerKey:tcInventoryViewController } ];
    TCOrderViewController *tcOrderViewController =
    [[TCOrderViewController alloc] initWithNibName:@"TCOrderViewController" bundle:nil];
    tcOrderViewController.currentStore = self.currentStore;
	[self.menuList addObject:@{ kTitleKey:[self localString:@"storehome.menu.createOrder"],
                 kExplainKey:@"create order",
          kViewControllerKey:tcOrderViewController } ];
    TCSurveyListController *surveyList = [[TCSurveyListController alloc] initWithNibName:@"TCStoreHomeView" bundle:nil];
    surveyList.store = self.currentStore;
	[self.menuList addObject:@{ kTitleKey:[self localString:@"storehome.menu.survey"],
                 kExplainKey:@"Order History",
          kViewControllerKey:surveyList } ];

    TCSummaryViewController *tcSummaryViewController =
    [[TCSummaryViewController alloc] initWithNibName:@"TCSummaryViewController" bundle:nil];
    tcSummaryViewController.store = self.currentStore;
	[self.menuList addObject:@{ kTitleKey:[self localString:@"storehome.menu.notes"],
                 kExplainKey:@"Visit summary and notes",
          kViewControllerKey:tcSummaryViewController } ];
    
    

}

- (void)viewWillAppear:(BOOL)animated {
    // check whether has storeCall in progress
    if ([self.currentStore callInProgress]) {
        _tcSliderView.direction = TCSliderViewDirectionBackward;
    }
    contacts = [self.currentStore.contacts allObjects];
    [self.tableView reloadData];
}

-(void)goEditCustomer {
    TCAddNewCustomerVwCtl *targetViewController = [[TCAddNewCustomerVwCtl  alloc] init];
    targetViewController.store = self.currentStore;
      [[self navigationController] pushViewController:targetViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// There is only one section.
	return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
    return 0 ;
    }else return SECTION_TITLE_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==2) {
        return 80 ;
    }else return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return ROW_HEIGHT_MAX;
        
    } else if  (indexPath.section == 1)    {
        return ROW_HEIGHT;
    } else if (indexPath.section == 2){
        return ROW_HEIGHT_SECTION2;
    } else {
        return ROW_HEIGHT_MIN;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
    if (section == 0) {
        return 1;

    } else if  (section == 1)    {
        return [contacts count];
    }else {
        return [self.menuList count];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width-5, tableView.sectionHeaderHeight)];
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divide.png"]];
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.bounds.size.width-100, 25)];
    if (section == 0) {
        
        UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 0, 17, 17)];
        [editButton setBackgroundImage:[UIImage imageNamed:@"focus"] forState:UIControlStateNormal];
        
        [editButton addTarget:self action:@selector(goEditCustomer) forControlEvents:UIControlEventTouchDown];
        editButton.enabled = [self isCallInProgress];
        
        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = self.currentStore.name;
        headerLbl.adjustsLetterSpacingToFitWidth = YES;
        headerLbl.adjustsFontSizeToFitWidth = YES;
        headerLbl.minimumScaleFactor = 0.5;
        headerImage.frame = CGRectMake(8, 20, tableView.bounds.size.width-14, 2);
        headerLbl.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
        headerLbl.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
        [headerView addSubview:headerLbl];
        [headerView addSubview:headerImage];
        [headerView addSubview:editButton];

    
    }else if (section==1){
        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = [self localString:@"storehome.contactors"];
        headerImage.frame = CGRectMake(8, 20, tableView.bounds.size.width-14, 2);
        headerLbl.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
        headerLbl.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
        [headerView addSubview:headerLbl];
        [headerView addSubview:headerImage];
        
    }else{
        headerView = nil;
    }
    
    return headerView;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * result = nil;
    if (section == 2) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 55)];
		UIImage *buttonBackground = [UIImage imageNamed:@"bluebutton.png"];
		UIImage *buttonBackgroundPressed = [UIImage imageNamed:@"bluebtn_pressed.png"];
		
		CGRect frame = CGRectMake(10, 20, 300, 35);
		
		_btnNovisit = [TCStoreHomeView newButtonWithTitle:[self localString:@"storehome.button.novisit"]
                                                     target:self
                                                   selector:@selector(notAbleVisit:)
                                                      frame:frame
                                                      image:buttonBackground
                                               imagePressed:buttonBackgroundPressed];
        _btnNovisit.enabled = [self isCallInProgress];
        [footerView  addSubview:_btnNovisit];
        result = footerView;
    }
    return result;
}

- (NSString *)getContactorName:(NSInteger)index {
    Contact *contactor = [contacts objectAtIndex:index];
    
    return [NSString stringWithFormat:@"%@ %@", contactor.firstName, contactor.lastName];
}

- (NSString *)getContactorTitle:(NSInteger)index {
    Contact *contactor = [contacts objectAtIndex:index];
    
    return [NSString stringWithFormat:@"%@", contactor.title];
}

- (NSString *)getContactorPhone:(NSInteger)index {
    Contact *contactor = [contacts objectAtIndex:index];
    
    return [NSString stringWithFormat:@"%@", contactor.phoneNumber];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell;
    BOOL isCallInProgress = [self isCallInProgress];
    if (indexPath.section ==0) {
        static NSString *storeHomeSec1Identifier = @"storeHomeSection1";
        cell = [tableView dequeueReusableCellWithIdentifier:storeHomeSec1Identifier];
        if (cell == nil) {
            UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, 320, ROW_HEIGHT_MAX)];
            UITextView *txtStoreDetail = [[UITextView alloc] initWithFrame:CGRectMake(-5,0,190,ROW_HEIGHT_MAX-10)];
            txtStoreDetail.text = [NSString stringWithFormat:@"%@\n%@ , %@ %@", self.currentStore.address, self.currentStore.city, self.currentStore.country, self.currentStore.postalCode];
            [txtStoreDetail setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:14]];
            txtStoreDetail.textColor = [UIColor colorWithRed:0.478 green:0.478 blue:0.478 alpha:1];
            txtStoreDetail.editable = NO;

            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:storeHomeSec1Identifier];
            UIImageView *mapImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapwithhint.png"]];
            mapImage.frame = CGRectMake(225, 2, 50, 70);

            UILabel *lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(15,5,30,25)];
            lblNumber.text = self.currentIndex;
            lblNumber.textColor = [UIColor whiteColor];
            lblNumber.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:14];
            lblNumber.backgroundColor =[UIColor clearColor];
            [lblNumber setTextAlignment:NSTextAlignmentLeft];
            [mapImage addSubview:lblNumber];
            UIImage *buttonBackground = [UIImage imageNamed:@"directionbtn.png"];
            UIImage *buttonBackgroundPressed = [UIImage imageNamed:@"directionbtn_pressed.png"];
            
            CGRect frame = CGRectMake(205, 80, 100, 25);
            
            _btnDirection = [TCStoreHomeView newButtonWithTitle:[self localString:@"storehome.button.instructions"]
                                                             target:self
                                                           selector:@selector(viewDirection:)
                                                              frame:frame
                                                              image:buttonBackground
                                                       imagePressed:buttonBackgroundPressed];


            [cell.contentView addSubview:mapImage];
            [cell.contentView addSubview:txtStoreDetail];
            [cell.contentView addSubview:_btnDirection];

            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundView = backgroundView;
        }
    } else if (indexPath.section ==1) { // contact section
        static NSString *storeHomeSec2Identifier = @"CONTACT_SECTION";
        cell = [tableView dequeueReusableCellWithIdentifier:storeHomeSec2Identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:storeHomeSec2Identifier];
            UITextField *_txtName=[[UITextField alloc]initWithFrame:CGRectMake(14.0, 4.0, 150.0, ROW_HEIGHT/2)];
            UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, 320, ROW_HEIGHT)];
            // [_txtName setPlaceholder:[self getContactorName:indexPath.row]];
            _txtName.enabled = NO;
            _txtName.textAlignment = NSTextAlignmentLeft;
            _txtName.font =  [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:15];
            _txtName.tag = TAG_SECTION2_NAME;
            UITextField *_txtTitle=[[UITextField alloc]initWithFrame:CGRectMake(14.0, (ROW_HEIGHT/2)+2, 150.0, ROW_HEIGHT/2)];
            // [_txtTitle setPlaceholder:[self getContactorTitle:indexPath.row]];
            _txtTitle.font =  [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:12];
            _txtTitle.enabled = NO;
            _txtTitle.textAlignment = NSTextAlignmentLeft;
            _txtTitle.tag = TAG_SECTION2_TITLE;
            UILabel *_lblPhone = [[UILabel alloc]initWithFrame:CGRectMake(160.0, 2.0, 130.0, ROW_HEIGHT/2)];
            _lblPhone.font =  TCFont_HNLTComLt(14);
            _lblPhone.textAlignment = NSTextAlignmentRight;
            _lblPhone.tag = TAG_SECTION2_PHONE;
            _lblPhone.textColor = [UIColor blackColor];
            [self setupClickRecognizerForView:_lblPhone action:@selector(tapContactPhone:)];
            cell.backgroundView = backgroundView;
            [cell addSubview:_txtName];
            [cell addSubview:_txtTitle];
            [cell addSubview:_lblPhone];
            cell.selectionStyle = UITableViewCellEditingStyleNone;
        }
        UITextField *nameField = (UITextField *)[cell viewWithTag:TAG_SECTION2_NAME];
        nameField.placeholder = [self getContactorName:indexPath.row];
        UITextField *titleField = (UITextField *)[cell viewWithTag:TAG_SECTION2_TITLE];
        titleField.placeholder = [self getContactorTitle:indexPath.row];
        UILabel *phoneField = (UILabel *)[cell viewWithTag:TAG_SECTION2_PHONE];
        NSString *phone = [self getContactorPhone:indexPath.row];
        phoneField.text = phone;
//        if (isCallInProgress) {
//            phoneField.textColor = [UIColor lightGrayColor];
//            phoneField.attributedText = [[NSAttributedString alloc]initWithString:phone attributes:nil];
//        } else {
//            phoneField.textColor = [UIColor blueColor];
//            TCLbl_TextUnderline(phoneField, phone);
//        }
//        phoneField.userInteractionEnabled = ! isCallInProgress;
    } else {
        // If no cell is available, create a new one using the given identifier.
        static NSString *storeHomeSec3Identifier = @"storeHomeSection3";
        cell = [tableView dequeueReusableCellWithIdentifier:storeHomeSec3Identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:storeHomeSec3Identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            // cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
            cell.textLabel.font = TCFont_HNLTComBd(17.0);
            // cell.detailTextLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kExplainKey];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
        cell.textLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
        if (isCallInProgress) {
            cell.textLabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
        } else {
            cell.textLabel.textColor = [UIColor lightGrayColor];
        }
        cell.userInteractionEnabled = isCallInProgress;
    }
	return cell;
}

- (void)setupClickRecognizerForView:(UIView *)view action:(SEL)action{
    UITapGestureRecognizer * clickRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [clickRecognizer setNumberOfTapsRequired:1];
    [clickRecognizer setNumberOfTouchesRequired:1];
    clickRecognizer.cancelsTouchesInView = YES;
    [view setUserInteractionEnabled:YES];
    [view addGestureRecognizer:clickRecognizer];
}

- (void)tapContactPhone:(id)sender {
    // start call
    UITapGestureRecognizer *tapRecognizer = (UITapGestureRecognizer *)sender;
    UILabel *phoneLbl = (UILabel *)tapRecognizer.view;
    NSString *phoneCall = [NSString stringWithFormat:@"telprompt://%@", phoneLbl.text];
    // NSLog(@"calling %@", phoneCall);
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:phoneCall]];
    // [self dialPhoneNumber:phoneLbl.text];
}

//- (void) dialPhoneNumber:(NSString *)aPhoneNumber {
//    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",aPhoneNumber]];
//    UIWebView * phoneCallWebView;
//    if (! phoneCallWebView ) {
//        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
//    }
//    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // NSLog(@"UIButton was selected");
    switch (indexPath.section) {
        case 0:
            break;
        case 1:
            break;
        case 2: {
            if ([self isCallInProgress]) {
                UIViewController *targetViewController = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kViewControllerKey];
                [[self navigationController] pushViewController:targetViewController animated:YES];
            }
            break;
        }
        default:
            break;
    }
}

+ (UIButton *)newButtonWithTitle:(NSString *)title
                          target:(id)target
                        selector:(SEL)selector
                           frame:(CGRect)frame
                           image:(UIImage *)image
                    imagePressed:(UIImage *)imagePressed
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title  forState:UIControlStateNormal];

    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
     button.titleLabel.textAlignment = NSTextAlignmentLeft;
    [button setTitleEdgeInsets:UIEdgeInsetsMake(6.0, 0, 0, 0)];

	
	//UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:image forState:UIControlStateNormal];
	
	//UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	//[button setBackgroundImage:imagePressed forState:UIControlStateHighlighted];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
    
	return button;
}

- (void)viewDirection:(id)sender
{
    NSLog(@"DirectionButton was clicked");


}
- (void) notAbleVisit:(id)sender
{
    UIViewController *targetViewController = [[TCStoreNoVisit alloc]init];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [StoreCall newInstance:self.currentStore];
    self.currentStore.sequenceNum = self.currentIndex;
    setStoreInCall(self.currentStore);
    if (buttonIndex == 1) { // jump to priority view
        TCPriorityViewController *targetViewController = [[TCPriorityViewController alloc]init];
        targetViewController.currentStore = self.currentStore;
        [[self navigationController] pushViewController:targetViewController animated:YES];
    } else { // just change direction
        [_tcSliderView changeDirection:YES];
    }
}

- (BOOL)isCallInProgress {
    return [self.currentStore callInProgress] != nil;
}


- (void) sliderDidSlideToEnd:(TCSliderView *)slideView {
    // check whether already have a store in call
    if (storeInCall()) {
        showAlert(nil, [self localString:@"storeInCall.alert"], nil);
        [_tcSliderView changeDirection:NO];
        return;
    }
    
    // open a alert with an OK and cancel button
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[self localString:@"store.startcall.title"]
                                                    message:[self localString:@"store.startcall.text"]
                                                   delegate:self
                                          cancelButtonTitle:[self localString:@"Cancel"]
                                          otherButtonTitles:[self localString:@"OK"],nil];
	[alert show];
}
- (void) sliderDidSlideToStart:(TCSliderView *)slideView {
    StoreCall *call = [self.currentStore callInProgress];
    [call endCall];
    setStoreInCall(nil);
    // Go to summary page
    UIViewController *targetViewController = [[TCSummaryViewController alloc]init];
    [[self navigationController] pushViewController:targetViewController animated:YES];
    [_tcSliderView changeDirection:YES];
}



@end
