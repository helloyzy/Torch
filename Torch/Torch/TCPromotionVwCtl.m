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
#import "Promotion.h"
#import "TCPromotionItem.h"

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
//    TCPromotionItem *p_1_off = [TCPromotionItem newPromotion:@"1 dollar off"];
//    p_1_off.type = PromotionTypeDollarOff;
//    p_1_off.discountAmount = 1.0;
//    TCPromotionItem *p_half_off = [TCPromotionItem newPromotion:@"0.5 dollar off"];
//    p_half_off.type = PromotionTypeDollarOff;
//    p_half_off.discountAmount = 0.5;
//    TCPromotionItem *p_FreeGift = [TCPromotionItem newPromotion:@"Buy 5 get 1 free"];
//    p_FreeGift.type = PromotionTypeNormal;
//    p_FreeGift.discountPercentage = 0;
//    TCPromotionItem *p_w_10 = [TCPromotionItem newPromotion:@"10% whole order"];
//    p_w_10.type = PromotionTypeDiscountOrder;
//    p_w_10.discountPercentage = 0.1;
//    TCPromotionItem *p_w_15 = [TCPromotionItem newPromotion:@"15% whole order"];
//    p_w_15.type = PromotionTypeDiscountOrder;
//    p_w_15.discountPercentage = 0.15;
//    data = @[p_1_off, p_half_off, p_FreeGift, p_w_10, p_w_15];
    data = [Promotion promotionsPerStore:self.currentStore];
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
    TCPromotionItem * item = data[indexPath.row];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TCPromotionDetailVwCtl * ctl = [[TCPromotionDetailVwCtl alloc] init];
    ctl.item = data[indexPath.row];
    [self.navigationController pushViewController:ctl animated:YES];
}

@end
