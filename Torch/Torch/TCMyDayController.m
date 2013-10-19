//
//  TCMyDayController.m
//  Torch
//
//  Created by Yuan Mai on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCMyDayController.h"
#import "TCAddNewCustomerVwCtl.h"
#import "TCMyDayCell.h"
#import "GraphicsUtils.h"
#import <QuartzCore/QuartzCore.h>
#import "TCStoreHomeView.h"
#import "Store.h"
#import "StoreCall.h"
#import "Banner.h"
#import "SalesRep.h"
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"
#import <OCTotallyLazy.h>
#import <Foundation/NSBundle.h>
#import "TCSysRes.h"

#define SECTION_TODAY_CALLS 0

@interface TCMyDayController () {
    NSArray *_stores;
    NSArray *_todayStores;
    NSArray *_finishedStores;
    NSArray *_futureStores;
    NSMutableArray *_sections;
    NSMutableArray *_sectionNames;
    StoreCall *_selectedCall;
    NSInteger _sectionCompletedCalls;
    NSInteger _sectionFutureCalls;
}

@end

@implementation TCMyDayController

static NSString *CellIdentifier = @"MyDayCell";
static NSString *NewCustomerCell = @"NewCustomerCell";

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
    //SalesRep * rep = [SalesRep allInStore:[TCDBUtils ibDataStore]][0];
    // [[[[rep.banners map:^(Banner* banner) { return banner.stores; }] asSequence] flatten] asArray];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view.autoresizesSubviews = YES;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    CALayer *band = [CALayer layer];
    band.borderWidth = 3;
    band.frame = CGRectMake(0, _header.layer.frame.size.height-2, _header.layer.frame.size.width, 2);
    band.borderColor = TCColorLineBlue.CGColor;
    [_header.layer addSublayer:band];
    _header.adjustsFontSizeToFitWidth = YES;

    UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, _tableView.bounds.size.width, 10)];
    CAGradientLayer *shadow = [CAGradientLayer layer];
    shadow.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 10);
    shadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    [topShadowView.layer insertSublayer:shadow atIndex:0];

    [_tableView registerClass:[TCMyDayCell class] forCellReuseIdentifier:CellIdentifier];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NewCustomerCell];
    [_tableView.superview addSubview:topShadowView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)initSections {
    NSCalendar *cal = [NSCalendar currentCalendar];
//    NSDateComponents *minusDay = [[NSDateComponents alloc] init];
//    [minusDay setDay:-3]; //TODO: waiting for correct json data
    NSDateComponents *plusOneDay = [[NSDateComponents alloc] init];
    [plusOneDay setDay:1]; 
    NSDate* today = [cal dateFromComponents:
                     [cal components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                            fromDate:[NSDate date]]];
    NSDate* tomorrow = [cal dateByAddingComponents:plusOneDay toDate:today options:0];
//    today = [cal dateByAddingComponents:minusDay toDate:today options:0];
    NSPredicate* todayFilter = [NSPredicate predicateWithFormat:@"(plannedStartDate >= %f) AND (plannedStartDate < %f)", [today timeIntervalSince1970] * 1000,
                                [tomorrow timeIntervalSince1970] * 1000];
    NSPredicate* tomorrowFilter = [NSPredicate predicateWithFormat:@"plannedStartDate >= %f", [tomorrow timeIntervalSince1970] * 1000];
    
    _todayStores = [StoreCall allForPredicate:todayFilter orderBy:StoreCallAttributes.plannedStartDate ascending:YES];
    _stores = [_todayStores filter:^BOOL(StoreCall* call) { return ![call isFinsihed]; }];
    _finishedStores = [_todayStores filter:^BOOL(StoreCall* call) { return [call isFinsihed]; }];
    _futureStores = [StoreCall allForPredicate:tomorrowFilter orderBy:StoreCallAttributes.plannedStartDate ascending:YES];
    
    _sections = [[NSMutableArray alloc]init];
    _sectionNames = [[NSMutableArray alloc]init];
    [_sections addObject:_stores];
    [_sectionNames addObject:@""]; // just a placeholder to be the equal size with _sections
    // reset 
    _sectionCompletedCalls = -1;
    _sectionFutureCalls = -1;
    if (_finishedStores.count > 0) {
        [_sections addObject:_finishedStores];
        [_sectionNames addObject:[self localString:@"myday.todayFinishedCalls"]];
        _sectionCompletedCalls = 1;
    }
    if (_futureStores.count > 0) {
        [_sections addObject:_futureStores];
        [_sectionNames addObject:[self localString:@"myday.futureCalls"]];
        // depend on whether we have finishedCall section
        _sectionFutureCalls = (_sectionCompletedCalls > 0) ? 2 : 1;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    _selectedCall = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:MYDAY_WILLAPPEAR_NOTIFICATION object:nil];

    [self initSections];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
    [df setDateFormat:@"EEEE, MMMM dd, YYYY "];
    NSString* str= [[df stringFromDate: [[NSDate alloc] init]] uppercaseString];
    
    _header.text = [Lo(myday.title) stringByAppendingString:str];
    
    [_tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] postNotificationName:MYDAY_WILLDISAPPEAR_NOTIFICATION object:_selectedCall];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* array = _sections[section];
    return array.count + ((section == SECTION_TODAY_CALLS) ? 1 : 0);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == SECTION_TODAY_CALLS ? 0.0 : 35.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width - 5, tableView.sectionHeaderHeight)];
    // UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divide.png"]];
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.bounds.size.width - 100, 25)];
    if (section == SECTION_TODAY_CALLS) {
        return nil;
    } else {
        headerLbl.backgroundColor = [UIColor clearColor];
        headerLbl.text = _sectionNames[section];
        // headerImage.frame = CGRectMake(8, 25, tableView.bounds.size.width - 14, 2);
        headerLbl.font = TCFont_HNLTComBd(17);
        headerLbl.textColor =[UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1];
        [headerView addSubview:headerLbl];
        // [headerView addSubview:headerImage];
    }
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NewCustomerCell];
        cell.textLabel.font = TCFont_HNLTComMd(16); //[UIFont fontWithName:@"HelveticaNeueLTCom-Roman" size:16];
        cell.textLabel.textColor = TCColorLineBlue;
        cell.textLabel.text = Lo(myday.add);
        cell.imageView.image = [UIImage imageNamed:@"focus.png"];
        //[tableView dequeueReusableCellWithIdentifier:NewCustomerCell forIndexPath:indexPath];
        return cell;
    }
    TCMyDayCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSArray *array = _sections[indexPath.section];
    NSInteger index = (indexPath.section == 0) ? indexPath.row - 1 : indexPath.row; // we have "Add new customer" cell for the first section
    id item = array[index];
    [cell cellWithData:array[index] cellForRowAtIndexPath:[_todayStores indexOfObject:item]];
    if (indexPath.section == SECTION_TODAY_CALLS) {
        [cell setTodayCallsStyle];
    } else if (indexPath.section == _sectionCompletedCalls) {
        [cell setCompletedCallsStyle];
    } else {
        [cell setFutureCallsStyle];
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
	return (indexPath.row == 0 && indexPath.section == 0) ? 45 : 93;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        TCAddNewCustomerVwCtl *controller = [[TCAddNewCustomerVwCtl alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        return;
    }
    NSInteger index = indexPath.section == 0 ? indexPath.row-1 : indexPath.row;
    NSArray *array = _sections[indexPath.section];
    _selectedCall = array[index];
    TCStoreHomeView *controller = [[TCStoreHomeView alloc] init];
    controller.currentCall = _selectedCall;
    controller.currentIndex =  [NSString stringWithFormat:@"#%@", [NSNumber numberWithInteger:indexPath.row]];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
