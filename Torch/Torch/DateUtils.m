//
//  DateUtils.m
//  HersheySSO
//
//  Created by Daniel Miller on 2/29/12.
//  Copyright (c) 2012 The Hershey Company. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

+ (NSDate *) dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	[dateFormatter setDateFormat:format];
	NSDate *date = [dateFormatter dateFromString:string];
	return date;
}

+ (NSString *) stringFromDate:(NSDate *)date withFormat:(NSString *)format; {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	[dateFormatter setDateFormat:format];
	NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSDate *) dateWithTimeout:(NSTimeInterval)timeout {
    NSDate *now = [NSDate date];
    NSDate *timeoutDate = [now dateByAddingTimeInterval:timeout];
    return timeoutDate;
}

+ (BOOL) dateInPast:(NSDate *)date {
    if ([date compare:[NSDate date]] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

@end
