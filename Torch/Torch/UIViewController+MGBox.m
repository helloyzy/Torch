//
//  UIViewController+MGBox.m
//  Torch
//
//  Created by Yuan Mai on 9/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "UIViewController+MGBox.h"
#import "GraphicsUtils.h"

static const CGSize rowSize = (CGSize){320, 35};
static const CGSize cellSize = (CGSize){(320-32)/3, 50};

@implementation UIViewController (MGBox)

- (UILabel *)cell:(NSString *)text numberOfLines:(int)numberOfLines textColor:(UIColor *)textColor size:(CGSize const)size {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = numberOfLines;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    label.text = text;
    label.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:16];
    return label;
}

- (MGLine *)sectionHeader:(NSString *)title backgroundColor:(UIColor *)backgroundColor underlineColor:(UIColor *)underlineColor fontName:(NSString *)font {
    CGSize size = (CGSize) {280, 20};
    return [self getLine:title backgroundColor:backgroundColor underlineColor:underlineColor font:[UIFont fontWithName:font size:17] size:size numberOfLines:1];

}

- (MGLine *)getLine:(NSString *)title backgroundColor:(UIColor *)backgroundColor underlineColor:(UIColor *)underlineColor font:(UIFont *)font size:(CGSize)size numberOfLines:(int)numberOfLines {
    UILabel* label = [self cell:title numberOfLines:numberOfLines textColor:TCColorLineBlue size:size];
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;

    MGLine *line = [MGLine lineWithLeft:label right:nil size:rowSize];
    line.topPadding = line.leftPadding = 16;
    line.borderStyle = MGBorderEtchedBottom;
    line.backgroundColor = backgroundColor;
    line.bottomBorderColor = underlineColor;
    return line;
}

- (MGLine *)lineWithHeight:(int)height color:(UIColor *)color {
    MGLine *pad = [MGLine lineWithSize:(CGSize){320, height}];
    pad.backgroundColor = color;
    return pad;
}

@end