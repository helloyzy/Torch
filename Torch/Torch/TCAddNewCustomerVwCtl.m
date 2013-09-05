//
//  TCAddNewCustomerVwCtl.m
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCAddNewCustomerVwCtl.h"
#import "TCSysRes.h"

@interface TCAddNewCustomerVwCtl ()

@end

@implementation TCAddNewCustomerVwCtl

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
    [self initInternal];
}

- (void)initInternal {
    TCLbl_Title_Ext(lblTitle);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate 

#define _TV_ROW_HEIGHT 40
#define WIDTH(x) x.size.width
#define HEIGHT(x) x.size.height

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _TV_ROW_HEIGHT;
}

- (UITextField *)createTextField:(UITableViewCell *)cell {
    CGFloat p_x = 15;
    CGFloat p_y = 11;
    CGRect textFrame = CGRectMake(p_x, p_y, 270, HEIGHT(cell.bounds) - 2 * 10);
    UITextField * result = [[UITextField alloc] initWithFrame:textFrame];
    // result.borderStyle = UITextBorderStyleLine;
    result.font = TCFont_HNLTComLt(14);
    result.placeholder = @"123";
    // result.text = @"123";
    [cell.contentView addSubview:result];
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * sTextCellId = @"sTextCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:sTextCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sTextCellId];
        // cell.textLabel.text = @"123";
        [self createTextField:cell];
    }
    return cell;
}

@end
