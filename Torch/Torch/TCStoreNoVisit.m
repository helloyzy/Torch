//
//  TCStoreNoVisit.m
//  Torch
//
//  Created by bo hu on 9/16/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCStoreNoVisit.h"
#import "TCStoreHomeView.h"

@interface TCStoreNoVisit ()

@property (nonatomic, weak) IBOutlet UILabel *novisitTitle;
@property (nonatomic,weak) IBOutlet UILabel *novisitHint;
@property (nonatomic,weak) IBOutlet UIPickerView *reasonPickup;
@property (nonatomic,weak) IBOutlet UIButton *confirmButton;

-(IBAction)confirmButtonPressed;
@end

@implementation TCStoreNoVisit {
    NSArray *noVisitReasonArray;
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
    
    self.novisitTitle.text = [self localString:@"store.novisit.title"];
    self.novisitHint.text = [self localString:@"store.novisit.hint"];
    [self.confirmButton setTitle:[self localString:@"store.novisit.confirm"] forState:UIControlStateNormal];
    UIView *sepertor = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 2)];
    sepertor.backgroundColor = [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
    [self.view addSubview:sepertor];
    
    noVisitReasonArray = [[NSArray alloc] initWithObjects:[self localString:@"store.novisit.reason1"],[self localString:@"store.novisit.reason2"], nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [noVisitReasonArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [noVisitReasonArray objectAtIndex:row];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(IBAction)confirmButtonPressed {
    //UINavigationController * temp = self.navigationController;
   // [temp popViewControllerAnimated:NO];
   // [temp popViewControllerAnimated:YES];
    NSInteger count = [[self.navigationController viewControllers] count];
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:count-2] animated:YES];
}

@end
