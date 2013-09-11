//
//  TCComboVw.h
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCComboVw;
typedef void(^TCComboVwCallback)(TCComboVw * picker);

@interface TCComboVw : UIActionSheet

- (NSUInteger) selectedRow;

- (NSString *) selectedItem;
- (void) setDataSource:(NSArray *)ds;

- (void) setCompletionCallback:(TCComboVwCallback)callback;

- (void)show;

+ (TCComboVw *) instance;
+ (TCComboVw *) instance:(id)delegate callback:(TCComboVwCallback)callback;
+ (TCComboVw *) instance:(id)delegate;
+ (TCComboVw *) instanceWithDataSource:(NSArray *)ds;

@end
