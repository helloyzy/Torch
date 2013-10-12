//
//  GraphicsUtils.m
//  Torch
//
//  Created by Whitman Yang on 8/27/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "GraphicsUtils.h"
#import "MGLine.h"

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
//    CGPoint startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
//    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

UIImage * clearColorImage(CGRect rect) {
    // CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

MGLine *mgline(UIView* leftView) {
    return [MGLine lineWithLeft:leftView right:nil size:leftView.size];
}

MGLine *padding(MGLine* line) {
    int k = 10;
    line.padding = (UIEdgeInsets) {k,k,0,0};
    line.frame = (CGRect) {line.frame.origin.x, line.frame.origin.y, line.frame.size.width+k, line.frame.size.height+k};
    return line;
}

UIButton *blueButton(NSString* title) {
    CGRect btnFrame = CGRectMake(0, 0, 302, 35);
    UIButton * btn = [[UIButton alloc] initWithFrame:btnFrame];
    //btn.titleLabel.font = TCFont_HNLTComBd(14);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"bluebutton.png"] forState:UIControlStateNormal];
    btn.userInteractionEnabled = YES;
    return btn;
}