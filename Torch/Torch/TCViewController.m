//
//  TCViewController.m
//  Torch
//
//  Created by Yuan Mai on 8/19/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCViewController.h"

@interface TCViewController ()

@end

@implementation TCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    sliderVw.direction = TCSliderViewDirectionBackward;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) sliderDidSlideToEnd:(TCSliderView *)slideView {
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Are you sure to start" message:@"Are you sure to start" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"yes", nil];
    [alertView show];
    //    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"button index %d", buttonIndex);
    [sliderVw changeDirection:buttonIndex == 0 ? NO : YES];
}

- (void) sliderDidSlideToStart:(TCSliderView *)slideView {
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Are you sure to end" message:@"Are you sure to end" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"yes", nil];
    [alertView show];
    //    return YES;
}

@end
