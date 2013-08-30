//
//  TCPromotionVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 8/30/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPromotionVwCtl.h"
#import "TCSysRes.h"

@interface TCPromotionVwCtl () {
    NSArray * data;
}

@end

@implementation TCPromotionVwCtl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initData {
    data = @[@"Promotion 1", @"Promotion 2",@"Promotion 3"];
}

- (void)initTopView {
    vwTop.backgroundColor = [UIColor whiteColor];
    TCLbl_Title_Ext(lblTitle);
    lblTitle.text = @"Priority";
}

- (void)initTableView {
    tblVw.delegate = self;
    tblVw.dataSource = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initTopView];
    [self initTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%i%@", [data count], data[0]);
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = TCTblVwCell_SubtitleStyle(tableView, @"PromotionCell");
    NSString * priority = data[indexPath.row];
	cell.textLabel.text = priority;
    cell.detailTextLabel.text = [priority stringByAppendingString: @" detail ajfidjafijsodjfdojfoajdojodjfosajfodjasojdfoajsfojsoj"];
	return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return TCVw_TblVw_SectHeader(tableView, section, @"priority.title");
}

@end
