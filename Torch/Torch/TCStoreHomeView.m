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

#define ROW_HEIGHT 40

@interface TCStoreHomeView ()

@end

@implementation TCStoreHomeView

@synthesize tvItemList = _tvItemList;
@synthesize shadow = _shadow;
@synthesize txtStoreName = _txtStoreName;
@synthesize txtStoreDetail = _txtStoreDetail;
@synthesize displayList =_displayList;
@synthesize lblStoreNumber = _lblStoreNumber;


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
    _displayList = @[@"Priorities",@"Take Inventory",@"Create Order",@"Order History",@"Call History",@"Notes"];
    _tvItemList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
_tvItemList.rowHeight = ROW_HEIGHT;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// There is only one section.
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
    if (section == 0) {
        // first section
        
        return 2;

    } else         // second section
        return [_displayList count];

    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// The header for the section is the region name -- get this from the region at the section index.
    if (section == 0) {
        // first section
        
        return @"Contactors";
        
    } else         // second section
        return @"To Do List";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];

	
	// Try to retrieve from the table view a now-unused cell with the given identifier.
	if (indexPath.section ==0){
	
	// If no cell is available, create a new one using the given identifier.
	if (cell == nil) {
		// Use the default cell style.
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UITextField *_txtName=[[UITextField alloc]initWithFrame:CGRectMake(2.0, 2.0, 100.0, ROW_HEIGHT/2)];
        [_txtName setPlaceholder:@"Type Data Here"];
        _txtName.enabled = NO;
        _txtName.font = [UIFont systemFontOfSize:12.0f];
        UITextField *_txtTitle=[[UITextField alloc]initWithFrame:CGRectMake(2.0, 20.0, 100.0, ROW_HEIGHT/2)];
        [_txtTitle setPlaceholder:@"Type Data Here"];
        _txtTitle.font = [UIFont systemFontOfSize:10.0f];

        UITextField *_txtPhone=[[UITextField alloc]initWithFrame:CGRectMake(102.0, 2.0, 120.0, ROW_HEIGHT/2)];
        [_txtPhone setPlaceholder:@"Type Data Here"];
        _txtPhone.font = [UIFont systemFontOfSize:12.0f];

        cell.accessoryType = UITableViewCellAccessoryNone;

        [cell addSubview:_txtName];
        [cell addSubview:_txtTitle];
        [cell addSubview:_txtPhone];

	}
	
    }else {

        
        // If no cell is available, create a new one using the given identifier.
        if (cell == nil) {
            // Use the default cell style.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
            
        }
        NSString *itemName = [_displayList objectAtIndex:indexPath.row];
        cell.textLabel.text = itemName;
        
    }
  

    

	return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*
	 To conform to the Human Interface Guidelines, selections should not be persistent --
	 deselect the row after it has been selected.
	 */
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)jump:(id)sender {
    [self.navigationController pushViewController:[[TCPriorityViewController alloc] init] animated:YES];
}
@end
