//
//  TCUtils.m
//  Torch
//
//  Created by Whitman Yang on 9/16/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCUtils.h"
#import "DateUtils.h"

NSString * millisecondToDateStr(double milliseconds) {
    double seconds = milliseconds / 1000.0;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:seconds];
    return [DateUtils stringFromDate:date withFormat:kDateFormatShort];
}

void showAlert(NSString * title, NSString * message) {
    NSString * OKCaption = NSLocalizedString(@"OK", nil);
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:OKCaption otherButtonTitles:nil,nil];
	[alert show];
}