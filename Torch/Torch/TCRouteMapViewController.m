//
//  TCRouteMapViewController.m
//  Torch
//
//  Created by Yuan Mai on 8/20/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCRouteMapViewController.h"
#import <MapKit/MapKit.h>
#import "Store.h"
#import <OCTotallyLazy.h>

@interface TCRouteMapViewController ()

@end

@implementation TCRouteMapViewController {
    NSArray *_stores;
    Store *_store;
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
    self.mapView.delegate = self;
    /* CLLocationCoordinate2D endingCoord = CLLocationCoordinate2DMake(30.446947, 120.047607);
    MKPlacemark *endLocation = [[MKPlacemark alloc] initWithCoordinate:endingCoord addressDictionary:nil];
    MKMapItem *endingItem = [[MKMapItem alloc] initWithPlacemark:endLocation];
    
    NSMutableDictionary *launchOptions = [[NSMutableDictionary alloc] init];
    [launchOptions setObject:MKLaunchOptionsDirectionsModeDriving forKey:MKLaunchOptionsDirectionsModeKey];
    */
    // [endingItem openInMapsWithLaunchOptions:launchOptions];
}

- (void)centerMap {
    _stores = [Store sortedStores];
    _store = _stores[0];
    
    MKPointAnnotation* poi = [[MKPointAnnotation alloc] init];
     poi.coordinate = (CLLocationCoordinate2D) {_store.latitudeValue, _store.longitudeValue};
     poi.title = @"Hello";
     poi.subtitle = @"World";
     
     [self.mapView setRegion: [self.mapView regionThatFits: MKCoordinateRegionMakeWithDistance(poi.coordinate, 500, 500)]
     animated:true];
    if (self.mapView.annotations.count > 0) {
        [self.mapView removeAnnotations:self.mapView.annotations];
    }
    NSArray* storesHasLocation = [[_stores filter:^BOOL(Store *each) {
        return each.latitudeValue > 0;
    }] asArray];
    if (storesHasLocation.count > 0) {
        [self.mapView addAnnotations:storesHasLocation];
        [self.mapView setRegion:
         (MKCoordinateRegion){((id<MKAnnotation>) storesHasLocation[0]).coordinate,
             (MKCoordinateSpan){12.7, 12.7}} animated:NO];        
    }
    

    CLLocationCoordinate2D center;
	center.latitude = _store.latitudeValue;
	center.longitude = _store.longitudeValue;
	
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
    if (_stores.count > 0) { // Need to delay loading the first time
        [self centerMap];
    } else {
        [self performSelector:@selector(centerMap) withObject:nil afterDelay:3.01];
    }
    [super viewDidAppear:animated];
    
    /*CLLocationCoordinate2D centerLocation =
    CLLocationCoordinate2DMake(_store.latitudeValue, _store.longitudeValue);
    MKCoordinateSpan span = MKCoordinateSpanMake(12.7, 12.7);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerLocation, span);
    [self.mapView setRegion:region animated:NO];*/
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *annView = [[MKAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"ClientPin"];
    annView.image = [UIImage imageNamed:@"client-pin.png"];
    annView.canShowCallout = YES;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, annView.frame.size.width,annView.frame.size.height-10)];
    label.backgroundColor = [UIColor clearColor];
    if ([_stores containsObject:annotation]) {
        label.text = [NSString stringWithFormat:@"#%d", [_stores indexOfObject:annotation]+1];        
        NSLog(@"anno: %f %f %@", [annotation coordinate].latitude, [annotation coordinate].longitude, label.text);
    } else {
        return nil;
    }
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [annView addSubview:label];
    annView.calloutOffset = (CGPoint) {0, 48};
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    annView.rightCalloutAccessoryView = rightButton;
    return annView;
}

@end
