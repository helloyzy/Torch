//
//  TCRouteMapViewController.m
//  Torch
//
//  Created by Yuan Mai on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCRouteMapViewController.h"
#import <MapKit/MapKit.h>

@interface TCRouteMapViewController ()

@end

@implementation TCRouteMapViewController

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
//    self.mapView.delegate = self;

}

- (void)viewDidAppear:(BOOL)animated {
    MKPointAnnotation* poi = [[MKPointAnnotation alloc] init];
    poi.coordinate = (CLLocationCoordinate2D) {30.0, 30.0};
    poi.title = @"Hello";
    poi.subtitle = @"World";
    
    [self.mapView setRegion: [self.mapView regionThatFits: MKCoordinateRegionMakeWithDistance(poi.coordinate, 500, 500)]
                   animated:true];
    [self.mapView addAnnotation:poi];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
