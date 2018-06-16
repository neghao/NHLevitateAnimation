//
//  NHCloudView.m
//  NHLevitateAnimation
//
//  Created by neghao on 2017/12/22.
//  Copyright © 2017年 neghao. All rights reserved.
//

#import "NHCloudView.h"

#define kScreenBounds     [UIScreen mainScreen].bounds
#define kScreenSize       [[UIScreen mainScreen] bounds].size
#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define kScreenHeight     [UIScreen mainScreen].bounds.size.height


@interface NHCloudView ()
@property (nonatomic, strong) UIImageView *cloudImageView;//云朵
@property (nonatomic, strong) UIImageView *cloudImageView2;//云朵
@property (nonatomic, strong) UIImageView *staticCloud;

@end

@implementation NHCloudView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeSubviews];
    }
    return self;
}

/**
 初始化子视图
 */
- (void)initializeSubviews {
    _cloudImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth + 80, 100, 26.5, 12.5)];
    [_cloudImageView setImage:[UIImage imageNamed:@"yun1"]];
    [self addSubview:_cloudImageView];
    
    _cloudImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth + 60, 170, 65.5, 28)];
    [_cloudImageView2 setImage:[UIImage imageNamed:@"yun2"]];
    [self addSubview:_cloudImageView2];
    
    //self.bounds.size.height * 0.5 - 40
    _staticCloud = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * 0.5 - 30, CGRectGetMaxY(_cloudImageView.frame), 87, 23)];
    [_staticCloud setImage:[UIImage imageNamed:@"yun3"]];
    [self addSubview:_staticCloud];
    
}

- (void)startCloudAnimation {
    
    UIBezierPath *cloudBezierPath = [[UIBezierPath alloc] init];
    [cloudBezierPath moveToPoint:CGPointMake(kScreenWidth + 100, 80)];
    [cloudBezierPath addLineToPoint:CGPointMake(- 62.5, 100)];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.path = cloudBezierPath.CGPath;
    keyAnimation.duration = 10;
    //    keyAnimation.autoreverses = YES;
    keyAnimation.repeatCount = CGFLOAT_MAX;
    keyAnimation.calculationMode = kCAAnimationPaced;
    [_cloudImageView.layer addAnimation:keyAnimation forKey:@"position"];
    
    UIBezierPath *cloudBezierPath2 = [[UIBezierPath alloc] init];
    [cloudBezierPath2 moveToPoint:CGPointMake(kScreenWidth, 170)];
    [cloudBezierPath2 addLineToPoint:CGPointMake(- 62.5, 150)];
    
    CAKeyframeAnimation *keyAnimation2 = [CAKeyframeAnimation animation];
    keyAnimation2.path = cloudBezierPath2.CGPath;
    keyAnimation2.duration = 10;
    keyAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyAnimation2.repeatCount = CGFLOAT_MAX;
    keyAnimation2.calculationMode = kCAAnimationPaced;
    [_cloudImageView2.layer addAnimation:keyAnimation2 forKey:@"position"];
}

@end
