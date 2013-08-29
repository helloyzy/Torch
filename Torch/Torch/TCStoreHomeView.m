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


#define ROW_HEIGHT_MAX 110
#define ROW_HEIGHT 40
#define ROW_HEIGHT_MIN 35
#define SECTION_TITLE_HEIGHT 25
#define FONT_SIZE 12.0f

static NSString *kTitleKey = @"title";
static NSString *kExplainKey = @"explanation";
static NSString *kViewControllerKey = @"viewController";

@interface TCStoreHomeView ()

@property (nonatomic, strong) NSMutableArray *menuList;
@property (nonatomic, strong) UIButton *btnDirection;
@property (nonatomic, strong) UIButton *btnNovisit;
@end

@implementation TCStoreHomeView



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
    self.menuList = [NSMutableArray array];
	
	// object in the menu
	TCPriorityViewController *tcPriorityViewController =
    [[TCPriorityViewController alloc] initWithNibName:@"TCPriorityViewController" bundle:nil];
	[self.menuList addObject:@{ kTitleKey:@"Prioridades",
                 kExplainKey:@"go to priorities page",
          kViewControllerKey:tcPriorityViewController } ];
    TCInventoryViewController *tcInventoryViewController =
    [[TCInventoryViewController alloc] initWithNibName:@"TCInventoryViewController" bundle:nil];
	[self.menuList addObject:@{ kTitleKey:@"Hacer un Inventario",
                 kExplainKey:@"go to inventory page",
          kViewControllerKey:tcInventoryViewController } ];

	[self.menuList addObject:@{ kTitleKey:@"Hacer un Inventario",
                 kExplainKey:@"go to inventory page",
          kViewControllerKey:tcInventoryViewController } ];


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
        return SECTION_TITLE_HEIGHT ;
    }else return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return ROW_HEIGHT_MAX;
        
    } else if  (indexPath.section == 1)    {
        return ROW_HEIGHT;
    }else {
        return ROW_HEIGHT_MIN;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
    if (section == 0) {
        return 1;

    } else if  (section == 1)    {
        return 2;
    }else {
        return [self.menuList count];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width-5, tableView.sectionHeaderHeight)];
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divide.png"]];
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.bounds.size.width-100, 20)];
    if (section == 0) {

        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = @"Store Name";
        headerImage.frame = CGRectMake(8, 20, tableView.bounds.size.width-14, 2);
        headerLbl.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
        headerLbl.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
        [headerView addSubview:headerLbl];
        [headerView addSubview:headerImage];

    
    }else if (section==1){
        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = @"Contractors";
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
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 35)];

    if (section == 2) {
		UIImage *buttonBackground = [UIImage imageNamed:@"bluebutton.png"];
		UIImage *buttonBackgroundPressed = [UIImage imageNamed:@"bluebtn_pressed.png"];
		
		CGRect frame = CGRectMake(10, 5, 300, 30);
		
		_btnNovisit = [TCStoreHomeView newButtonWithTitle:@"No Pude Visitar Este Cliente"
                                                     target:self
                                                   selector:@selector(notAbleVisit:)
                                                      frame:frame
                                                      image:buttonBackground
                                               imagePressed:buttonBackgroundPressed];
        [footerView  addSubview:_btnNovisit];

        
    }else{
        footerView = nil;
    }
    
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (indexPath.section ==0) {
        if (cell == nil) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, 320, ROW_HEIGHT_MAX)];
        UITextView *txtStoreDetail = [[UITextView alloc] initWithFrame:CGRectMake(-10,0,190,ROW_HEIGHT_MAX-10)];
        txtStoreDetail.text = @"You can add some more details..ut store details here..ddddddddddddddddd..sfasadfsd what a funny dayasdfsfsfsfsdfsfsfsfsdf come on test";
        [txtStoreDetail setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:14]];
        txtStoreDetail.textColor = [UIColor darkTextColor];
        txtStoreDetail.editable = NO;

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UIImageView *mapImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapwithhint.png"]];
        mapImage.frame = CGRectMake(240, 2, 50, 70);

        UILabel *lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(15,5,20,25)];
        lblNumber.text = @"#3";
        lblNumber.textColor = [UIColor whiteColor];
        lblNumber.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
        lblNumber.backgroundColor =[UIColor clearColor];
        [mapImage addSubview:lblNumber];
		UIImage *buttonBackground = [UIImage imageNamed:@"directionbtn.png"];
		UIImage *buttonBackgroundPressed = [UIImage imageNamed:@"directionbtn_pressed.png"];
		
		CGRect frame = CGRectMake(180, 80, 125, 25);
		
		_btnDirection = [TCStoreHomeView newButtonWithTitle:@"Instrucciones"
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
        
       
    }else if (indexPath.section ==1){
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UITextField *_txtName=[[UITextField alloc]initWithFrame:CGRectMake(8.0, 0.0, 150.0, ROW_HEIGHT/2)];
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, 320, ROW_HEIGHT)];
        [_txtName setPlaceholder:@"Join Type Data Here........"];
        _txtName.enabled = NO;
        _txtName.textAlignment = NSTextAlignmentLeft;
        _txtName.font =  [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:14];
        UITextField *_txtTitle=[[UITextField alloc]initWithFrame:CGRectMake(8.0, (ROW_HEIGHT/2)+2, 150.0, ROW_HEIGHT/2)];
        [_txtTitle setPlaceholder:@"join Type Data Here........"];
        _txtTitle.font =  [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:12];
        _txtTitle.enabled = NO;
        _txtTitle.textAlignment = NSTextAlignmentLeft;
        UITextField *_txtPhone=[[UITextField alloc]initWithFrame:CGRectMake(160.0, 2.0, 150.0, ROW_HEIGHT/2)];
        [_txtPhone setPlaceholder:@"820-734-8976"];
        _txtPhone.font =  [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:14];
        _txtPhone.textAlignment = NSTextAlignmentRight;
        _txtPhone.enabled=NO;
        cell.backgroundView = backgroundView;
        [cell addSubview:_txtName];
        [cell addSubview:_txtTitle];
        [cell addSubview:_txtPhone];
        //cell.contentView.layer.borderColor = [[UIColor redColor] CGColor];
        //cell.contentView.layer.borderWidth = 2;


	}
	
    }else {
        // If no cell is available, create a new one using the given identifier.
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
            cell.textLabel.textColor = [UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
            cell.detailTextLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kExplainKey];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
        
    }

	return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
       UIViewController *targetViewController = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kViewControllerKey];
    switch (indexPath.section) {
        case 0:
            break;
        case 1:
            break;  
        default:
            [[self navigationController] pushViewController:targetViewController animated:YES];
            break;
    }	}
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
     button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:15];
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
    NSLog(@"UIButton was clicked");

    //UIViewController *targetViewController = [[TCDirectionViewController alloc]init];
	//[[self navigationController] pushViewController:targetViewController animated:YES];
}
- (void) notAbleVisit:(id)sender
{
    NSLog(@"UIButton was clicked");
    
    UIViewController *targetViewController = [[TCStoreHomeView alloc]init];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark - Lazy creation of buttons


@end
