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

@interface TCOrderViewController ()

@property (nonatomic,weak) IBOutlet UILabel *createOrderLabel;
@property (nonatomic,weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic) float fproductTotal;
@property (nonatomic) float fdiscount;
@property (nonatomic) float ftax;
@property (nonatomic) float fsubtotal;
@property (nonatomic) float fordertotal;

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
        if (![productObject.productUnitNum isEqualToString: @"0"]) {
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
        productItem.productName = product.packtype_Description;
        productItem.productSN = [NSString stringWithFormat:@"%@ %@", @"#", product.short_material_number];
        productItem.productUnit = [self localString:@"product.itemunit"];
        productItem.productPrice = [NSString stringWithFormat:@"$%1.2f",product.productPrice];
        productItem.productUnitNum = @"0";
        productItem.productDescription = product.desp;
        
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

-(void)generateOrderJSONData {
    NSLog(@"create Jason Data now");
}

-(void)gotoPromotionScreen {
    UIViewController *targetViewController = [[TCPromotionVwCtl alloc]init];
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

    }
   
}

- (UIView *)drawFooterSummaryView {
    
    UIView *summaryView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 120)];

    UILabel *productTotalLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    [productTotalLable setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    //productTotalLable.textColor = [UIColor blackColor];
    [productTotalLable setText:[self localString:@"order.summary.productTotal"]];
    [productTotalLable setTextColor: [UIColor darkGrayColor]];
    
    UILabel *discountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 100, 20)];
    [discountLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    
    NSString *discountPercentage = [NSString stringWithFormat:@"%.0f%%",[self getDiscountPercentage]*100];
    
    [discountLabel setText:[NSString stringWithFormat:@"%@ (%@)",[self localString:@"order.summary.discountLabel"], discountPercentage]];
    [discountLabel setTextColor: [UIColor darkGrayColor]];
    
    
    UILabel *subtotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 100, 20)];
    [subtotalLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [subtotalLabel setText:[self localString:@"order.summary.subTotal"]];
    [subtotalLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *taxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 20)];
    [taxLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [taxLabel setText:[self localString:@"order.summary.tax"]];
    [taxLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 100, 20)];
    [orderTotalLabel setFont:[UIFont fontWithName:@"Helvetica Neue Bold" size:14]];
    [orderTotalLabel setText:[self localString:@"order.summary.orderTotal"]];
     [orderTotalLabel setTextColor: [UIColor darkGrayColor]];
    
    [summaryView addSubview:productTotalLable];
    [summaryView addSubview:discountLabel];
    [summaryView addSubview:subtotalLabel];
    [summaryView addSubview:taxLabel];
    [summaryView addSubview:orderTotalLabel];
    
    
    UILabel *productTotalPriceLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 80, 20)];
    [productTotalPriceLable setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [productTotalPriceLable setText: [NSString stringWithFormat:@"$%1.2f", self.fproductTotal]];
    [productTotalPriceLable setTextAlignment:NSTextAlignmentRight];
       [productTotalPriceLable setTextColor: [UIColor darkGrayColor]];
    
    
    UILabel *discountPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 30, 80, 20)];
    [discountPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [discountPriceLabel setText:[NSString stringWithFormat:@"-$%1.2f", self.fdiscount]];
    [discountPriceLabel setTextAlignment:NSTextAlignmentRight];
       [discountPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *subtotalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 80, 20)];
    [subtotalPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [subtotalPriceLabel setText:[NSString stringWithFormat:@"$%1.2f", self.fsubtotal]];
    [subtotalPriceLabel setTextAlignment:NSTextAlignmentRight];
       [subtotalPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    UILabel *taxPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 70, 80, 20)];
    [taxPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [taxPriceLabel setText:[NSString stringWithFormat:@"$%1.2f", self.ftax]];
    [taxPriceLabel setTextAlignment:NSTextAlignmentRight];
       [taxPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    
    UILabel *orderTotalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 90, 80, 20)];
    [orderTotalPriceLabel setFont:[UIFont fontWithName:@"Helvetica Neue Bold" size:14]];
    [orderTotalPriceLabel setText:[NSString stringWithFormat:@"$%1.2f", self.fordertotal]];
    [orderTotalPriceLabel setTextAlignment:NSTextAlignmentRight];
       [orderTotalPriceLabel setTextColor: [UIColor darkGrayColor]];
    
    [summaryView addSubview:productTotalPriceLable];
    [summaryView addSubview:discountPriceLabel];
    [summaryView addSubview:subtotalPriceLabel];
    [summaryView addSubview:taxPriceLabel];
    [summaryView addSubview:orderTotalPriceLabel];
    return summaryView;
}

- (UIView *)drawFooterButtons {
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 300, 320)];
    
    [footerView addSubview:[self drawFooterSummaryView]];
    UIButton *promotionButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 140, 290, 30)];
    [promotionButton setBackgroundImage:[UIImage imageNamed:@"bluebutton"] forState:UIControlStateNormal];

    [promotionButton setTitle:[self localString:@"order.viewPromotion"] forState:UIControlStateNormal];
    [promotionButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
    //completionButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    [promotionButton setTitleEdgeInsets:UIEdgeInsetsMake(8.0f, 0, 0, 0)];
    
    [promotionButton addTarget:self action:@selector(gotoPromotionScreen) forControlEvents:UIControlEventTouchDown];
    
    
    if ([displayData count] >0) {
        UIButton *orderCompletionButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 180, 290, 29)];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) filterInventoryContentForSearch:(NSString *)searchText{
    
    NSArray *searchArray = [productCollection allValues];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"productName CONTAINS[cd] %@ OR productSN CONTAINS[cd] %@ OR productDescription CONTAINS[cd] %@", searchText,searchText,searchText];
    
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

-(void)updatePromotion:(NSString *)promotionKey withQuantity:(float)Quantity {
    TCPromotionItem *promotionitem  = [promotionItems objectForKey:promotionKey];
    if (promotionitem) {
        promotionitem.unitNum = Quantity;
        [promotionItems setObject:promotionitem forKey:promotionKey];
    }
    
}
-(void)updateProduct:(NSString *)productSN withQuantity:(NSString *)productQuantity {
    ProductItemObject *productItem = [productCollection objectForKey:productSN];
    if (productItem) {
        productItem.productUnitNum = productQuantity;
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
        cell.unitPrice.text = productItem.productPrice;
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



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *orderTableCell = @"InventoryTableCell";
    NSInteger sectionId = [indexPath section];
     
    if ([self isPromotionItem:indexPath inSection:sectionId]) {
        //generate promotionItemCell and return Here;
               
        NSInteger indexInPromotionArray = indexPath.row - [displayData count];
        NSString *itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
        
        if (itemKey) {
            TCPromotionItem *pi = [promotionItems objectForKey:itemKey];
            if (pi && pi.type == PromotionTypeDiscountOrder) {
                // this is total discount order promotion item, use promotion table cell to render
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
            } else {
                // is common promotion item, need the cell style with steppers
                InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:@"promotionCommonCell"];
                if(cell ==nil) {
                    cell = [[InventoryTableCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"promotionCommonCell"];
                    cell = [[[NSBundle mainBundle] loadNibNamed:orderTableCell owner:nil options:nil] lastObject];
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
            
        }
        
        
    }else {
        
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:@"orderProductItemCell"];
    if(cell ==nil) {
       // NSArray *nib = [[NSBundle mainBundle] loadNibNamed:orderTableCell owner:self options:nil] ;
       // cell = [nib objectAtIndex:0];
        cell = [[InventoryTableCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderProductItemCell"];
        cell = [[[NSBundle mainBundle] loadNibNamed:orderTableCell owner:nil options:nil] lastObject];
        [cell.contentView sendSubviewToBack:cell.vwDelete];
        cell.vwDelete.hidden=YES;
    }
    
    UIStepper *numStepper = cell.stepper;
    [numStepper addTarget:self action:@selector(updateUnitLabel:) forControlEvents:UIControlEventValueChanged];
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
}

-(void) calculatePrice {
    [self clearPrice];
    [self calculateOrderTotal];

}

-(void) calculateProductsPrice {
    for (NSString *productSN in displayData) {
        ProductItemObject *productObject = (ProductItemObject *)[productCollection objectForKey:productSN];
        if (![productObject.productUnitNum isEqualToString: @"0"]) {
            self.fproductTotal += [productObject.productUnitNum doubleValue]*[productObject.productPrice doubleValue];
            //self.fproductTotal += [productObject.productUnitNum doubleValue]*1;
        }

    }
}

-(void) calculateDiscounts {
    [self calculateProductsPrice];
    CGFloat discountPercentage = [self getDiscountPercentage];
    self.fdiscount = discountPercentage * self.fproductTotal;
}

-(void) calculateTax {
    [self calculateSubtotal];
    CGFloat taxRate = self.currentStore.taxRate;
    self.ftax = self.fsubtotal * taxRate;
}

-(void) calculateSubtotal {
    [self calculateDiscounts];
    self.fsubtotal = self.fproductTotal - self.fdiscount;
}
-(void) calculateOrderTotal {
    [self calculateTax];
    self.fordertotal = self.fsubtotal + self.ftax;
}
@end
