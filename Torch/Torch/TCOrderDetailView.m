//
//  TCOrderDetailView.m
//  Torch
//
//  Created by xu cheng on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCOrderDetailView.h"
#import "TCOrderHistoryDetailCell.h"
#import "ProductItemObject.h"
#import "TCPrinterCtl.h"
@interface TCOrderDetailView ()

@property (nonatomic,weak) IBOutlet UILabel *orderTitle;
@property (nonatomic,weak) IBOutlet UILabel *orderdetailDate;
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end

@implementation TCOrderDetailView
{
    NSMutableArray *displayData;
}

-(void)setOrderObjectList:(NSArray *)orderDetailsItemList {
    displayData = [orderDetailsItemList copy];
}

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
    // Do any additional setup after loading the view from its nib.
    
    self.orderTitle.text = [NSString stringWithFormat:@"%@ %@",[self localString:@"orderHistory.detailTitle"],self.orderSN];
    
    self.orderdetailDate.text =[NSString stringWithFormat:@"%@ %@",[self localString:@"orderHistory.orderDateTitle"], self.orderDate];
    
    
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
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 120;
}

-(UITableViewCell *)populateCell:(TCOrderHistoryDetailCell *)cell withIndex:(NSInteger)row {
    ProductItemObject *item = [displayData objectAtIndex:row];
    if (item) {
        cell.productName.text = item.productName;
        cell.productSN.text = item.productSN;
        cell.productUnitPrice.text = item.productPrice;
        cell.productDescription.text = item.productDescription;
        cell.productTotalAmount.text = item.productTotalPrice;
    }
    return cell;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *CellIdentifier = @"TCOrderHistoryDetailCell";
    
	TCOrderHistoryDetailCell *cell = (TCOrderHistoryDetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *xib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        cell = [xib objectAtIndex:0];
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    [self populateCell:cell withIndex:indexPath.row];
    UIView *cellSeperatorLine = [[UIView alloc] initWithFrame:cell.bounds];
    UIView *seperate2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 295, 1)];
    seperate2.backgroundColor = [UIColor grayColor];
    [cellSeperatorLine addSubview:seperate2];
    cell.backgroundView = cellSeperatorLine;
	return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)drawOrderItemSummary:(NSString *)orderAmount {
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 300, 50)];
    
    UIView *seperator1 = [[UIView alloc] initWithFrame:CGRectMake(10, 40, 300, 1)];
    seperator1.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    
    UILabel *orderSummarylabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 35)];
    orderSummarylabel.text = [self localString:@"orderHistory.orderItems"];
    [orderSummarylabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16]];
    orderSummarylabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    
    UILabel *orderAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 10, 50, 35)];
    orderAmountLabel.text = orderAmount;
    [orderAmountLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16]];
    orderAmountLabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    
    
    [customView addSubview:orderSummarylabel];
    [customView addSubview:orderAmountLabel];
    [customView addSubview:seperator1];
    return customView;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self drawOrderItemSummary:@"$100"];
}

-(void)printReceipt{
    TCPrinterCtl *printScreen = [[TCPrinterCtl alloc] init];
    [self.navigationController pushViewController:printScreen animated:YES];
}

- (UIView *)drawFooterButtons {
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 300, 120)];
    
    if ([displayData count] >0) {
        UIButton *printReceiptButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 290, 29)];
        [printReceiptButton setBackgroundImage:[UIImage imageNamed:@"bluebutton"] forState:UIControlStateNormal];
        
        [printReceiptButton setTitle:[self localString:@"orderHistory.printReceiptButton"] forState:UIControlStateNormal];
        [printReceiptButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
        [printReceiptButton addTarget:self action:@selector(printReceipt) forControlEvents:UIControlEventTouchDown];
        //completionButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        [printReceiptButton setTitleEdgeInsets:UIEdgeInsetsMake(8.0f, 0, 0, 0)];
        [footerView addSubview:printReceiptButton];
    }
    
    
    return footerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self drawFooterButtons];
}
@end
