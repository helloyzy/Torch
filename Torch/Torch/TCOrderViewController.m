//
//  TCOrderViewController.m
//  Torch
//
//  Created by bo hu on 8/28/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCOrderViewController.h"
#import "InventoryTableCell.h"
#import "ProductItemObject.h"
#import "TCPromotionVwCtl.h"
#import "TCPromotionTableCell.h"
#import "TCPrinterCtl.h"
#import "Product.h"
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"
#import "Store.h"
#import "OrderCredit.h"
#import "OrderCreditItem.h"
#import "SalesRep.h"
#import "NSManagedObject+TCRestkit.h"
#import "CalItem.h"
#import "StoreCall.h"

@interface TCOrderViewController ()

@property (nonatomic,weak) IBOutlet UILabel *createOrderLabel;
@property (nonatomic,weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic) float fproductTotal;
@property (nonatomic) float fdiscount;
@property (nonatomic) float ftax;
@property (nonatomic) float fsubtotal;
@property (nonatomic) float fordertotal;
@property (nonatomic) float fdiscountInDollar;
@end

@implementation TCOrderViewController
{
    
    NSMutableArray *displayData;
    NSArray *searchResults;
    NSMutableDictionary *productCollection;
    NSMutableDictionary *promotionItems;
    NSMutableArray *displayPromotionItems;
    NSArray *productItems;
    float currentDiscount;
    TCPromotionItem *currentPromotionItem;
    
}

-(void) clearOrderList {
    [displayPromotionItems removeAllObjects];
    [displayData removeAllObjects];
    [promotionItems removeAllObjects];
    [self prepareForDisplay];
    [self refreshTableView];
    
}

-(void) refreshTableView {
    [self calculatePrice];
    [self.tableView reloadData];
}

-(void)regenerateDisplayPromotionItemArray {
    displayPromotionItems = [[NSMutableArray alloc] init];
    for (id key in promotionItems) {
        TCPromotionItem *promotionObject = (TCPromotionItem *)[promotionItems objectForKey:key];
        [displayPromotionItems addObject:promotionObject.key];
    }
    
}
-(BOOL)isDiscountPromotionItemExist {
    BOOL discountPromotionItemExist = NO;
    for (NSString *promotionSN in displayPromotionItems) {
        TCPromotionItem *promotionObject = (TCPromotionItem *) [promotionItems objectForKey:promotionSN];
        if (promotionObject.type == PromotionTypeDiscountOrder) {
            discountPromotionItemExist = YES;
        }
    }
    return discountPromotionItemExist;
    
}

-(CGFloat)getDiscountPercentage {
    CGFloat discountPercentage = 0;
    for (NSString *promotionSN in displayPromotionItems) {
        TCPromotionItem *promotionObject = (TCPromotionItem *) [promotionItems objectForKey:promotionSN];
        if (promotionObject.type == PromotionTypeDiscountOrder) {
            discountPercentage = promotionObject.discountPercentage;
        }
    }
    return discountPercentage;
}

-(void)showDiscountPromotionReplacementConfirmationWindow {
    UIAlertView *confirmView = [[UIAlertView alloc]initWithTitle:[self localString:@"order.discountpromotion.alert.title"] message:[self localString:@"order.discountpromotion.alert.text"] delegate:self cancelButtonTitle:[self localString:@"order.confirmNoButton"] otherButtonTitles:[self localString:@"order.confirmYesButton"], nil];
    //give a tag as 11 to indicate overall discount replacement alertview
    [confirmView setTag:11];
    [confirmView show];
}

-(void)replaceTheDiscountPromotionItem {
    for (NSString *promotionSN in displayPromotionItems) {
        TCPromotionItem *promotionObject = (TCPromotionItem *) [promotionItems objectForKey:promotionSN];
        if (promotionObject.type == PromotionTypeDiscountOrder) {
            [promotionItems removeObjectForKey:promotionSN];
        }
    }
    
    NSString *key = currentPromotionItem.key;
    [promotionItems setObject:currentPromotionItem forKey:key];
    [self regenerateDisplayPromotionItemArray];
    [self refreshTableView];
}

-(BOOL)isPromotionItemAllreadyExisting: (NSString *)promotionKey {
    NSObject *promotionObject = [promotionItems objectForKey:promotionKey];
    if (promotionObject == nil) {
        return NO;
    }
    return YES;
}

-(void)setSelectedPromotionItem:(TCPromotionItem *)promotionItem {
    if(!promotionItems) promotionItems = [[NSMutableDictionary alloc] init];
    currentPromotionItem = promotionItem;
    
    if ([self isPromotionItemAllreadyExisting:promotionItem.key]) {
        // if promotion item already existing, not need to do anything;
        return;
    }
    
    // if the overall discount promotion exist, prompt for replace
    if ([self isDiscountPromotionItemExist] && promotionItem.type == PromotionTypeDiscountOrder) {
        [self showDiscountPromotionReplacementConfirmationWindow];
    } else if(promotionItem) {
        NSString *key = promotionItem.key;
        [promotionItems setObject:promotionItem forKey:key];
        [self regenerateDisplayPromotionItemArray];
        [self refreshTableView];
    }
}

-(BOOL)isInSearchResultSection:(NSInteger)section {
    BOOL flag = NO;
    if (section ==0 && [searchResults count] >0) {
        flag = YES;
    }
    return flag;
}

-(void)generateDisplayDataArray {
    displayData = [[NSMutableArray alloc] init];
    for (id key in productCollection) {
        ProductItemObject *productObject = (ProductItemObject *)[productCollection objectForKey:key];
        if (![productObject.productUnitNum isEqualToString:@"0" ]) {
            [displayData addObject:productObject.productSN];
        }
    }
}




-(void)popupProductItems {
    
    productItems = [Product allInStore:[TCDBUtils ibDataStore]];
    
    productCollection = [[NSMutableDictionary alloc] initWithCapacity:[productItems count]];
    ProductItemObject *productItem;
    for (Product *product in productItems) {
        productItem = [ProductItemObject alloc];
        productItem.productName = product.name;
        productItem.productSN = [NSString stringWithFormat:@"%@%@", @"#", product.productNumber];
        productItem.productUnit = [self localString:@"product.itemunit"];
        productItem.productPriceLabel = [NSString stringWithFormat:@"$%1.2f %@",product.productPrice, product.uPC_GROUP_PRODUCT_UOM_maybe];
        productItem.productPrice = [NSString stringWithFormat:@"%f", product.productPrice];
        productItem.productUnitNum = @"0";
        productItem.productDescription = product.packtypeDescription;
        productItem.currentProduct = product;
        [productCollection setObject:productItem forKey:productItem.productSN];
    }
    
    
    //create an array to used in tablecell loop
    NSMutableArray *productArray = [[NSMutableArray alloc] initWithCapacity:1];
    [self generateDisplayDataArray];
    productArray = nil;
}

-(BOOL) doesTableViewDisplayRequired {
    BOOL display = NO;
    if ([displayData count] > 0 || [searchResults count] >0) {
        display = YES;
    }
    return display;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIView *)drawOrderItemSummary:(NSInteger)orderNumber withOrderAmountText:(NSString *)orderAmount {
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 300, 50)];
    
    UIView *seperator1 = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 300, 2)];
    seperator1.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    
    UILabel *orderSummarylabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 200, 35)];
    orderSummarylabel.text = [NSString stringWithFormat:@"%d%@",orderNumber,[self localString:@"order.orderSummary"]];
    [orderSummarylabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16]];
    orderSummarylabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    
    UILabel *orderAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 15, 50, 35)];
    orderAmountLabel.text = orderAmount;
    [orderAmountLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16]];
    orderAmountLabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    
    
    [customView addSubview:orderSummarylabel];
    [customView addSubview:orderAmountLabel];
    [customView addSubview:seperator1];
    return customView;
    
}

-(NSString *)generateReferenceNumber {
    NSString *repId = [SalesRep getRepId];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyyMMdd"];
    NSString *dateString = [dateformat stringFromDate:date];
    
    int randomNumber = (arc4random()%(99999-1))+1;
    return [NSString stringWithFormat:@"%@%@%d",dateString,repId,randomNumber];
}

-(void)generateOrderJSONData {

    OrderCredit *order = [OrderCredit newInstance];
    order.paymentAmountValue = self.fproductTotal;
    order.paymentType = @"Deduction";
    order.recordType = @"MX Orders";
    order.hersheyReferenceNumber = [self generateReferenceNumber];
    order.status = @"NEW";
    order.discountPercentValue = [self getDiscountPercentage]*100;
    order.totalDiscountAmountValue = self.fdiscountInDollar;
    
    for (NSString *productSN in displayData) {
        ProductItemObject *productObject = (ProductItemObject *)[productCollection objectForKey:productSN];
        if (![productObject.productUnitNum isEqualToString:@"0"]) {
            OrderCreditItem *orderItem = [OrderCreditItem newInstance];
            orderItem.quantityValue = [productObject.productUnitNum doubleValue];
            orderItem.overridePriceValue = 0;
            orderItem.distributedItemNumber = @"N/A";
            orderItem.discountPercentageValue = 0;
            orderItem.totalValue = [productObject.productPrice doubleValue] * [productObject.productUnitNum doubleValue];
            orderItem.nettAmountValue = orderItem.totalValue;
            orderItem.maxMarkdownPercentageValue = 0;
            orderItem.shortItemNumber = @"#N/A";
            //populate calitem from origin product info
            Product *productStored = productObject.currentProduct;
            CalItem *citem = [CalItem newInstance];

            citem.productNumber = productStored.productNumber;
            citem.uom = productStored.uPC_GROUP_PRODUCT_UOM_maybe;
            citem.name=productStored.name;
            citem.packtypeDescription = productStored.packtypeDescription;
            citem.priceValue = productStored.priceValue;
            citem.upc = productStored.upc;
            [CalItem save];
            orderItem.calItem  = citem;
            [OrderCreditItem save];
            [order addOrderCreditItemsObject:orderItem];
        }
        
    }
    
    // TODO: acccount from Store
    
    
    [OrderCredit save];
    
    StoreCall *call = [self.currentStore callInProgress];
    if (call) {
        call.associatedOrder = order.hersheyReferenceNumber;
        [call save];
    }
    
}

-(void)gotoPromotionScreen {
    TCPromotionVwCtl *targetViewController = [[TCPromotionVwCtl alloc]init];
    targetViewController.currentStore = self.currentStore;
	[[self navigationController] pushViewController:targetViewController animated:YES];
}

-(void)orderCompleted {
    UIAlertView *confirmView = [[UIAlertView alloc]initWithTitle:[self localString:@"order.confirmAlertTitle"] message:[self localString:@"order.confirmMessage"] delegate:self cancelButtonTitle:[self localString:@"order.confirmNoButton"] otherButtonTitles:[self localString:@"order.confirmYesButton"], nil];
    //give a tag as 10 to indicate current alertview
    [confirmView setTag:10];
    [confirmView show];
}

-(void)promptPrint {
    UIAlertView *printView = [[UIAlertView alloc]initWithTitle:[self localString:@"order.printAlertTitle"] message:[self localString:@"order.printAlertMessage"] delegate:self cancelButtonTitle:[self localString:@"order.confirmNoButton"] otherButtonTitles:[self localString:@"order.confirmYesButton"], nil];
    [printView setTag:20];
    [printView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView tag] ==10) {
        if (buttonIndex==1) {
            //confirm button clicked, populate the order data;
            [self generateOrderJSONData];
            [self  promptPrint];
        }
    }else if ([alertView tag] == 11) {
        if (buttonIndex==1) {
            [self replaceTheDiscountPromotionItem];
        }
    } else {
        //this is confirm from printprompt alertview
        if (buttonIndex==1) {
            //confirm button clicked, populate the order data;
            TCPrinterCtl *printScreen = [[TCPrinterCtl alloc] init];
            [self.navigationController pushViewController:printScreen animated:YES];
        }
        [self clearOrderList];
        
    }
    
}

- (NSString *)formatPriceString: (float)price {
    if (price >= 0) {
        return [NSString stringWithFormat:@"$%1.2f", price];
    } else {
        return [NSString stringWithFormat:@"-$%1.2f", fabsf(price)];
    }
}

- (UIView *)drawFooterSummaryView {
    
    UIView *summaryView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 130)];
    
    UILabel *productTotalLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 20)];
    [productTotalLable setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    //productTotalLable.textColor = [UIColor blackColor];
    [productTotalLable setText:[self localString:@"order.summary.productTotal"]];
    [productTotalLable setTextColor: [UIColor darkGrayColor]];
    
    UILabel *directDiscountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 150, 20)];
    [directDiscountLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [directDiscountLabel setText:[self localString:@"order.summary.discountDallar"]];
    [directDiscountLabel setTextColor:[UIColor darkGrayColor]];
    
    UILabel *discountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 150, 20)];
    [discountLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    
    NSString *discountPercentage = [NSString stringWithFormat:@"%.0f%%",[self getDiscountPercentage]*100];
    
    [discountLabel setText:[NSString stringWithFormat:@"%@ (%@)",[self localString:@"order.summary.discountLabel"], discountPercentage]];
    [discountLabel setTextColor: [UIColor darkGrayColor]];
    
    
    UILabel *subtotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 150, 20)];
    [subtotalLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [subtotalLabel setText:[self localString:@"order.summary.subTotal"]];
    [subtotalLabel setTextColor: [UIColor darkGrayColor]];
    
    
    NSString *taxRate = [NSString stringWithFormat:@"%.2f%%",self.currentStore.taxRate*100];
    UILabel *taxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 150, 20)];
    [taxLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [taxLabel setText:[NSString stringWithFormat:@"%@ (%@)",[self localString:@"order.summary.tax"], taxRate]];
    [taxLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 150, 20)];
    [orderTotalLabel setFont:[UIFont fontWithName:@"Helvetica Neue Bold" size:14]];
    [orderTotalLabel setText:[self localString:@"order.summary.orderTotal"]];
    [orderTotalLabel setTextColor: [UIColor darkGrayColor]];
    
    [summaryView addSubview:productTotalLable];
    [summaryView addSubview:directDiscountLabel];
    [summaryView addSubview:discountLabel];
    [summaryView addSubview:subtotalLabel];
    [summaryView addSubview:taxLabel];
    [summaryView addSubview:orderTotalLabel];
    
    
    UILabel *productTotalPriceLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 80, 20)];
    [productTotalPriceLable setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [productTotalPriceLable setText: [NSString stringWithFormat:@"$%1.2f", self.fproductTotal]];
    [productTotalPriceLable setTextAlignment:NSTextAlignmentRight];
    [productTotalPriceLable setTextColor: [UIColor darkGrayColor]];
    
    UILabel *directDiscountPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 30, 80, 20)];
    [directDiscountPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [directDiscountPriceLabel setText:[NSString stringWithFormat:@"-$%1.2f", self.fdiscountInDollar]];
    [directDiscountPriceLabel setTextAlignment:NSTextAlignmentRight];
    [directDiscountPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    
    UILabel *discountPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 80, 20)];
    [discountPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [discountPriceLabel setText:[NSString stringWithFormat:@"-$%1.2f", self.fdiscount]];
    [discountPriceLabel setTextAlignment:NSTextAlignmentRight];
    [discountPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *subtotalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 70, 80, 20)];
    [subtotalPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [subtotalPriceLabel setText:[self formatPriceString:self.fsubtotal]];
    [subtotalPriceLabel setTextAlignment:NSTextAlignmentRight];
    [subtotalPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *taxPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 90, 80, 20)];
    [taxPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [taxPriceLabel setText:[self formatPriceString:self.ftax]];
    [taxPriceLabel setTextAlignment:NSTextAlignmentRight];
    [taxPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    
    UILabel *orderTotalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 110, 80, 20)];
    [orderTotalPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue Bold" size:14]];
    [orderTotalPriceLabel setText:[self formatPriceString:self.fordertotal]];
    [orderTotalPriceLabel setTextAlignment:NSTextAlignmentRight];
    [orderTotalPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    [summaryView addSubview:productTotalPriceLable];
    [summaryView addSubview:directDiscountPriceLabel];
    [summaryView addSubview:discountPriceLabel];
    [summaryView addSubview:subtotalPriceLabel];
    [summaryView addSubview:taxPriceLabel];
    [summaryView addSubview:orderTotalPriceLabel];
    return summaryView;
}

- (UIView *)drawFooterButtons {
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 300, 320)];
    
    [footerView addSubview:[self drawFooterSummaryView]];
    UIButton *promotionButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 290, 30)];
    [promotionButton setBackgroundImage:[UIImage imageNamed:@"bluebutton"] forState:UIControlStateNormal];
    
    [promotionButton setTitle:[self localString:@"order.viewPromotion"] forState:UIControlStateNormal];
    [promotionButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
    //completionButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    [promotionButton setTitleEdgeInsets:UIEdgeInsetsMake(8.0f, 0, 0, 0)];
    
    [promotionButton addTarget:self action:@selector(gotoPromotionScreen) forControlEvents:UIControlEventTouchDown];
    
    
    if ([displayData count] >0) {
        UIButton *orderCompletionButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 190, 290, 29)];
        [orderCompletionButton setBackgroundImage:[UIImage imageNamed:@"bluebutton"] forState:UIControlStateNormal];
        
        [orderCompletionButton setTitle:[self localString:@"order.completionButton"] forState:UIControlStateNormal];
        [orderCompletionButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
        [orderCompletionButton addTarget:self action:@selector(orderCompleted) forControlEvents:UIControlEventTouchDown];
        //completionButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        [orderCompletionButton setTitleEdgeInsets:UIEdgeInsetsMake(8.0f, 0, 0, 0)];
        [footerView addSubview:orderCompletionButton];
    }
    
    [footerView addSubview:promotionButton];
    
    return footerView;
}

-(void) prepareForDisplay {
    
    UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 2)];
    seperator.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    
    
    [self.view addSubview:seperator];
    [self popupProductItems];
    //[self showInitialORProductTableListView];
    
    for (UIView *view in [self.searchBar subviews]) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)view;
            tf.delegate = self;
            break;
        }
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor blueColor];
    self.createOrderLabel.text = [self localString:@"order.title"];
    [self.searchBar setPlaceholder:[self localString:@"order.searchplaceholder"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self prepareForDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) filterInventoryContentForSearch:(NSString *)searchText{
    
    NSArray *searchArray = [productCollection allValues];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"productName CONTAINS[cd] %@ OR productSN CONTAINS[cd] %@", searchText,searchText];
    
    NSArray *filterArray = [searchArray filteredArrayUsingPredicate:predicate1];
    NSMutableArray *searchResultsMutableArray = [[NSMutableArray alloc] init];
    
    for (ProductItemObject *productObject in filterArray) {
        [searchResultsMutableArray addObject: productObject.productSN];
        
    }
    searchResults = [searchResultsMutableArray copy];
    
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] ==0) {
        [searchBar resignFirstResponder];
    } else {
        [self filterInventoryContentForSearch:searchText];
        [self refreshTableView];
    }
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    searchResults = nil;
    [self generateDisplayDataArray];
    [self refreshTableView];
    //scroll the tableview to the top
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
}
-(float)isLongPress:(NSString *)currentValue withOldValue:(NSString *)oldValue {
    
    float fcurrentValue = [currentValue floatValue];
    float foldValue = [oldValue floatValue];
    if (fcurrentValue-foldValue>=2) {
        // + button longpressed
        return 1.0;
    } else if (foldValue - fcurrentValue >=2) {
        // - button longpressed
        return -1.0;
    } else {
        return 0;
    }
}

-(void)updatePromotion:(NSString *)promotionKey withQuantity:(float)Quantity {
    TCPromotionItem *promotionitem  = [promotionItems objectForKey:promotionKey];
    if (promotionitem) {
        promotionitem.unitNum = Quantity;
        if (promotionitem.unitNum <0) {
            promotionitem.unitNum = 0;
        }
        [promotionItems setObject:promotionitem forKey:promotionKey];
    }
    
}




-(void)updateProduct:(NSString *)productSN withQuantity:(NSString *)productQuantity {
    ProductItemObject *productItem = [productCollection objectForKey:productSN];
    if (productItem) {
        float longpressed = [self isLongPress:productQuantity withOldValue:productItem.productUnitNum];
        if (longpressed >0) {
           productItem.productUnitNum = [NSString stringWithFormat:@"%d", [productItem.productUnitNum intValue]+10];
        } else if (longpressed <0) {
            productItem.productUnitNum =[NSString stringWithFormat:@"%d", [productItem.productUnitNum intValue]-10];
        } else {
            productItem.productUnitNum = productQuantity;
         }
        
        if ([productItem.productUnitNum intValue] < 0) {
            productItem.productUnitNum = @"0";
        }

        [productCollection setObject:productItem forKey:productSN];
    }
}

-(void) deleteOrderItem:(NSString *)productSN {
    ProductItemObject *productItem = [productCollection objectForKey:productSN];
    if (productItem) {
        productItem.productUnitNum = @"0";
        [productCollection setObject:productItem forKey:productSN];
    }
}

-(void)updateUnitLabel:(UIStepper *)sender{
    
    NSString *productQuantityValue = [NSString stringWithFormat:@"%g",sender.value];
    InventoryTableCell *currentCell = (InventoryTableCell *)[sender.superview superview];
    
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    indexPath = [self.tableView indexPathForCell:currentCell];
    NSInteger section = indexPath.section;
    if ([self isInSearchResultSection:section]) {
        itemKey = [searchResults objectAtIndex:indexPath.row];
    } else {
        itemKey = [displayData objectAtIndex:indexPath.row];
    }
    
    [self updateProduct:itemKey withQuantity:productQuantityValue];
    
    [self refreshTableView];
    
}


-(void)updatePromotionUnit:(UIStepper *)sender {
    
    InventoryTableCell *currentCell = (InventoryTableCell *)[sender.superview superview];
    
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    indexPath = [self.tableView indexPathForCell:currentCell];
    NSInteger indexInPromotionArray = indexPath.row - [displayData count];
    itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
    
    
    
    [self updatePromotion:itemKey withQuantity:(float)sender.value];
    
    [self refreshTableView];
}

-(void) deleteCurrentOrderItem:(UIButton *)sender {
    
    
    InventoryTableCell *currentCell = (InventoryTableCell *)sender.superview.superview.superview;
    
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    indexPath = [self.tableView indexPathForCell:currentCell];
    
    itemKey = [displayData objectAtIndex:indexPath.row];
    
    
    [self deleteOrderItem:itemKey];
    [self hideTheDeleteButton:currentCell hidden:YES];
    [self generateDisplayDataArray];
    [self refreshTableView];
}
-(void) deleteCurrentPromotionItem:(UIButton *)sender {
    
    
    TCPromotionTableCell *currentCell = (TCPromotionTableCell *)sender.superview.superview;
    
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    indexPath = [self.tableView indexPathForCell:currentCell];
    NSInteger indexInPromotionArray = indexPath.row - [displayData count];
    itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
    
    TCPromotionItem *promotionitem  = [promotionItems objectForKey:itemKey];
    if (promotionitem) {
        [promotionItems removeObjectForKey:itemKey];
    }
    
    [self regenerateDisplayPromotionItemArray];
    [self refreshTableView];
}

-(void) deleteCurrentCommonPromotionItem:(UIButton *)sender {
    
    
    InventoryTableCell *currentCell = (InventoryTableCell *)sender.superview.superview.superview;
    
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    indexPath = [self.tableView indexPathForCell:currentCell];
    NSInteger indexInPromotionArray = indexPath.row - [displayData count];
    itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
    
    TCPromotionItem *promotionitem  = [promotionItems objectForKey:itemKey];
    if (promotionitem) {
        [promotionItems removeObjectForKey:itemKey];
    }
    [self hideTheDeleteButton:currentCell hidden:YES];
    [self regenerateDisplayPromotionItemArray];
    [self refreshTableView];
}

-(UITableViewCell *)populateCell:(InventoryTableCell *)cell withKeyName:(NSString *)keyName {
    ProductItemObject *productItem = [productCollection objectForKey:keyName];
    if(productItem) {
        cell.productName.text = productItem.productName;
        cell.productQuantityUnitLabel.text = productItem.productUnit;
        cell.productDescription.text = productItem.productDescription;
        cell.productSequenceNum.text = productItem.productSN;
        cell.unitPrice.text = productItem.productPriceLabel;
        cell.productQuantity.text = productItem.productUnitNum;
        cell.stepper.value = [productItem.productUnitNum doubleValue];
    }
    
    return cell;
}

-(UITableViewCell *)populatePromotionCell:(InventoryTableCell *)cell withKeyName:(NSString *)keyName {
    TCPromotionItem *promotion = [promotionItems objectForKey:keyName];
    if(promotion) {
        cell.productName.text = promotion.name;
        UILabel *promotionDescLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 30, 165, 80)];
        [promotionDescLabel setText:promotion.description];
        [promotionDescLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:14]];
        [promotionDescLabel setTextColor:[UIColor darkGrayColor]];
        promotionDescLabel.numberOfLines = 0;
        [promotionDescLabel setTextAlignment:NSTextAlignmentLeft];
        [cell addSubview:promotionDescLabel];
        cell.stepper.value = (double)promotion.unitNum;
        cell.productQuantity.text = [NSString stringWithFormat:@"%1.0f",promotion.unitNum];
        cell.productQuantityUnitLabel.text = [self localString:@"product.itemunit"];
    }
    
    return cell;
}


-(void)hideTheDeleteButton:(InventoryTableCell *)cell hidden:(BOOL)hiddenFlag {
    if (!hiddenFlag) {
        cell.vwDelete.hidden = NO;
        cell.productQuantity.hidden = YES;
        cell.productQuantityUnitLabel.hidden = YES;
        cell.stepper.hidden = YES;
        [cell.contentView bringSubviewToFront:cell.vwDelete];
    } else {
        cell.vwDelete.hidden = YES;
        cell.productQuantity.hidden = NO;
        cell.productQuantityUnitLabel.hidden=NO;
        cell.stepper.hidden = NO;
        [cell.contentView sendSubviewToBack:cell.vwDelete];
    }
}


-(void)cellSwiped:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        InventoryTableCell *cell = (InventoryTableCell *)gestureRecognizer.view;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        NSInteger sectionId = [indexPath section];
        if (![self isInSearchResultSection:sectionId]) {
            // [self slideInDeletionButton:cell];
            [self hideTheDeleteButton:cell hidden:NO];
        }
    }
}


-(void)cellDeleteCancelled:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        InventoryTableCell *cell = (InventoryTableCell *)gestureRecognizer.view;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        NSInteger sectionId = [indexPath section];
        if (![self isInSearchResultSection:sectionId]) {
            // [self slideInDeletionButton:cell];
            [self hideTheDeleteButton:cell hidden:YES];
        }
        
    }
}

-(void)promotionStepperCellSwiped:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        InventoryTableCell *cell = (InventoryTableCell *)gestureRecognizer.view;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        NSInteger sectionId = [indexPath section];
        if (![self isInSearchResultSection:sectionId]) {
            // [self slideInDeletionButton:cell];
            [self hideTheDeleteButton:cell hidden:NO];
        }
    }
}

-(void)promotionCellSwiped:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        TCPromotionTableCell *cell = (TCPromotionTableCell *)gestureRecognizer.view;
        [cell bringSubviewToFront:cell.deleteButton];
        cell.deleteButton.hidden=NO;
        
    }
}

-(void)promotionCellDeleteCancelled:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        TCPromotionTableCell *cell = (TCPromotionTableCell *)gestureRecognizer.view;
        [cell sendSubviewToBack:cell.deleteButton];
        cell.deleteButton.hidden=YES;
        
    }
}


-(BOOL)isPromotionItem:(NSIndexPath *)indexPath inSection:(NSInteger)sectionId {
    BOOL promotionItemFlag = NO;
    if (indexPath.row>=[displayData count]&&![self isInSearchResultSection:sectionId]) {
        promotionItemFlag = YES;
    }
    return promotionItemFlag;
}


-(UITableViewCell *)createNormalPromotionItemCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withItemKey:(NSString *)itemkey {
    // this is total discount order promotion item, use promotion table cell to render
    TCPromotionItem *pi = [promotionItems objectForKey:itemkey];

        TCPromotionTableCell *cell = (TCPromotionTableCell *)[tableView dequeueReusableCellWithIdentifier:@"TCPromotionTableCell"];
        if (!cell) {
            NSArray *nib  = [[NSBundle mainBundle] loadNibNamed:@"TCPromotionTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell.contentView sendSubviewToBack:cell.deleteButton];
            cell.deleteButton.hidden = YES;
        }
        
        cell.promotionTitle.text = pi.name;
        cell.promotionDetails.text=pi.description;
        //add swipe gesture to delete
        UISwipeGestureRecognizer *sgr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(promotionCellSwiped:)];
        [sgr setDirection:UISwipeGestureRecognizerDirectionLeft];
        [cell addGestureRecognizer:sgr];
        
        UISwipeGestureRecognizer *sgr1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(promotionCellDeleteCancelled:)];
        [sgr1 setDirection:UISwipeGestureRecognizerDirectionRight];
        [cell addGestureRecognizer:sgr1];
        UIButton *deleteButton = cell.deleteButton;
        [deleteButton addTarget:self action:@selector(deleteCurrentPromotionItem:) forControlEvents:UIControlEventTouchDown];
        UIView *cellSeperatorLine = [[UIView alloc] initWithFrame:cell.bounds];
        UIView *seperate2 = [[UIView alloc] initWithFrame:CGRectMake(5, 78, 295, 1)];
        seperate2.backgroundColor = [UIColor grayColor];
        [cellSeperatorLine addSubview:seperate2];
        cell.backgroundView = cellSeperatorLine;
        return cell;
    
}



-(UITableViewCell *)createPromotionItemCellWithStepper:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withItemKey:(NSString *)itemKey {
    
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:@"promotionCommonCell"];
    if(cell ==nil) {
        cell = [[InventoryTableCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"promotionCommonCell"];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InventoryTableCell" owner:nil options:nil] lastObject];
        //cell = [nib objectAtIndex:0];
        [cell.contentView sendSubviewToBack:cell.vwDelete];
        cell.vwDelete.hidden=YES;
    }
    
    UIStepper *numStepper1 = cell.stepper;
    [numStepper1 addTarget:self action:@selector(updatePromotionUnit:) forControlEvents:UIControlEventValueChanged];
    UIView *cellSeperatorLine = [[UIView alloc] initWithFrame:cell.bounds];
    UIView *seperate2 = [[UIView alloc] initWithFrame:CGRectMake(5, 110, 295, 1)];
    seperate2.backgroundColor = [UIColor grayColor];
    [cellSeperatorLine addSubview:seperate2];
    cell.backgroundView = cellSeperatorLine;
    [self populatePromotionCell:cell withKeyName:itemKey];
    
    
    //add swipe gesture to delete
    UISwipeGestureRecognizer *sgr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwiped:)];
    [sgr setDirection:UISwipeGestureRecognizerDirectionLeft];
    [cell addGestureRecognizer:sgr];
    
    UISwipeGestureRecognizer *sgr1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellDeleteCancelled:)];
    [sgr1 setDirection:UISwipeGestureRecognizerDirectionRight];
    [cell addGestureRecognizer:sgr1];
    
    UIButton *deleteButton = cell.deleteButton;
    [deleteButton addTarget:self action:@selector(deleteCurrentCommonPromotionItem:) forControlEvents:UIControlEventTouchDown];
    
    return cell;
    
}



-(UITableViewCell *)createOrderItemCellWithStepper:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger sectionId = [indexPath section];
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:@"orderProductItemCell"];
    if(cell ==nil) {
        // NSArray *nib = [[NSBundle mainBundle] loadNibNamed:orderTableCell owner:self options:nil] ;
        // cell = [nib objectAtIndex:0];
        cell = [[InventoryTableCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderProductItemCell"];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InventoryTableCell" owner:nil options:nil] lastObject];
        [cell.contentView sendSubviewToBack:cell.vwDelete];
        cell.vwDelete.hidden=YES;
    }
    
    [cell.stepper addTarget:self action:@selector(updateUnitLabel:) forControlEvents:UIControlEventValueChanged];
    [cell.stepper setAutorepeat:YES];
    [cell.stepper setContinuous:NO];
    
    
    NSString *itemKey;
    if ([self isInSearchResultSection:sectionId]) {
        itemKey = [searchResults objectAtIndex:indexPath.row];
        [self hideTheDeleteButton:cell hidden:YES];
    } else {
        itemKey = [displayData objectAtIndex:indexPath.row];
        
        //add swipe gesture to delete
        UISwipeGestureRecognizer *sgr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwiped:)];
        [sgr setDirection:UISwipeGestureRecognizerDirectionLeft];
        [cell addGestureRecognizer:sgr];
        
        UISwipeGestureRecognizer *sgr1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellDeleteCancelled:)];
        [sgr1 setDirection:UISwipeGestureRecognizerDirectionRight];
        [cell addGestureRecognizer:sgr1];
        UIButton *deleteButton = cell.deleteButton;
        [deleteButton addTarget:self action:@selector(deleteCurrentOrderItem:) forControlEvents:UIControlEventTouchDown];
        
    }
    
    [self populateCell:cell withKeyName:itemKey];
    
    UIView *cellSeperatorLine = [[UIView alloc] initWithFrame:cell.bounds];
    UIView *seperate2 = [[UIView alloc] initWithFrame:CGRectMake(5, 110, 295, 1)];
    seperate2.backgroundColor = [UIColor grayColor];
    [cellSeperatorLine addSubview:seperate2];
    cell.backgroundView = cellSeperatorLine;
    return cell;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger sectionId = [indexPath section];
    
    if ([self isPromotionItem:indexPath inSection:sectionId]) {
        //generate promotionItemCell and return Here;
        
        NSInteger indexInPromotionArray = indexPath.row - [displayData count];
        NSString *itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
        
        if (itemKey) {
            TCPromotionItem *pi = [promotionItems objectForKey:itemKey];
            if (pi && pi.type == PromotionTypeDiscountOrder) {
                // this is total discount order promotion item, use promotion table cell to render
                return [self createNormalPromotionItemCell:tableView cellForRowAtIndexPath:indexPath withItemKey:itemKey];
            } else {
                // is common promotion item, need the cell style with steppers
                return [self createPromotionItemCellWithStepper:tableView cellForRowAtIndexPath:indexPath withItemKey:itemKey];
                
            }
            
        }
    }else {
        // create normal product item in order cell
        return [self createOrderItemCellWithStepper:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

-(BOOL) isDiscountPromotionItem:(NSIndexPath *) indexPath {
    BOOL isDiscountItem = NO;
    NSInteger indexInPromotionArray = indexPath.row - [displayData count];
    NSString *itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
    
    if (itemKey) {
        TCPromotionItem *pi = [promotionItems objectForKey:itemKey];
        if (pi && pi.type == PromotionTypeDiscountOrder) {
            isDiscountItem = YES;
        }
    }
    return isDiscountItem;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger sectionId = [indexPath section];
    if ([self isPromotionItem:indexPath inSection:sectionId] && [self isDiscountPromotionItem:indexPath]) {
        return 80;
    }else {
        return 114;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self isInSearchResultSection:section]) {
        return [searchResults count];
    } else {
        return [displayData count]+[promotionItems count];
    }
    
    
}

-(BOOL) textFieldShouldClear:(UITextField *)textField {
    [self performSelector:@selector(searchBarCancelButtonClicked:) withObject:self.searchBar afterDelay:0];
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([searchResults count]>0) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self isInSearchResultSection:section]) {
        return 0;
    }
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self isInSearchResultSection:section]) {
        return nil;
    }
    
    NSInteger itemCounts = 0;
    if ([displayPromotionItems count] >0) {
        itemCounts += [displayPromotionItems count];
    }
    itemCounts += [displayData count];
    return [self drawOrderItemSummary:itemCounts withOrderAmountText:[NSString stringWithFormat:@"$%1.2f", self.fordertotal]];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self isInSearchResultSection:section]) {
        return nil;
    }
    return [self drawFooterButtons];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self isInSearchResultSection:section]) {
        return 0;
    }
    return 320;
}

-(void) clearPrice {
    self.fordertotal = 0.0;
    self.fproductTotal = 0.0;
    self.ftax = 0.0;
    self.fdiscount = 0.0;
    self.fsubtotal = 0.0;
    self.fdiscountInDollar = 0.0;
}

-(void) calculatePrice {
    [self clearPrice];
    [self calculateOrderTotal];
    
}


-(void) calculateProductsPrice {
    for (NSString *productSN in displayData) {
        ProductItemObject *productObject = (ProductItemObject *)[productCollection objectForKey:productSN];
        if (![productObject.productUnitNum isEqualToString:@"0"]) {
            self.fproductTotal += [productObject.productUnitNum doubleValue]*[productObject.productPrice doubleValue];
            //self.fproductTotal += [productObject.productUnitNum doubleValue]*1;
        }
        
    }
        self.fproductTotal = round(self.fproductTotal*100.0)/100.0;
}

-(void) calculateDirectDiscountInDallar {
    [self calculateProductsPrice];
    CGFloat discountInDollar = 0;
    for (NSString *promotionSN in displayPromotionItems) {
        TCPromotionItem *promotionObject = (TCPromotionItem *) [promotionItems objectForKey:promotionSN];
        if (promotionObject.type == PromotionTypeDollarOff) {
            discountInDollar += promotionObject.discountAmount * promotionObject.unitNum;
        }
    }
    self.fdiscountInDollar = discountInDollar;
    
}

-(void) calculateDiscounts {
    [self calculateDirectDiscountInDallar];
    CGFloat discountPercentage = [self getDiscountPercentage];
    double productPriceSubtotal = self.fproductTotal-self.fdiscountInDollar;
    if (productPriceSubtotal > 0) {
        self.fdiscount = discountPercentage * productPriceSubtotal;
    } else {
        self.fdiscount = 0;
    }
    self.fdiscount = round(self.fdiscount*100.0)/100.0;
    
}

-(void) calculateTax {
    [self calculateSubtotal];
    CGFloat taxRate = self.currentStore.taxRate;
    if (self.fsubtotal>0) {
         self.ftax = self.fsubtotal * taxRate;
    } else {
        self.ftax = 0;
    }
    self.ftax = round(self.ftax*100.0)/100.0;
   
}

-(void) calculateSubtotal {
    [self calculateDiscounts];
    self.fsubtotal = self.fproductTotal - self.fdiscount-self.fdiscountInDollar;
    self.fsubtotal= round(self.fsubtotal*100.0)/100.0;
}
-(void) calculateOrderTotal {
    [self calculateTax];
    self.fordertotal = self.fsubtotal + self.ftax;
    self.fordertotal = round(self.fordertotal*100.0)/100.0;
}
@end