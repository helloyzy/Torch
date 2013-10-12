//
//  GraphicsUtils.h
//  Torch
//
//  Created by Whitman Yang on 8/27/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGLine.h"
#import <Foundation/NSBundle.h>

#define TCColorLineBlue [UIColor colorWithRed:48.0/255 green:96.0/255 blue:144.0/255 alpha:1]
#define TCColorSubtitleGray [UIColor colorWithWhite:0.667 alpha:1.000]
#define TCColorTitleBlue [UIColor colorWithRed:208.0/255 green:224.0/255 blue:232.0/255 alpha:1]
#define TCColorTitleGray  [UIColor colorWithWhite:73.0/255 alpha:1]
#define TCColorProgressBlue [UIColor colorWithRed:61.0/255 green:111.0/255 blue:153.0/255 alpha:1]
#define TCColorProgressLtBlue [UIColor colorWithRed:139.0/255 green:181.0/255 blue:205.0/255 alpha:1]
#define Lo(x) NSLocalizedString(@ #x, nil)

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

// create a clear color image
UIImage * clearColorImage(CGRect rect);

MGLine *mgline(UIView* leftView);
MGLine *padding(MGLine* line);
UIButton *blueButton(NSString* title);