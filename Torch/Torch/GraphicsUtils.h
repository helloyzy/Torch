//
//  GraphicsUtils.h
//  Torch
//
//  Created by Whitman Yang on 8/27/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TCColorLineBlue [UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1]
#define TCColorSubtitleGray [UIColor colorWithWhite:0.667 alpha:1.000]

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

// create a clear color image
UIImage * clearColorImage(CGRect rect);

