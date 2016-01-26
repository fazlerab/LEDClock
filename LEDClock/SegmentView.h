//
//  SegmentView.h
//  LEDClock
//
//  Created by Imran on 11/13/15.
//  Copyright © 2015 Fazle Rab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentView : UIView

@property (nonatomic, getter=isOn) BOOL on;
@property (nonatomic, getter=isVertical) IBInspectable BOOL vertical;

@end
