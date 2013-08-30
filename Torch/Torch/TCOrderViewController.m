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

-(void)slideInDeletionButton:(UITableViewCell *)cell {
    UIView *blankView = [[UIView alloc]initWithFrame:CGRectMake(200, 0, 50, 40)];
    [blankView setBackgroundColor:[UIColor whiteColor]];
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    deleteButton.frame =  CGRectMake(20, 30, 150, 50);
    [deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    deleteButton.backgroundColor = [UIColor blueColor];
    [blankView addSubview:deleteButton];
    [cell.contentView addSubview:blankView];
    //[cell addSubview:deleteButton];
}


-(void)cellSwiped:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"swipe just happened");
        InventoryTableCell *cell = (InventoryTableCell *)gestureRecognizer.view;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        NSInteger sectionId = [indexPath section];
        if (![self isInSearchResultSection:sectionId]) {
            NSLog(@"%@",indexPath);
            // [self slideInDeletionButton:cell];
            cell.vwDelete.hidden = NO;
            cell.productQuantity.hidden = YES;
            cell.productQuantityUnitLabel.hidden = YES;
            cell.stepper.hidden = YES;
            [cell.contentView bringSubviewToFront:cell.vwDelete];
        }

    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *orderTableCell = @"InventoryTableCell";
    
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:orderTableCell];
    
    if(cell ==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:orderTableCell owner:self options:nil] ;
        cell = [nib objectAtIndex:0];
        [cell.contentView sendSubviewToBack:cell.vwDelete];
        cell.vwDelete.hidden=YES;
    }
  
    UIStepper *numStepper = cell.stepper;
   [numStepper addTarget:self action:@selector(updateUnitLabel:) forControlEvents:UIControlEventValueChanged];
    
    NSInteger sectionId = [indexPath section];
    
    


    NSString *itemKey;
    if ([self isInSearchResultSection:sectionId]) {
        itemKey = [searchResults objectAtIndex:indexPath.row];
    } else {
        itemKey = [displayData objectAtIndex:indexPath.row];
        
        //add swipe gesture to delete
        UISwipeGestureRecognizer *sgr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwiped:)];
        [sgr setDirection:UISwipeGestureRecognizerDirectionLeft];
        [cell addGestureRecognizer:sgr];
    }
    [self populateCell:cell withKeyName:itemKey];
    cell.backgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    return cell;
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 114;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self isInSearchResultSection:section]) {
        return [searchResults count];
    } else {
        return [displayData count];
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
    return [self drawOrderItemSummary:[displayData count] withOrderAmountText:@"$0.00"];
}

@end
