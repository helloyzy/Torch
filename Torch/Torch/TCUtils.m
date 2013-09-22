//
//  TCUtils.m
//  Torch
//
//  Created by Whitman Yang on 9/16/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCUtils.h"
#import "DateUtils.h"

#import "MBProgressHUD.h"

NSString * millisecondToDateStr(double milliseconds) {
    double seconds = milliseconds / 1000.0;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:seconds];
    return [DateUtils stringFromDate:date withFormat:kDateFormatShort];
}

void showAlert(NSString * title, NSString * message, id<UIAlertViewDelegate> delegate) {
    NSString * OKCaption = NSLocalizedString(@"OK", nil);
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:OKCaption otherButtonTitles:nil,nil];
	[alert show];
}


static MBProgressHUD * gProgressHUD;

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