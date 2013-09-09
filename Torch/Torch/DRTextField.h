//
//  DRTextField.h
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRTextField : UITextField

+(DRTextField *) instance:(CGRect)frame data:(NSObject *)object prop:(NSString *)prop;

@property (nonatomic, weak) NSObject * dataObject;
@property (nonatomic, copy) NSString * dataProperty;

@end
