//
//  TCMyDayController.m
//  Torch
//
//  Created by Yuan Mai on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCMyDayController.h"
#import "TCMyDayCell.h"
#import "GraphicsUtils.h"
#import <QuartzCore/QuartzCore.h>
#import "TCStoreHomeView.h"
#import "Store.h"
#import "Banner.h"
#import "SalesRep.h"
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"
#import <OCTotallyLazy.h>

@interface TCMyDayController ()

@end

@implementation TCMyDayController {
    NSArray *_stores;
}
@synthesize tableView = _tableView;
@synthesize header = _header;
@synthesize shadow = _shadow;

static NSString *CellIdentifier = @"MyDayCell";    

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
    SalesRep * rep = [SalesRep allInStore:[TCDBUtils ibDataStore]][0];
    _stores = [[[[rep.banners map:^(Banner* banner) { return banner.stores; }] asSequence] flatten] asArray];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view.autoresizesSubviews = YES;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    CALayer *band = [CALayer layer];
    band.borderWidth = 3;
    band.frame = CGRectMake(0, _header.layer.frame.size.height-2, _header.layer.frame.size.width, 2);
    band.borderColor = TCColorLineBlue.CGColor;
    [_header.layer addSublayer:band];

    UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, _tableView.bounds.size.width, 10)];
    CAGradientLayer *shadow = [CAGradientLayer layer];
    shadow.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 10);
    shadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    [topShadowView.layer insertSublayer:shadow atIndex:0];

    [_tableView registerClass:[TCMyDayCell class] forCellReuseIdentifier:CellIdentifier];
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
    return _stores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TCMyDayCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell cellWithData:[_stores objectAtIndex:indexPath.row] cellForRowAtIndexPath:indexPath];
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
    TCStoreHomeView *controller = [[TCStoreHomeView alloc] init];
    controller.currentStore = [_stores objectAtIndex:indexPath.row];
    controller.currentIndex =  [NSString stringWithFormat:@"#%@", [NSNumber numberWithInteger:indexPath.row+1]];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
