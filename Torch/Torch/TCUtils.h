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

NSString *millisecondToDateStr(double milliseconds);
NSNumber *dateStrToMilliseconds(NSString * dateStr);

void showAlert(NSString * title, NSString * message, id<UIAlertViewDelegate> delegate);

void showProgressIndicator(NSString * title, NSString * message);
void hideProgressIndicator();

void registerLocationService(id<CLLocationManagerDelegate> delegate);