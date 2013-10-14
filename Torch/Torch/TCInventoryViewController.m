//
//  TCInventoryViewController.m
//  Torch
//
//  Created by bo hu on 8/21/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCInventoryViewController.h"
#import "InventoryTableCell.h"
#import "ProductItemObject.h"
#import "Product.h"
#import <NSManagedObject+InnerBand.h>
#import "TCDBUtils.h"
#import "Store.h"
#import "StoreCall.h"
#import "TCUtils.h"

@interface TCInventoryViewController ()
@property (nonatomic, weak) IBOutlet UILabel *inventoryLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *summaryText;
@property (nonatomic, weak) IBOutlet UILabel *summaryAmount;


@end

@implementation TCInventoryViewController {
    UIView *seperator1;
    NSMutableArray *displayData;
    NSArray *searchResults;
    NSMutableDictionary *productCollection;
    NSArray *productItems;
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
      //  _stores = [Store allInStore:[TCDBUtils ibDataStore]];
    productItems = [Product allInStore:[TCDBUtils ibDataStore]];
    
    productCollection = [[NSMutableDictionary alloc] initWithCapacity:[productItems count]];
    ProductItemObject *productItem;
    for (Product *product in productItems) {
        productItem = [ProductItemObject alloc];
        productItem.productName = product.packtype_Description;
        productItem.productSN = [NSString stringWithFormat:@"%@%@", @"#", product.name];
        productItem.productUnit = [self localString:@"product.itemunit"];
        productItem.productPrice = [NSString stringWithFormat:@"$%1.2f %@",product.productPrice, product.uPC_GROUP_PRODUCT_UOM_maybe];
        productItem.productUnitNum = @"0";
        productItem.productDescription = product.desp;
            
            [productCollection setObject:productItem forKey:productItem.productSN];
    }
    
    //create an array to used in tablecell loop
    NSMutableArray *productArray = [[NSMutableArray alloc] initWithCapacity:1];
    
    
    [self generateDisplayDataArray];
    productArray = nil;
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

-(BOOL) doesTableViewDisplayRequired {
    BOOL display = NO;
    if ([displayData count] > 0) {
        display = YES;
    }
    return display;
}

- (void) filterInventoryContentForSearch:(NSString *)searchText scope:(NSString *)scope {
    
    //NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
   
    
    NSArray *searchArray = [productCollection allValues];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"productName CONTAINS[cd] %@ OR productSN CONTAINS[cd] %@", searchText,searchText];
    
    NSArray *filterArray = [searchArray filteredArrayUsingPredicate:predicate1];
    NSMutableArray *searchResultsMutableArray = [[NSMutableArray alloc] init];
    
    for (ProductItemObject *productObject in filterArray) {
        [searchResultsMutableArray addObject: productObject.productSN];
        
    }
    // searchResults = [tableData filteredArrayUsingPredicate:resultPredicate];
    searchResults = [searchResultsMutableArray copy];
    
    //NSLog(@"%@",searchResults);
    
 
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    [self filterInventoryContentForSearch:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    
    if (![self doesTableViewDisplayRequired]) {
        self.tableView.hidden = YES;
    } else {

        self.tableView.hidden = NO;
    }

    return YES;
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

-(void)updateUnitLabel:(UIStepper *)sender{
    
    NSString *productQuantityValue = [NSString stringWithFormat:@"%g",sender.value];
    InventoryTableCell *currentCell = (InventoryTableCell *)[sender.superview superview];
    BOOL isUnderSearchResultView = NO;
    NSIndexPath *indexPath;
    NSString *itemKey;
    
    
    if ([self.searchDisplayController isActive]) {
        isUnderSearchResultView = YES;
    }
    
    if(isUnderSearchResultView) {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForCell:currentCell];
        itemKey = [searchResults objectAtIndex:indexPath.row];

    }else {
        indexPath = [self.tableView indexPathForCell:currentCell];
        itemKey = [displayData objectAtIndex:indexPath.row];

    }
    
    [self updateProduct:itemKey withQuantity:productQuantityValue];
    

    [self.searchDisplayController.searchResultsTableView reloadData];
    [self.tableView reloadData];

}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)showInitialORProductTableListView {
    
    if (![self doesTableViewDisplayRequired]) {
        self.tableView.hidden = YES;
        seperator1.hidden=NO;
    }else {
        self.tableView.hidden = NO;
        seperator1.hidden = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    // capture inventory take time
    StoreCall *call = [self.currentStore callInProgress];
    if (call) {
        call.inventoryTime = curdateToMilliseconds();
        [StoreCall save];
    }
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.inventoryLabel.text = [self localString:@"inventory.title"];
    self.inventoryLabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    self.inventoryLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:17];
    self.summaryText.text = [self localString:@"inventory.summaryText"];
    self.summaryAmount.text= [self localString:@"inventory.summaryAmount"];
    [self.summaryText setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16]];
    self.summaryText.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    [self.summaryAmount setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:16]];
    self.summaryAmount.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    
    
    UIView *sepertor = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 2)];
    
    sepertor.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    
    seperator1 = [[UIView alloc] initWithFrame:CGRectMake(10, 128, 300, 2)];
    seperator1.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    [self.view addSubview:sepertor];
    [self.view addSubview:seperator1];
    
    [self popupProductItems];
    [self showInitialORProductTableListView];
    [self.searchDisplayController.searchBar setPlaceholder:[self localString:@"order.searchplaceholder"]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return [displayData count];
    }
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *inventoryTableCell = @"InventoryTableCell";
    
    InventoryTableCell *cell = (InventoryTableCell *)[tableView dequeueReusableCellWithIdentifier:inventoryTableCell];
    
    if(cell ==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:inventoryTableCell owner:self options:nil] ;
        cell = [nib objectAtIndex:0];
        [cell sendSubviewToBack:cell.vwDelete];
    }
    UIStepper *numStepper = cell.stepper;
    [numStepper addTarget:self action:@selector(updateUnitLabel:) forControlEvents:UIControlEventValueChanged];
    [numStepper setContinuous:NO];
    NSString *itemKey;
    
    if(tableView ==self.searchDisplayController.searchResultsTableView) {
        itemKey = [searchResults objectAtIndex:indexPath.row];
    } else {
       itemKey = [displayData objectAtIndex:indexPath.row];
    }
    
    [self populateCell:cell withKeyName:itemKey];
    [self hideTheDeleteButton:cell hidden:YES];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 116;
}


- (void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView {
    [self generateDisplayDataArray];

    [self.tableView reloadData];
    [self showInitialORProductTableListView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

-(void)inventoryCompletionButtonClicked:(UIButton *)sender {
    NSLog(@"Yes, I am clicked");
    for (id key in productCollection) {
        ProductItemObject *productObject = (ProductItemObject *)[productCollection objectForKey:key];
        if (![productObject.productUnitNum isEqualToString: @"0"]) {
            NSLog(@"product SN===%@",productObject.productSN);
        }
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
     if(tableView != self.searchDisplayController.searchResultsTableView) {
         footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
         UIButton *completionButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 305, 30)];
         UIImage *buttonImage = [UIImage imageNamed:@"bluebutton"];
         [completionButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
         [completionButton setTitle:[self localString:@"inventory.completionButtonText"] forState:UIControlStateNormal];
         [completionButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:14]];
         //completionButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
         [completionButton setTitleEdgeInsets:UIEdgeInsetsMake(8.0f, 0, 0, 0)];
         [completionButton addTarget:self action:@selector(inventoryCompletionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
         [footerView addSubview:completionButton];
     }

    return footerView;
}



@end
