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

@interface TCOrderViewController ()

@property (nonatomic,weak) IBOutlet UILabel *createOrderLabel;
@property (nonatomic,weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end

@implementation TCOrderViewController
{

    NSMutableArray *displayData;
    NSArray *searchResults;
    NSMutableDictionary *productCollection;
    NSMutableDictionary *promotionItems;
    NSMutableArray *displayPromotionItems;
}


-(void)regenerateDisplayPromotionItemArray {
    displayPromotionItems = [[NSMutableArray alloc] init];
    for (id key in promotionItems) {
        PromotionItem *promotionObject = (PromotionItem *)[promotionItems objectForKey:key];
        [displayPromotionItems addObject:promotionObject.key];
    }

}


-(void)setSelectedPromotionItem:(PromotionItem *)promotionItem {
    if(!promotionItems) promotionItems = [[NSMutableDictionary alloc] init];
    
    if(promotionItem) {
        NSString *key = promotionItem.key; 
        [promotionItems setObject:promotionItem forKey:key];
        [self regenerateDisplayPromotionItemArray];
        [self.tableView reloadData];
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
    productCollection = [[NSMutableDictionary alloc] initWithCapacity:5];
    ProductItemObject *productItem = [ProductItemObject alloc];
    productItem.productName = @"HerShey Chocolate1";
    productItem.productSN = @"#123456";
    productItem.productUnit = @"Boxes";
    productItem.productPrice = @"$4.32 per box";
    productItem.productUnitNum = @"0";
    productItem.productDescription = @"whatever";
    
    [productCollection setObject:productItem forKey:productItem.productSN];
    
    productItem = [ProductItemObject alloc];
    productItem.productName = @"HerShey Chocolate2";
    productItem.productSN = @"#121121";
    productItem.productUnit = @"Boxes";
    productItem.productPrice = @"$2.1 per box";
    productItem.productUnitNum = @"0";
    [productCollection setObject:productItem forKey:productItem.productSN];
    
    productItem = [ProductItemObject alloc];
    productItem.productName = @"HerShey Chocolate3";
    productItem.productSN = @"#121122";
    productItem.productUnit = @"Boxes";
    productItem.productPrice = @"$2.1 per box";
    productItem.productUnitNum = @"0";
    [productCollection setObject:productItem forKey:productItem.productSN];
    
    productItem = [ProductItemObject alloc];
    productItem.productName = @"HerShey Chocolate2";
    productItem.productSN = @"#121123";
    productItem.productUnit = @"Boxes";
    productItem.productPrice = @"$2.1 per box";
    productItem.productUnitNum = @"0";
    [productCollection setObject:productItem forKey:productItem.productSN];
    
    productItem = [ProductItemObject alloc];
    productItem.productName = @"HerShey Chocolate2";
    productItem.productSN = @"#121124";
    productItem.productUnit = @"Boxes";
    productItem.productPrice = @"$2.1 per box";
    productItem.productUnitNum = @"0";
    [productCollection setObject:productItem forKey:productItem.productSN];
    
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

-(void)gotoPromotionScreen {
    UIViewController *targetViewController = [[TCPromotionVwCtl alloc]init];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}

- (UIView *)drawFooterButtons {
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 300, 120)];
    
    
    UIButton *promotionButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 40, 290, 30)];
    [promotionButton setBackgroundImage:[UIImage imageNamed:@"bluebutton"] forState:UIControlStateNormal];

    [promotionButton setTitle:[self localString:@"order.viewPromotion"] forState:UIControlStateNormal];
    [promotionButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
    //completionButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    [promotionButton setTitleEdgeInsets:UIEdgeInsetsMake(8.0f, 0, 0, 0)];
    
    [promotionButton addTarget:self action:@selector(gotoPromotionScreen) forControlEvents:UIControlEventTouchDown];
    
    
    if ([displayData count] >0) {
        UIButton *orderCompletionButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 290, 29)];
        [orderCompletionButton setBackgroundImage:[UIImage imageNamed:@"bluebutton"] forState:UIControlStateNormal];
        
        [orderCompletionButton setTitle:[self localString:@"order.completionButton"] forState:UIControlStateNormal];
        [orderCompletionButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
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
        [self.tableView reloadData];
    }
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    searchResults = nil;
    [self generateDisplayDataArray];
    [self.tableView reloadData];
    //scroll the tableview to the top
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
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
    
    [self.tableView reloadData];
    
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
    [self.tableView reloadData];
}
-(void) deleteCurrentPromotionItem:(UIButton *)sender {
    
    
    TCPromotionTableCell *currentCell = (TCPromotionTableCell *)sender.superview.superview;
    
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    indexPath = [self.tableView indexPathForCell:currentCell];
    NSInteger indexInPromotionArray = indexPath.row - [displayData count];
    itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
    
    PromotionItem *promotionitem  = [promotionItems objectForKey:itemKey];
    if (promotionitem) {
        [promotionItems removeObjectForKey:itemKey];
    }
    
    [self regenerateDisplayPromotionItemArray];
    [self.tableView reloadData];
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
        TCPromotionTableCell *cell = (TCPromotionTableCell *)[tableView dequeueReusableCellWithIdentifier:@"TCPromotionTableCell"];
        if (!cell) {
            NSArray *nib  = [[NSBundle mainBundle] loadNibNamed:@"TCPromotionTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell.contentView sendSubviewToBack:cell.deleteButton];
            cell.deleteButton.hidden = YES;
        }
        
        NSInteger indexInPromotionArray = indexPath.row - [displayData count];
        NSString *itemKey = [displayPromotionItems objectAtIndex:indexInPromotionArray];
        
        if (itemKey) {
            PromotionItem *pi = [promotionItems objectForKey:itemKey];
            if (pi) {
                cell.promotionTitle.text = pi.name;
                cell.promotionDetails.text=pi.description;
            }
        }
        
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
        
    }else {
        
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:orderTableCell];
    if(cell ==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:orderTableCell owner:self options:nil] ;
        cell = [nib objectAtIndex:0];
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

}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger sectionId = [indexPath section];
    if ([self isPromotionItem:indexPath inSection:sectionId]) {
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
    return [self drawOrderItemSummary:itemCounts withOrderAmountText:@"$0.00"];
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
    return 140;
}

@end
