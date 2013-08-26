//
//  TCStoreHomeView.m
//  Torch
//
//  Created by xu cheng on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCStoreHomeView.h"

@interface TCStoreHomeView ()

@end

@implementation TCStoreHomeView

@synthesize displayList;


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
    displayList = @[@"Priorities",@"Take Inventory",@"Create Order",@"Order History",@"Call History",@"Notes"];
    tvItemList.scrollEnabled = NO;
// Do any additional setup after loading the view from its nib.
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
        
        return [displayList count];

    } else         // second section
        return [displayList count];

    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// The header for the section is the region name -- get this from the region at the section index.
    if (section == 0) {
        // first section
        
        return @"Contacts";
        
    } else         // second section
        return @"To Do List";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	// Try to retrieve from the table view a now-unused cell with the given identifier.
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	// If no cell is available, create a new one using the given identifier.
	if (cell == nil) {
		// Use the default cell style.
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
	}
	
	// Set up the cell.
	NSString *itemName = [displayList objectAtIndex:indexPath.row];
	cell.textLabel.text = itemName;
	
	return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*
	 To conform to the Human Interface Guidelines, selections should not be persistent --
	 deselect the row after it has been selected.
	 */
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
