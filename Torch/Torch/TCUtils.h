//
//  TCUtils.h
//  Torch
//
//  Created by Whitman Yang on 9/16/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TC_DEBUG 1

#define TC_WINDOW [[UIApplication sharedApplication] keyWindow]

@protocol CLLocationManagerDelegate;

NSDate *millisecondToDate(double milliseconds);
NSString *millisecondToDateStr(double milliseconds);
NSNumber *dateStrToMilliseconds(NSString * dateStr);
NSNumber *curdateToMilliseconds();
NSNumber *dateToMilliseconds(NSDate * date);

void showAlert(NSString * title, NSString * message, id<UIAlertViewDelegate> delegate);

void showProgressIndicator(NSString * title, NSString * message);
void hideProgressIndicator();

void registerLocationService(id<CLLocationManagerDelegate> delegate);

BOOL isDeviceOrientationLandscape();
BOOL isDeviceOrientationPortait();

UIScreen *SCREEN();
CGFloat SCREEN_HEIGHT();
CGFloat SCREEN_WIDTH();
UIWindow *WINDOW();
CGFloat WINDOW_HEIGHT();
CGFloat WINDOW_WIDTH();

CGFloat VIEW_B_X(UIView *view);
CGFloat VIEW_B_Y(UIView *view);
CGFloat VIEW_B_H(UIView *view);
CGFloat VIEW_B_W(UIView *view);
CGFloat VIEW_F_X(UIView *view);
CGFloat VIEW_F_Y(UIView *view);
CGFloat VIEW_F_H(UIView *view);
CGFloat VIEW_F_W(UIView *view);