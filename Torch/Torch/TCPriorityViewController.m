//
//  TCPriorityViewController.m
//  Torch
//
//  Created by bo hu on 8/19/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPriorityViewController.h"
#import "TCPriorityObject.h"
#import "Store.h"
@interface TCPriorityViewController ()
@property (nonatomic, weak) IBOutlet UILabel *storeNameLable;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TCPriorityViewController
{
    NSArray *tableData;
}

-(NSArray *)populatePriorityData {
    NSMutableArray *priorityDataArray = [[NSMutableArray alloc] init];
    
    TCPriorityObject *priority1 = [TCPriorityObject new];
    priority1.priorityTitle =   @"Helloworld";
    priority1.priorityDescription = @"This is a new fancy world, do you like it or now? welcome to the world of ios";
    [priorityDataArray addObject:priority1];
    
    TCPriorityObject *priority2 = [TCPriorityObject new];
    priority2.priorityTitle =   @"Nota Anaota";
    priority2.priorityDescription = @"$345 value product should be checked without hesitation";
    [priorityDataArray addObject:priority2];
    
    return priorityDataArray;
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
    NSLog(@"%@",self.currentStore.name);
    self.storeNameLable.text = self.currentStore.name;
    tableData = [self populatePriorityData];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
		return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
		return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width, 40)];
    [view setBackgroundColor:[UIColor colorWithRed:0.816 green:0.878 blue:0.91 alpha:1]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,8,tableView.frame.size.width, 40)];
    label.text = [self localString:@"priority.title"];
    label.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
    label.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    UIView *sepertor = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    sepertor.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    [view addSubview:sepertor];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriorityCell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"PriorityCell"];
    }
   
    TCPriorityObject *priorityObject = [tableData objectAtIndex:indexPath.row];
	cell.textLabel.text = priorityObject.priorityTitle;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
    cell.detailTextLabel.text = priorityObject.priorityDescription;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     TCPriorityObject *priorityObject = [tableData objectAtIndex:indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:priorityObject.priorityTitle message:priorityObject.priorityDescription delegate:nil cancelButtonTitle:[self localString:@"priority.buttonName"] otherButtonTitles:nil, nil];
     //   UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HersheysBG"]];
    //image.frame = CGRectMake(0, 0, messageAlert.frame.size.height,messageAlert.frame.size.width);
    //image.contentMode = UIViewContentModeScaleToFill;
   //[messageAlert addSubview:image];
   // [messageAlert sendSubviewToBack:image];
    
    [messageAlert show];
}

@end
