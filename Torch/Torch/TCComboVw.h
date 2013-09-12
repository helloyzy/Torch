//
//  TCComboVw.h
//  Torch
//
//  Created by Whitman Yang on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TCComboVwStyleDefault,   // plain picker with an array of String as data source
    TCComboVwStyleShortDate
} TCComboVwStyle;

@class TCComboVw;
typedef void(^TCComboVwCallback)(TCComboVw * picker);

@interface TCComboVw : UIActionSheet

- (void) setCompletionCallback:(TCComboVwCallback)callback;
- (void) show;

// methods apply for TCComboVwStyleDefault
- (NSUInteger) selectedRow;
- (NSString *) selectedItem;
- (void) setDataSource:(NSArray *)ds;
+ (TCComboVw *) instance;
+ (TCComboVw *) instance:(id)delegate callback:(TCComboVwCallback)callback;
+ (TCComboVw *) instance:(id)delegate;
+ (TCComboVw *) instanceWithDataSource:(NSArray *)ds;

// methods apply for TCComboVwStyleShortDate
+ (TCComboVw *) shortDateInstance;
- (NSDate *) selectedDate;

@end
