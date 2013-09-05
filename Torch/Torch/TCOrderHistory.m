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
#import "TCOrderObject.h"

@interface TCOrderHistory ()

@end

@implementation TCOrderHistory
{
    NSMutableDictionary *orderList;
    NSMutableArray *displayData;
}

-(NSDate *)convertStringToDate:(NSString *)dateString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    NSDate *date = [dateFormat dateFromString:dateString];
    return date;
}

-(NSString *)convertDateToString:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

-(void)populateOrderList {
    if (!orderList) {
        orderList = [[NSMutableDictionary alloc] init];
    }
    
    
    TCOrderObject *order1 = [[TCOrderObject alloc] init];
    order1.orderID = @"#46735533";
    order1.orderAmount = @"$475.3";
    order1.orderDate = [self convertStringToDate:@"20120730"];
    order1.storeName = @"Bohu's Store";
    order1.orderStatus = @"Pending";
    [orderList setObject:order1 forKey:order1.orderID];
    
    TCOrderObject *order2 = [[TCOrderObject alloc] init];
    order2.orderID = @"#46735596";
    order2.orderAmount = @"$12.3";
    order2.orderDate = [self convertStringToDate:@"20130815"];
    order2.storeName = @"Daivd Store";
    order2.orderStatus = @"Delivered";
    [orderList setObject:order2 forKey:order2.orderID];
    
    
}

-(void)generateDisplayData {
    displayData = [[NSMutableArray alloc] init];
    for (id key in orderList) {
        TCOrderObject *order = (TCOrderObject *)[orderList objectForKey:key];
        [displayData addObject:order.orderID];
    }
}

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
    self.lblHistory.text = [self localString:@"orderHistory.title"];
    self.lblHistory.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
    self.lblHistory.font =[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:15];
    
    [self populateOrderList];
    [self generateDisplayData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
	// Number of sections is the number of regions
	return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return [displayData count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)populateCell:(TCOrderStatusCell *)cell withKeyName:(NSString *)keyName {
    TCOrderObject *orderItem = [orderList objectForKey:keyName];
    if(orderItem) {
        cell.orderID.text = orderItem.orderID;
        cell.orderAmount.text = orderItem.orderAmount;
        cell.orderDate.text = [self convertDateToString:orderItem.orderDate];
        cell.orderStatusLabel.text = [self localString:@"orderhistory.statusLabel"];
        cell.orderStatus.text = orderItem.orderStatus;
        
        if([orderItem.orderStatus caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            cell.orderStatus.textColor = [UIColor blueColor];
        }else if ([orderItem.orderStatus caseInsensitiveCompare:@"delivered"] == NSOrderedSame) {
            cell.orderStatus.textColor = [UIColor greenColor];
        }
    
    }
    
    return cell;
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
    NSString *itemKey = [displayData objectAtIndex:indexPath.row];
    [self populateCell:cell withKeyName:itemKey];
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
