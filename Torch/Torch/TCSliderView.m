//
//  TCSliderView.m
//  SingleView
//
//  Created by Whitman Yang on 8/28/13.
//  Copyright (c) 2013 Whitman Yang. All rights reserved.
//

#import "TCSliderView.h"
#import <QuartzCore/QuartzCore.h>

NSString * localString(NSString * key) {
    return NSLocalizedString(key, nil);
}

@interface TCSliderView () {
    TCSliderViewDirection _direction;
}

@end

@implementation TCSliderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initInternal];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initInternal];
    }
    return self;
}

-(void) awakeFromNib
{
    [self initInternal];
}

- (void) initInternal {
    [self initCtl];
}

- (void) initCtl {

    /**
    if (slider || lbl) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    } */
    
    startImg = [UIImage imageNamed:@"slidestart.png"];
    endImg = [UIImage imageNamed:@"slideend.png"];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectZero];
    lbl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    lbl.textColor = [UIColor colorWithRed:61/255.0f green:111/255.0f blue:153/255.0f alpha:0.8];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.backgroundColor = [UIColor clearColor];
    lbl.font = [UIFont systemFontOfSize:24];
    [self addSubview:lbl];

    slider = [[UISlider alloc] initWithFrame:CGRectZero];
    slider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    slider.backgroundColor = [UIColor clearColor];
    UIImage *clearImage = [self clearPixel];
    [slider setMaximumTrackImage:clearImage forState:UIControlStateNormal];
    [slider setMinimumTrackImage:clearImage forState:UIControlStateNormal];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.continuous = YES;
    [self addSubview:slider];
    
    // Set the slider action methods
    [slider addTarget:self
                action:@selector(sliderUp:)
      forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self
                action:@selector(sliderUp:)
      forControlEvents:UIControlEventTouchUpOutside];
    [slider addTarget:self
                action:@selector(sliderDown:)
      forControlEvents:UIControlEventTouchDown];
    [slider addTarget:self
                action:@selector(sliderChanged:)
      forControlEvents:UIControlEventValueChanged];
    
    _direction = TCSliderViewDirectionForward;
    [self onDirectionChanged];
    
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
    
    self.layer.cornerRadius = 8.0f; // make the view round corner
}

- (UIImage *) clearPixel {
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat sliderWidth = [slider thumbImageForState:slider.state].size.width;
    CGSize labelSize = [lbl sizeThatFits:self.bounds.size];
    
    CGFloat lblX = _direction == TCSliderViewDirectionForward ? sliderWidth + 5.0 : 5.0;
    CGFloat lblY = CGRectGetMidY(self.bounds) - (labelSize.height / 2.0);
    CGFloat lblW = CGRectGetWidth(self.bounds) - sliderWidth - 15.0;
    CGFloat lblH = labelSize.height;
    lbl.frame = CGRectMake(lblX, lblY, lblW, lblH);
    slider.frame = CGRectMake(3.0, 0, self.bounds.size.width - 6.0, self.bounds.size.height);
}

#pragma mark - direction related

- (void)setDirection:(TCSliderViewDirection)direction {
    if (_direction != direction) {
        _direction = direction;
        [self onDirectionChanged];
        [self setNeedsLayout];
    }
}

- (void)onDirectionChanged {
    if (_direction == TCSliderViewDirectionForward) {
        lbl.text = @"Slide to start";
        [slider setThumbImage:startImg forState:UIControlStateNormal];
        slider.value = 0;
    } else {
        lbl.text = @"Slide to end";
        [slider setThumbImage:endImg forState:UIControlStateNormal];
        slider.value = 1;
    }
    lbl.alpha = 1;
}

- (void)changeDirection:(BOOL)flag {
    if (flag) {
        // switch direction
        TCSliderViewDirection temp = _direction == TCSliderViewDirectionForward ? TCSliderViewDirectionBackward : TCSliderViewDirectionForward;
        self.direction = temp;
    } else {
        // reset slider value if not change direction
        CGFloat sliderValue = _direction == TCSliderViewDirectionForward ? 0 : 1;
        [slider setValue:sliderValue animated:YES];
        lbl.alpha = 1;
    }
}

#pragma mark - UISlider actions

- (void) sliderUp:(UISlider *)sender {
//    BOOL shouldChangeDirection = NO;
//    if (_direction == TCSliderViewDirectionForward) {
//        if (slider.value == 1.0) {
//            shouldChangeDirection = [self.delegate sliderDidSlideToEnd:self];
//        }
//        if (shouldChangeDirection) {
//            [self setDirection:TCSliderViewDirectionBackward];
//        } else {
//            [slider setValue:0.0 animated: YES];
//        }
//        // lbl.alpha = 1.0;
//    } else { // backward
//        if (slider.value == 0.0) {
//            shouldChangeDirection = [self.delegate sliderDidSlideToStart:self];
//        }
//        if (shouldChangeDirection) {
//            [self setDirection:TCSliderViewDirectionForward];
//        } else {
//            [slider setValue:1.0 animated:YES];
//        }
//        // lbl.alpha = 1.0;
//    }
//    if (!shouldChangeDirection) {
//        lbl.alpha = 1.0;
//    }
    
    if (_direction == TCSliderViewDirectionForward && slider.value == 1) {
        [self.delegate sliderDidSlideToEnd:self];
    } else if (_direction == TCSliderViewDirectionBackward && slider.value == 0) {
        [self.delegate sliderDidSlideToStart:self];
    } else {
        [self changeDirection:NO];
    }
}

- (void) sliderDown:(UISlider *)sender {
}

- (void) sliderChanged:(UISlider *)sender {
    lbl.alpha = _direction==TCSliderViewDirectionForward ? MAX(0.0, 1.0 - (slider.value * 3.5)) : MAX(0.0, 1.0 - ((1 -slider.value) * 3.5));
}


@end
