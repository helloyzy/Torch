//
//  TCPriorityViewController.m
//  Torch
//
//  Created by bo hu on 8/19/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCPriorityViewController.h"

@interface TCPriorityViewController ()
@property (nonatomic, weak) IBOutlet UILabel *storeNameLable;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TCPriorityViewController
{
    NSArray *tableData;
}

+ (void) createHorizontalLine {
        
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
    self.storeNameLable.text = @"BOHU STORE";
    self.storeNameLable.textColor = [UIColor colorWithRed:0.263 green:0.549 blue:0.773 alpha:1];
    self.storeNameLable.font = [UIFont systemFontOfSize:20];
    tableData = [NSArray arrayWithObjects:@"Egg bendedict", @"Mushroom", @"Helloworld", nil];


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
    [view setBackgroundColor:[UIColor colorWithRed:0.827 green:0.945 blue:0.945 alpha:1]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,0,tableView.frame.size.width, 40)];
    label.text = @"Priorities";
    label.textColor = [UIColor colorWithRed:0.18 green:0.451 blue:0.765 alpha:1];
    label.font = [UIFont boldSystemFontOfSize:19];
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    UIView *sepertor = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
    sepertor.backgroundColor = [UIColor colorWithRed:0.2 green:0.478 blue:0.773 alpha:1];
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
   
	cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"MR. hellow";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(28,0,cell.frame.size.width, cell.frame.size.height)];
    //label.text = [tableData objectAtIndex:indexPath.row];
    //[cell addSubview:label];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [messageAlert show];
}

@end
