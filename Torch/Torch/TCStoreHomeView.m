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

#define ROW_HEIGHT_MAX 100
#define ROW_HEIGHT 40
#define ROW_HEIGHT_MIN 30
#define SECTION_TITLE_HEIGHT 25
#define FONT_SIZE 12.0f

static NSString *kTitleKey = @"title";
static NSString *kExplainKey = @"explanation";
static NSString *kViewControllerKey = @"viewController";

@interface TCStoreHomeView ()

@property (nonatomic, strong) NSMutableArray *menuList;
@property (nonatomic, strong) UIButton *btnDirection;
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
	[self.menuList addObject:@{ kTitleKey:@"Priorities",
                 kExplainKey:@"go to priorities page",
          kViewControllerKey:tcPriorityViewController } ];
    TCInventoryViewController *tcInventoryViewController =
    [[TCInventoryViewController alloc] initWithNibName:@"TCInventoryViewController" bundle:nil];
	[self.menuList addObject:@{ kTitleKey:@"Take Inventory",
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
    return SECTION_TITLE_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return ROW_HEIGHT_MAX;
        
    } else if  (indexPath.section == 1)    {
        return ROW_HEIGHT;
    }else {
        return ROW_HEIGHT_MIN;
    }}
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
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, tableView.bounds.size.width-5, tableView.sectionHeaderHeight)];
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divide.png"]];
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, tableView.bounds.size.width-100, 20)];
    if (section == 0) {

        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = @"Store Name";
        headerImage.frame = CGRectMake(5, 20, tableView.bounds.size.width-10, 2);
        headerLbl.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
        headerLbl.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
        [headerView addSubview:headerLbl];
        [headerView addSubview:headerImage];

    
    }else if (section==1){
        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = @"Contractors";
        headerImage.frame = CGRectMake(5, 20, tableView.bounds.size.width-10, 2);
        headerLbl.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
        headerLbl.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
        [headerView addSubview:headerLbl];
        [headerView addSubview:headerImage];
        
    }else{
        headerView = nil;
    }
    
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (indexPath.section ==0) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, 320, ROW_HEIGHT_MAX)];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UIImageView *mapImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapwithhint.png"]];
        mapImage.frame = CGRectMake(240, 2, 50, 70);

        UILabel *lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(15,5,20,20)];
        lblNumber.text = @"#3";
        lblNumber.textColor = [UIColor whiteColor];
        lblNumber.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14];
        lblNumber.backgroundColor =[UIColor clearColor];
        UITextView *txtStoreDetail = [[UITextView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width-100,ROW_HEIGHT_MAX)];
        //txtStoreDetail.m
        txtStoreDetail.text = @"put store details here..ddddddddddddddddd..sfasadfsd";
        txtStoreDetail.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:14];
        txtStoreDetail.textColor = [UIColor grayColor];
        txtStoreDetail.editable = NO;
        [mapImage addSubview:lblNumber];
		UIImage *buttonBackground = [UIImage imageNamed:@"loginBtn_bg.png"];
		UIImage *buttonBackgroundPressed = [UIImage imageNamed:@"loginBtn_border.png"];
		
		CGRect frame = CGRectMake(200, 80, 100, 30);
		
		_btnDirection = [TCStoreHomeView newButtonWithTitle:@"Directions"
                                                         target:self
                                                       selector:@selector(action:)
                                                          frame:frame
                                                          image:buttonBackground
                                                   imagePressed:buttonBackgroundPressed
                                                  darkTextColor:YES];               
        [cell.contentView addSubview:mapImage];
        [cell.contentView addSubview:txtStoreDetail];
        [cell.contentView addSubview:_btnDirection];
        //[cell setUserInteractionEnabled:NO];
        //_btnDirection.enabled = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundView = backgroundView;
        
       
    }else if (indexPath.section ==1){
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UITextField *_txtName=[[UITextField alloc]initWithFrame:CGRectMake(5.0, 0.0, 150.0, ROW_HEIGHT/2)];
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, 320, ROW_HEIGHT)];
        [_txtName setPlaceholder:@"Join Type Data Here........"];
        _txtName.enabled = NO;
        _txtName.textAlignment = NSTextAlignmentLeft;
        _txtName.font =  [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:14];
        UITextField *_txtTitle=[[UITextField alloc]initWithFrame:CGRectMake(5.0, (ROW_HEIGHT/2)+2, 150.0, ROW_HEIGHT/2)];
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
        [cell setUserInteractionEnabled:NO];

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
	/*
	 To conform to the Human Interface Guidelines, selections should not be persistent --
	 deselect the row after it has been selected.
	 */
	UIViewController *targetViewController = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kViewControllerKey];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}
+ (UIButton *)newButtonWithTitle:(NSString *)title
                          target:(id)target
                        selector:(SEL)selector
                           frame:(CGRect)frame
                           image:(UIImage *)image
                    imagePressed:(UIImage *)imagePressed
                   darkTextColor:(BOOL)darkTextColor
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	// or you can do this:
	//		UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];
	if (darkTextColor)
	{
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	}
	else
	{
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
	
	UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
	
	UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
	
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
    
	return button;
}

- (void)action:(id)sender
{
    UIViewController *targetViewController = [[TCPriorityViewController alloc]init];
	[[self navigationController] pushViewController:targetViewController animated:YES];
    //NSLog(@"UIButton was clicked");
}


#pragma mark - Lazy creation of buttons


@end
