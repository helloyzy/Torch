//
//  TCUtils.m
//  Torch
//
//  Created by Whitman Yang on 9/16/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCUtils.h"
#import "DateUtils.h"
#import <CoreLocation/CoreLocation.h>

#import "MBProgressHUD.h"

#pragma mark - date to milliseconds conversion

NSString *millisecondToDateStr(double milliseconds) {
    double seconds = milliseconds / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    return [DateUtils stringFromDate:date withFormat:kDateFormatShort];
}

NSNumber *dateStrToMilliseconds(NSString * dateStr) {
    NSDate *date = [DateUtils dateFromString:dateStr withFormat:kDateFormatShort];
    double seconds = [date timeIntervalSince1970];
    double milliseconds = seconds * 1000.0;
    return [NSNumber numberWithDouble:milliseconds];
}

#pragma mark - alert view handy methods

void showAlert(NSString * title, NSString * message, id<UIAlertViewDelegate> delegate) {
    NSString * OKCaption = NSLocalizedString(@"OK", nil);
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:OKCaption otherButtonTitles:nil,nil];
	[alert show];
}

#pragma mark - progress indicator

static MBProgressHUD *gProgressHUD;

void showProgressIndicator(NSString * title, NSString * message) {
    if (!gProgressHUD) {
        gProgressHUD = [[MBProgressHUD alloc]initWithWindow:TC_WINDOW];
        gProgressHUD.removeFromSuperViewOnHide = YES;
        gProgressHUD.dimBackground = YES;
    }
    gProgressHUD.labelText = title;
    gProgressHUD.detailsLabelText = message;
    [TC_WINDOW addSubview:gProgressHUD];
    [gProgressHUD show:YES];
}

void hideProgressIndicator() {
    if (gProgressHUD && ![gProgressHUD isHidden]) {
        [gProgressHUD hide:YES];
    }
}

#pragma mark - location

static CLLocationManager *gLocationMgr;

void registerLocationService(id<CLLocationManagerDelegate> delegate) {
    if (!gLocationMgr) {
        gLocationMgr = [[CLLocationManager alloc] init];
    } else {
        [gLocationMgr stopUpdatingLocation];
    }
    gLocationMgr.delegate = delegate;
    gLocationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    [gLocationMgr startUpdatingLocation];
}

#pragma mark - device orientation

BOOL isDeviceOrientationLandscape() {
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    return UIDeviceOrientationIsLandscape(deviceOrientation);
}
BOOL isDeviceOrientationPortait() {
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    return UIDeviceOrientationIsPortrait(deviceOrientation);

}