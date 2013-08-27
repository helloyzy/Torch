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

#define ROW_HEIGHT_MAX 80
#define ROW_HEIGHT 30
#define ROW_HEIGHT_MIN 20
#define SECTION_TITLE_HEIGHT 25
#define FONT_SIZE 12.0f

static NSString *kTitleKey = @"title";
static NSString *kExplainKey = @"explanation";
static NSString *kViewControllerKey = @"viewController";

@interface TCStoreHomeView ()

@property (nonatomic, strong) NSMutableArray *menuList;

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
    self.tableView.backgroundColor= [UIColor clearColor];
    

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
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 290, 20)];
    if (section == 0) {

        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = @"Store Name";
        headerImage.frame = CGRectMake(5, 20, 290, 2);
        [headerView addSubview:headerLbl];
        [headerView addSubview:headerImage];

    
    }else if (section==1){
        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = @"Contactors";
        headerImage.frame = CGRectMake(5, 20, 290, 2);
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
// Try to retrieve from the table view a now-unused cell with the given identifier.
    if (indexPath.section ==0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];        
        UIImageView *mapImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapwithhint.png"]];
        mapImage.frame = CGRectMake(240, 2, 50, 70);

        UILabel *lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(15,5,20,20)];
        lblNumber.text = @"#3";
        lblNumber.textColor = [UIColor whiteColor];
        //lblNumber.textAlignment = nste;
        lblNumber.backgroundColor =[UIColor clearColor];
       // mapImage.opaque = YES;
        UITextField *txtStoreDetail = [[UITextField alloc] initWithFrame:CGRectMake(5,0,200,20)];
        txtStoreDetail.text = @"put store details here....";
        [mapImage addSubview:lblNumber];
        [cell.contentView addSubview:mapImage];
        [cell.contentView addSubview:txtStoreDetail];
        //cell.accessoryView =lblNumber;
        
       
    }else if (indexPath.section ==1){
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UITextField *_txtName=[[UITextField alloc]initWithFrame:CGRectMake(12.0, 2.0, 100.0, ROW_HEIGHT/2)];
        [_txtName setPlaceholder:@"Type Data Here"];
        _txtName.enabled = NO;
        _txtName.font = [UIFont systemFontOfSize:FONT_SIZE];
        UITextField *_txtTitle=[[UITextField alloc]initWithFrame:CGRectMake(12.0, 20.0, 100.0, ROW_HEIGHT/2)];
        [_txtTitle setPlaceholder:@"Type Data Here"];
        _txtTitle.font = [UIFont systemFontOfSize:FONT_SIZE];

        UITextField *_txtPhone=[[UITextField alloc]initWithFrame:CGRectMake(110.0, 2.0, 120.0, ROW_HEIGHT/2)];
        [_txtPhone setPlaceholder:@"Type Data Here"];
        _txtPhone.font = [UIFont systemFontOfSize:FONT_SIZE];
        

        cell.accessoryType = UITableViewCellAccessoryNone;

        [cell addSubview:_txtName];
        [cell addSubview:_txtTitle];
        [cell addSubview:_txtPhone];
      
	}
	
    }else {

        
        // If no cell is available, create a new one using the given identifier.
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
            cell.detailTextLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kExplainKey];
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

@end
