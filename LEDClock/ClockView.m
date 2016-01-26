//
//  ClockView.m
//  LEDClock
//
//  Created by Imran on 11/13/15.
//  Copyright © 2015 Fazle Rab. All rights reserved.
//

#import "ClockView.h"
#import "DigitView.h"

@interface ClockView ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet DigitView *highHourDigit;
@property (weak, nonatomic) IBOutlet DigitView *lowHourDigit;
@property (weak, nonatomic) IBOutlet DigitView *highMinuteDigit;
@property (weak, nonatomic) IBOutlet DigitView *lowMinuteDigit;

@property (weak, nonatomic) IBOutlet UIView *upperDot;
@property (weak, nonatomic) IBOutlet UIView *lowerDot;
@property int timerCount;

@property (weak, nonatomic) NSTimer *timer;

@end

@implementation ClockView

- (instancetype) initWithFrame:(CGRect)frame {
    //NSLog(@"ClockView.initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    //NSLog(@"ClockView.initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
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
    UINib *nib = [UINib nibWithNibName:@"ClockView" bundle:bundle];
    UIView *view = [[nib instantiateWithOwner:self options:nil] firstObject];
    return view;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    
    CGAffineTransform xform = CGAffineTransformMakeRotation(M_PI / 4);
    self.upperDot.transform = xform;
    self.lowerDot.transform = xform;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(updateClock)
                                   userInfo:nil
                                    repeats:YES];
}

- (void) stopClock {
    [self.timer invalidate];
    self.timer = nil;
}

- (void) startClock {
    self.timerCount = 5;
    
    [self updateClock];
    
    [self.timer invalidate];
    self.timer = nil;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.20
                                                  target:self
                                                selector:@selector(updateClock)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void) updateClock {
    if (self.timerCount == 5) {
        NSCalendar  *calendar = [NSCalendar currentCalendar];
        NSDate *date = [NSDate date];
        NSDateComponents *dateComp = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute
                                                 fromDate:date];
    
        [self.highHourDigit setDigit: dateComp.hour / 10];
        [self.lowHourDigit  setDigit: dateComp.hour % 10];
    
        [self.highMinuteDigit setDigit: dateComp.minute / 10];
        [self.lowMinuteDigit  setDigit: dateComp.minute % 10];
    
        self.upperDot.hidden = !self.upperDot.isHidden;
        self.lowerDot.hidden = !self.lowerDot.isHidden;
        
        self.timerCount = 0;
    }
    self.timerCount++;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
