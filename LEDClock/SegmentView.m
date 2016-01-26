//
//  SegmentView.m
//  LEDClock
//
//  Created by Imran on 11/13/15.
//  Copyright © 2015 Fazle Rab. All rights reserved.
//

#import "SegmentView.h"
@interface SegmentView ()

@property (nonatomic, strong) UIColor *segmentColor;
@end

@implementation SegmentView
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup {
    self.segmentColor = [UIColor redColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void) setOn:(BOOL)on {
    _on = on;
    
    //UIColor *onColor = _on ? [UIColor redColor] : [UIColor clearColor];
    //[self setBackgroundColor: onColor];
    [self setNeedsDisplay];
}

- (void) awakeFromNib {
    [super awakeFromNib];
    [self setNeedsDisplay];
}


 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
     
     if (!self.isOn) return;
     
     [self.segmentColor setFill];
     
     UIBezierPath *path = [UIBezierPath bezierPath];
     int width = self.bounds.size.width;
     int height = self.bounds.size.height;
     int edge, offset;
     
     if (self.isVertical) {
         edge = width / 2;
         offset = edge;
         [path moveToPoint:CGPointMake(edge, offset)];
         [path addLineToPoint:CGPointMake(width, edge + offset)];
         [path addLineToPoint:CGPointMake(width, height - edge - offset)];
         [path addLineToPoint:CGPointMake(edge, height - offset)];
         [path addLineToPoint:CGPointMake(0, height - edge - offset)];
         [path addLineToPoint:CGPointMake(0, edge + offset)];
     } else {
         edge = height / 2;
         offset = edge;
         [path moveToPoint:CGPointMake(offset, edge)];
         [path addLineToPoint:CGPointMake(edge + offset, 0)];
         [path addLineToPoint:CGPointMake(width - edge - offset, 0)];
         [path addLineToPoint:CGPointMake(width - offset, edge)];
         [path addLineToPoint:CGPointMake(width - edge - offset, height)];
         [path addLineToPoint:CGPointMake(edge + offset, height)];
     }
     
     [path fill];
 }



@end
