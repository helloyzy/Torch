//
//  TCMyDayController.m
//  Torch
//
//  Created by Yuan Mai on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCMyDayController.h"
#import <QuartzCore/QuartzCore.h>

@interface TCMyDayController ()

@end

@implementation TCMyDayController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyDayCell"];
    static NSString *CellIdentifier = @"MyDayCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell.tag != 999) {
        cell.tag = 999;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UILabel *storeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 280.0, 21.0)];
        storeLabel.adjustsFontSizeToFitWidth = NO;
        storeLabel.alpha = 1.000;
        storeLabel.autoresizesSubviews = YES;
        storeLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        storeLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        storeLabel.clearsContextBeforeDrawing = YES;
        storeLabel.clipsToBounds = YES;
        storeLabel.contentMode = UIViewContentModeLeft;
        storeLabel.numberOfLines = 1;
        storeLabel.opaque = NO;
        storeLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        storeLabel.text = @"Store Name Here";
        storeLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];
        storeLabel.userInteractionEnabled = NO;
        
        UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 20.0, 320.0, 548.0)];
        cellView.alpha = 1.000;
        cellView.autoresizesSubviews = YES;
        cellView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        cellView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];
        cellView.clearsContextBeforeDrawing = YES;
        cellView.clipsToBounds = NO;
        cellView.contentMode = UIViewContentModeScaleToFill;
        cellView.multipleTouchEnabled = NO;
        cellView.opaque = YES;
        cellView.userInteractionEnabled = YES;
        
       /* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        */
        UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 30.0, 209.0, 63.0)];
        addressLabel.adjustsFontSizeToFitWidth = NO;
        addressLabel.alpha = 1.000;
        addressLabel.autoresizesSubviews = YES;
        addressLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        addressLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        addressLabel.clearsContextBeforeDrawing = YES;
        addressLabel.clipsToBounds = YES;
        addressLabel.contentMode = UIViewContentModeLeft;
        addressLabel.multipleTouchEnabled = NO;
        addressLabel.numberOfLines = 3;
        addressLabel.opaque = NO;
        addressLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        addressLabel.tag = 0;
        addressLabel.text = @"Line1\nLine2\nLine3";
        addressLabel.textColor = [UIColor colorWithWhite:0.667 alpha:1.000];
        addressLabel.userInteractionEnabled = NO;
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(237.0, 70.0, 19.0, 21.0)];
        numberLabel.adjustsFontSizeToFitWidth = NO;
        numberLabel.alpha = 1.000;
        numberLabel.backgroundColor = [UIColor colorWithRed:0.231 green:0.431 blue:0.627 alpha:1.000];
        numberLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        numberLabel.clearsContextBeforeDrawing = YES;
        numberLabel.clipsToBounds = YES;
        numberLabel.contentMode = UIViewContentModeCenter;
        numberLabel.frame = CGRectMake(237.0, 30.0, 40.0, 33.0);
        numberLabel.numberOfLines = 1;
        numberLabel.opaque = NO;
        numberLabel.textAlignment = NSTextAlignmentCenter;
        numberLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        numberLabel.textColor = [UIColor whiteColor];
        numberLabel.tag = 0;
        numberLabel.text = @"#1";
        numberLabel.userInteractionEnabled = NO;
        numberLabel.layer.cornerRadius = 3;
        
        [cell addSubview:storeLabel];
        [cell addSubview:addressLabel];
        [cell addSubview:numberLabel];

    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 93;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
