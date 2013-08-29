//
//  TCSliderView.h
//  SingleView
//
//  Created by Whitman Yang on 8/28/13.
//  Copyright (c) 2013 Whitman Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TCSliderViewDirectionForward = 1,
    TCSliderViewDirectionBackward = 2
} TCSliderViewDirection;

@protocol TCSliderViewDelegate;

@interface TCSliderView : UIView {
    UISlider * slider;
    UILabel * lbl;
    UIImage * startImg;
    UIImage * endImg;
}

@property(nonatomic, weak) IBOutlet id<TCSliderViewDelegate> delegate;
@property(nonatomic, assign) TCSliderViewDirection direction;
@property(nonatomic, copy) NSString * startText;
@property(nonatomic, copy) NSString * endText;

- (void)changeDirection:(BOOL)flag;

@end

@protocol TCSliderViewDelegate <NSObject>

@required
- (void) sliderDidSlideToEnd:(TCSliderView *)slideView;
- (void) sliderDidSlideToStart:(TCSliderView *)slideView;

@end
