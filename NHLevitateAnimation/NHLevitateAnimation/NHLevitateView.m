//
//  NHLevitateView.m
//  NHlevitateAnimation
//
//  Created by neghao on 2017/12/8.
//  Copyright © 2017年 neghao. All rights reserved.
//


#define kScreenBounds     [UIScreen mainScreen].bounds
#define kScreenSize       [[UIScreen mainScreen] bounds].size
#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define kScreenHeight     [UIScreen mainScreen].bounds.size.height

#import "NHLevitateView.h"
#import "NHCloudView.h"
#import "NHHomeland.h"


@interface NHLevitateView ()<CAAnimationDelegate>
@property (nonatomic, strong) NHCloudView *cloudView;
@property (nonatomic, strong) NHHomeland *homelandView;
@property (nonatomic, strong) UIImageView *backgroundView;//大背影

@end

@implementation NHLevitateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _clockWise = YES;
        _startAngle = 0.f;
        _speed = 8;
        [self initializeSubviews];
    }
    return self;
}


- (void)setClockWise:(BOOL)clockWise {
    _homelandView.clockWise = clockWise;
}

- (void)setStartAngle:(CGFloat)startAngle {
    _homelandView.startAngle = startAngle;
}

- (void)setSpeed:(NSTimeInterval)speed {
    _homelandView.speed = speed;
}

/**
 初始化子视图
 */
- (void)initializeSubviews {
    
    _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
//    [_backgroundImageView setImage:[UIImage imageNamed:@"leftbackround_image"]];
    _backgroundView.backgroundColor = [UIColor colorWithRed:74.0f / 255.0f green:144.0f / 255.0f blue:226.0f / 255.0f alpha:1.0f];
    [self addSubview:_backgroundView];
    
    
    _cloudView = [[NHCloudView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 300)];
    _cloudView.backgroundColor = [UIColor clearColor];
    [self addSubview:_cloudView];
    
    
    _homelandView = [[NHHomeland alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_cloudView.frame), self.bounds.size.width, self.bounds.size.height - CGRectGetMaxY(_cloudView.frame))];
    _homelandView.backgroundColor = [UIColor clearColor];
    [self addSubview:_homelandView];
    
}

- (void)startAllAnimation {
    
    [self.cloudView startCloudAnimation];
    [self.homelandView startAllAnimation];
}





@end
