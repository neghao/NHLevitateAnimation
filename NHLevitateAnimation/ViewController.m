//
//  ViewController.m
//  NHlevitateAnimation
//
//  Created by neghao on 2017/12/8.
//  Copyright © 2017年 neghao. All rights reserved.
//


#import "ViewController.h"
#import "NHLevitateView.h"

@interface ViewController ()
@property (nonatomic, weak) NHLevitateView *levitateView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NHLevitateView *levitateView = [[NHLevitateView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:levitateView];
    _levitateView = levitateView;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_levitateView startAllAnimation];
}





@end
