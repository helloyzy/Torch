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
    self.mapView.delegate = self;
}

- (void)centerMap {
    MKPointAnnotation* poi = [[MKPointAnnotation alloc] init];
     poi.coordinate = (CLLocationCoordinate2D) {30.0, 120.0};
     poi.title = @"Hello";
     poi.subtitle = @"World";
     
     [self.mapView setRegion: [self.mapView regionThatFits: MKCoordinateRegionMakeWithDistance(poi.coordinate, 500, 500)]
     animated:true];
     [self.mapView addAnnotation:poi];
    
    CLLocationCoordinate2D center;
	center.latitude = 30.34203;
	center.longitude = 30.08611;
	
	//declare span of map (height and width in degrees)
	MKCoordinateSpan span;
	span.latitudeDelta = .02;
	span.longitudeDelta = .01;
	
	//add center and span to a region,
	//adjust the region to fit in the mapview
	//and assign to mapview region
	MKCoordinateRegion region;
	region.center = center;
	region.span = span;
    //self.mapView.showsUserLocation = YES;
	//self.mapView.region = [self.mapView regionThatFits:region];
}

- (void)viewDidAppear:(BOOL)animated {
    //[self centerMap];
    [self performSelector:@selector(centerMap) withObject:nil afterDelay:3.01];
    [super viewDidAppear:animated];
    
    CLLocationCoordinate2D centerLocation =
    CLLocationCoordinate2DMake(39.016740, -5.93504);
    MKCoordinateSpan span = MKCoordinateSpanMake(12.7, 12.7);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerLocation, span);
    [self.mapView setRegion:region animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *annView = [[MKAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"ClientPin"];
    annView.image = [UIImage imageNamed:@"client-pin.png"];
    annView.canShowCallout = YES;
    annView.calloutOffset = (CGPoint) {10, 10};
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    annView.rightCalloutAccessoryView = rightButton;
    return annView;
}

@end
