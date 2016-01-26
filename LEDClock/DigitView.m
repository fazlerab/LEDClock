//
//  DigitView.m
//  LEDClock
//
//  Created by Imran on 11/13/15.
//  Copyright © 2015 Fazle Rab. All rights reserved.
//

#import "DigitView.h"
#import "SegmentView.h"

@interface DigitView ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet SegmentView *topSegment;
@property (weak, nonatomic) IBOutlet SegmentView *centerSegment;
@property (weak, nonatomic) IBOutlet SegmentView *bottomSegment;
@property (weak, nonatomic) IBOutlet SegmentView *topLeftSegment;
@property (weak, nonatomic) IBOutlet SegmentView *topRightSegment;
@property (weak, nonatomic) IBOutlet SegmentView *bottomLeftSegment;
@property (weak, nonatomic) IBOutlet SegmentView *bottomRightSegment;

@end

@implementation DigitView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    //NSLog(@"DigitView.initWithFrame");
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    //NSLog(@"DigitView.initWithCoder");
    return self;
}

- (void) setup {
    self.contentView = [self loadViewFromNib];
    self.contentView.frame = [self bounds];
    self.contentView.autoresizingMask = UIViewAutoresizingNone;
    [self addSubview:self.contentView];
}

- (UIView *) loadViewFromNib {
    NSBundle *bundle = [NSBundle mainBundle];
    UINib *nib = [UINib nibWithNibName:@"DigitView" bundle:bundle];
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    return view;
}

- (void) setDigit:(NSUInteger)digit {
    //NSLog(@"setDigit: %lu", digit);
    if (digit <= 9) {
        _digit = digit;
        [self lightUpSegments];
    }
    else {
        [NSException raise:@"IllegalArgumetException" format:@"'%lu' is an invalid argument. Valid argument is between '0' and '9'", digit];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) lightUpSegments {
    //NSLog(@"lightUpSegments: digit=%lu", self.digit);
    NSUInteger d = self.digit;
    
    self.topSegment.on = (d != 1) && (d != 4);
    
    self.topLeftSegment.on = (d != 1) && (d != 2) && (d != 3) && (d != 7);
    
    self.topRightSegment.on = (d != 5) && (d != 6);
    
    self.centerSegment.on = (d != 0) && (d != 1) && (d != 7);
    
    self.bottomLeftSegment.on  = (d == 0) || (d == 2) || (d == 6) || (d == 8);
    
    self.bottomRightSegment.on = (d != 2);
    
    self.bottomSegment.on = (d != 1) && (d != 4) && (d != 7);
    
    [self setNeedsDisplay];
}
@end
