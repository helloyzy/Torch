//
//  DateUtils.h
//  HersheySSO
//
//  Created by Daniel Miller on 2/29/12.
//  Copyright (c) 2012 The Hershey Company. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDateFormat @"yyyy-MM-dd HH:mm:ss"

@interface DateUtils : NSObject

+ (NSDate *) dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *) stringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSDate *) dateWithTimeout:(NSTimeInterval)timeout;
+ (BOOL) dateInPast:(NSDate *)date;

@end
