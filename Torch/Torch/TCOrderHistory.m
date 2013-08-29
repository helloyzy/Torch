//
//  TCOrderHistory.m
//  Torch
//
//  Created by xu cheng on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCOrderHistory.h"
#import "TCOrderStatusCell.h"
#import <QuartzCore/QuartzCore.h>
#import "TCOrderDetailView.h"

@interface TCOrderHistory ()

@end

@implementation TCOrderHistory

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
             }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lblStoreName.text = @"Store Name Here";
    self.lblStoreName.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
    self.lblStoreName.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
    self.lblHistory.text = @"Order History";
    self.lblHistory.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
    self.lblHistory.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:15];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
	// Number of sections is the number of regions
	return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *CellIdentifier = @"TCOrderStatusCell";
    
	TCOrderStatusCell *cell = (TCOrderStatusCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *xib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        cell = [xib objectAtIndex:0];
    }
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
	return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*
	 To conform to the Human Interface Guidelines, selections should not be persistent --
	 deselect the row after it has been selected.
	 */
    UIViewController *targetViewController = [[TCOrderDetailView alloc]init];
    [[self navigationController] pushViewController:targetViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
