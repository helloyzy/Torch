//
//  UIViewController+MGBox.h
//  Torch
//
//  Created by Yuan Mai on 9/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MGBox.h>
#import <MGLine.h>

@interface UIViewController (MGBox)

- (UILabel *)cell:(NSString *)text numberOfLines:(int)numberOfLines textColor:(UIColor *)textColor size:(CGSize const)size;

- (MGLine *)sectionHeader:(NSString *)title backgroundColor:(UIColor *)backgroundColor underlineColor:(UIColor *)underlineColor fontName:(NSString *)font;

- (MGLine *)lineWithHeight:(int)height color:(UIColor *)color;

- (MGLine *)getLine:(NSString *)title backgroundColor:(UIColor *)backgroundColor underlineColor:(UIColor *)underlineColor font:(UIFont *)font size:(CGSize)size numberOfLines:(int)numberOfLines;

@end
