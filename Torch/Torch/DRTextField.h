//
//  DRTextField.h
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRTextField : UITextField {
    __weak NSObject * _dataObject;
    NSString * _dataProperty;
}

-(void) setDataObject:(NSObject *)dataObject dataProperty:(NSString *)dataProperty;
+(DRTextField *) instance:(CGRect)frame data:(NSObject *)object prop:(NSString *)prop;

@property (nonatomic, readonly) NSObject * dataObject;
@property (nonatomic, readonly) NSString * dataProperty;

@end
