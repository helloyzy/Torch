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
@property (nonatomic,weak) IBOutlet UILabel *orderSummary;
@property (nonatomic,weak) IBOutlet UILabel *orderAmount;

@end

@implementation TCOrderViewController
{
    UIView *seperator1;
    NSMutableArray *displayData;
    NSArray *searchResults;
    NSMutableDictionary *productCollection;
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
    if ([displayData count] > 0) {
        display = YES;
    }
    return display;
}


-(void)showInitialORProductTableListView {
    
    if (![self doesTableViewDisplayRequired]) {
        self.tableView.hidden = YES;
        self.orderSummary.text = [self localString:@"order.emptySummary"];
        self.orderAmount.text = [self localString:@"order.summaryAmount"];
    }else {
        self.tableView.hidden = NO;
        seperator1.hidden = YES; 
        self.orderSummary.text = @"";
        self.orderAmount.text = @"";
    }
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
    
    UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 2)];
    seperator.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];

    seperator1 = [[UIView alloc] initWithFrame:CGRectMake(10, 140, 300, 2)];
    seperator1.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    [self.view addSubview:seperator];
    [self.view addSubview:seperator1];
    
    [self popupProductItems];
    [self showInitialORProductTableListView];
    
    for (UIView *view in [self.searchBar subviews]) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)view;
            tf.delegate = self;
            break;
        }
    }
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
    // searchResults = [tableData filteredArrayUsingPredicate:resultPredicate];
    searchResults = [searchResultsMutableArray copy];
    
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] ==0) {
        NSLog(@"wo shi ling");
        [searchBar resignFirstResponder];
    } else {
        [self filterInventoryContentForSearch:searchText];
        displayData = [searchResults copy];
        NSLog(@"%@", searchText);
        [self showInitialORProductTableListView];
        [self.tableView reloadData];
    }
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //[searchBar setText:@""];
    [searchBar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    //searchBar.text= @"";
    NSLog(@"I am clicked");
    [searchBar resignFirstResponder];
    //[searchBar setShowsCancelButton:NO];
   
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
    itemKey = [displayData objectAtIndex:indexPath.row];

    
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

-(void)cellSwiped:(UIGestureRecognizer *)gestureRecognizer {
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"swipe just happened");
        InventoryTableCell *cell = (InventoryTableCell *)gestureRecognizer.view;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        NSLog(@"%@",indexPath);
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *orderTableCell = @"InventoryTableCell";
    
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:orderTableCell];
    
    if(cell ==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:orderTableCell owner:self options:nil] ;
        cell = [nib objectAtIndex:0];
    }
  
    UIStepper *numStepper = cell.stepper;
   [numStepper addTarget:self action:@selector(updateUnitLabel:) forControlEvents:UIControlEventValueChanged];
    
    //add swipe gesture to delete
    
    UISwipeGestureRecognizer *sgr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwiped:)];
    [sgr setDirection:UISwipeGestureRecognizerDirectionLeft];
    [cell addGestureRecognizer:sgr];
    
    NSString *itemKey;
    
    itemKey = [displayData objectAtIndex:indexPath.row];
    
    [self populateCell:cell withKeyName:itemKey];
    NSLog(@"yes");
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 114;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
       NSLog(@"2222");
    NSLog(@"%i", [displayData count]);
    return [displayData count];
}

-(BOOL) textFieldShouldClear:(UITextField *)textField {
    [self performSelector:@selector(searchBarCancelButtonClicked:) withObject:self.searchBar afterDelay:0];
    return YES;
}


@end
