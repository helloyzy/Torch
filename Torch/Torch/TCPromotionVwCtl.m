//
//  TCPromotionVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 8/30/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPromotionVwCtl.h"
#import "TCSysRes.h"
#import "TCPromotionDetailVwCtl.h"
#import "PromotionItem.h"

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
    PromotionItem * item1 = [PromotionItem newPromotion:1];
    PromotionItem * item2 = [PromotionItem newPromotion:2];
    PromotionItem * item3 = [PromotionItem newPromotion:3];
    data = @[item1, item2, item3];
}

- (void)initTopView {
    vwTop.backgroundColor = [UIColor whiteColor];
    TCLbl_Title_Ext(lblTitle);
    lblTitle.text = [self localString:@"promotion.title"];
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
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = TCTblVwCell_SubtitleStyle(tableView, @"PromotionCell");
    PromotionItem * item = data[indexPath.row];
	cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.description;
	return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return TC_TblVw_SectHeader_Height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return TCVw_TblVw_SectHeader(@"promotion.section.title");
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TCPromotionDetailVwCtl * ctl = [[TCPromotionDetailVwCtl alloc] init];
    ctl.item = data[indexPath.row];
    [self.navigationController pushViewController:ctl animated:YES];
}

@end
