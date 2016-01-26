//
//  ViewController.m
//  LEDClock
//
//  Created by Imran on 11/13/15.
//  Copyright © 2015 Fazle Rab. All rights reserved.
//

#import "ViewController.h"
#import "ClockView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ClockView *clockView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void) viewWillAppear:(BOOL)animated   {
    [super viewWillAppear:animated];
    [self.clockView startClock];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.clockView stopClock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
