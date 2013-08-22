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
@synthesize tableView = _tableView;
@synthesize header = _header;
@synthesize shadow = _shadow;


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

    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    CALayer *band = [CALayer layer];
    band.borderWidth = 3;
    band.frame = CGRectMake(0, _header.layer.frame.size.height-2, _header.layer.frame.size.width, 2);
    band.borderColor = [UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1].CGColor;
    [_header.layer addSublayer:band];

    UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, _tableView.bounds.size.width, 10)];
    CAGradientLayer *shadow = [CAGradientLayer layer];
    shadow.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 10);
    shadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    [topShadowView.layer insertSublayer:shadow atIndex:0];
    
    [_tableView.superview addSubview:topShadowView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    NSDateFormatter *gmtFormatter=[[NSDateFormatter alloc] init];
    [gmtFormatter setDateFormat:@"EEEE, MMM dd, YYYY"];

    NSString* str=[[gmtFormatter stringFromDate: [[NSDate alloc] init]] uppercaseString];
    _header.text = str;
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
        UILabel *storeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 10.0, 280.0, 21.0)];
        storeLabel.adjustsFontSizeToFitWidth = NO;
        storeLabel.alpha = 1.000;
        storeLabel.autoresizesSubviews = YES;
        storeLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        storeLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        storeLabel.clearsContextBeforeDrawing = YES;
        storeLabel.clipsToBounds = YES;
        storeLabel.contentMode = UIViewContentModeLeft;
        storeLabel.numberOfLines = 1;
        storeLabel.backgroundColor = [UIColor clearColor];
        storeLabel.opaque = NO;
        storeLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        storeLabel.text = @"Store Name Here";
        storeLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];

        UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 30.0, 209.0, 63.0)];
        addressLabel.backgroundColor = [UIColor clearColor];
        addressLabel.adjustsFontSizeToFitWidth = NO;
        addressLabel.autoresizesSubviews = YES;
        addressLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        addressLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        addressLabel.clearsContextBeforeDrawing = YES;
        addressLabel.clipsToBounds = YES;
        addressLabel.contentMode = UIViewContentModeLeft;
        addressLabel.numberOfLines = 3;
        addressLabel.opaque = NO;
        addressLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        addressLabel.text = @"Line1\nLine2\nLine3";
        addressLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16];
        addressLabel.textColor = [UIColor colorWithWhite:0.667 alpha:1.000];

        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(237.0, 30.0, 40.0, 33.0)];
        numberLabel.adjustsFontSizeToFitWidth = NO;
        numberLabel.backgroundColor = [UIColor colorWithRed:0.231 green:0.431 blue:0.627 alpha:1.000];
        numberLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        numberLabel.clearsContextBeforeDrawing = YES;
        numberLabel.clipsToBounds = YES;
        numberLabel.contentMode = UIViewContentModeCenter;
        numberLabel.numberOfLines = 1;
        numberLabel.opaque = NO;
        numberLabel.textAlignment = NSTextAlignmentCenter;
        numberLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        numberLabel.textColor = [UIColor whiteColor];
        numberLabel.text = @"#1";
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
