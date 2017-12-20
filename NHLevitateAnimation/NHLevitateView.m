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


@interface NHLevitateView ()<CAAnimationDelegate>
@property (nonatomic, strong) UIImageView *backgroundImageView;//大背影
@property (nonatomic, strong) UIImageView *cloudImageView;//云朵
@property (nonatomic, strong) UIImageView *cloudImageView2;//云朵

@property (nonatomic, strong) UIImageView *meteorImageView;//流星
@property (nonatomic, strong) UIImageView *meteorImageView2;//流星

@property (nonatomic, strong) UIImageView *windmillImageView;//风车
@property (nonatomic, strong) UIImageView *houseImageView;//房子
@property (nonatomic, strong) UIImageView *lawnImageView;//草坪


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

/**
 初始化子视图
 */
- (void)initializeSubviews {
    
    _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_backgroundImageView setImage:[UIImage imageNamed:@"bg.png"]];
//    _backgroundImageView.backgroundColor = [UIColor colorWithRed:74.0f / 255.0f green:144.0f / 255.0f blue:226.0f / 255.0f alpha:1.0f];
    [self addSubview:_backgroundImageView];
    
    
    _cloudImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth + 80, 100, 62.5, 20)];
    [_cloudImageView setImage:[UIImage imageNamed:@"bigyun"]];
    [self addSubview:_cloudImageView];
    
    _cloudImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth + 60, 170, 62.5, 20)];
    [_cloudImageView2 setImage:[UIImage imageNamed:@"bigyun"]];
    [self addSubview:_cloudImageView2];
    
    _windmillImageView = [[UIImageView alloc] initWithFrame:CGRectMake(190, kScreenHeight - 104 - 0 - 30, 91.5, 91.5)];
    [_windmillImageView setImage:[UIImage imageNamed:@"fengche_"]];
    [self addSubview:_windmillImageView];
    
    
    _houseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, kScreenHeight - 104 - 2, 70, 89)];
    [_houseImageView setImage:[UIImage imageNamed:@"house"]];
    [self addSubview:_houseImageView];

    
    _lawnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 104, kScreenWidth, 104)];
//    _lawnImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_lawnImageView setImage:[UIImage imageNamed:@"dimian_"]];
//    [self addSubview:_lawnImageView];
    
    _meteorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 300, 70, 89)];
    [_meteorImageView setImage:[UIImage imageNamed:@"liuxing_"]];
    [self addSubview:_meteorImageView];

    _meteorImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 100, 280, 70, 89)];
    [_meteorImageView2 setImage:[UIImage imageNamed:@"liuxing_"]];
    [self addSubview:_meteorImageView2];
}

- (void)startAllAnimation {
    
    [self startCloudAnimation];
    [self startwindmillAnimation];
    [self startMeteorAnimation];
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


- (void)startwindmillAnimation {
    
    NSTimeInterval tmpSpeed = (_speed <= 0) ? 1 : _speed;
    
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue         = @(_startAngle);
    rotationAnimation.toValue           = @(_clockWise ? (M_PI * 100000) : (-M_PI * 100000) + _startAngle);
    rotationAnimation.duration          = tmpSpeed * 100000;
    [_windmillImageView.layer addAnimation:rotationAnimation forKey:nil];

}

- (void)startMeteorAnimation {
    
    UIBezierPath *meteorPath = [[UIBezierPath alloc] init];
    [meteorPath moveToPoint:CGPointMake(_meteorImageView.center.x, _meteorImageView.center.y)];
    [meteorPath addLineToPoint:CGPointMake(0, self.bounds.size.height + 50) ];

    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.path = meteorPath.CGPath;
    keyAnimation.duration = 8;
    keyAnimation.repeatCount = CGFLOAT_MAX;
    keyAnimation.calculationMode = kCAAnimationPaced;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    keyAnimation.removedOnCompletion = NO;
//    keyAnimation.fillMode = kCAFillModeForwards;
    [_meteorImageView.layer addAnimation:keyAnimation forKey:@"position"];

    
    UIBezierPath *meteorPath2 = [[UIBezierPath alloc] init];
    [meteorPath2 moveToPoint:CGPointMake(_meteorImageView2.center.x, _meteorImageView2.center.y)];
    [meteorPath2 addLineToPoint:CGPointMake(80, self.bounds.size.height + _meteorImageView2.bounds.size.height) ];
    
    CAKeyframeAnimation *keyAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation2.path = meteorPath2.CGPath;
    keyAnimation2.duration = 8;
    keyAnimation2.delegate = self;
    keyAnimation2.repeatCount = CGFLOAT_MAX;
    keyAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    keyAnimation2.calculationMode = kCAAnimationPaced;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.duration = 2.0f;
    opacityAnimation.autoreverses= NO;
    opacityAnimation.repeatCount = 1;
    opacityAnimation.repeatCount = MAXFLOAT;
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.fillMode = kCAFillModeForwards;
    //    opacityAnimation.speed = 1.0f;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 10;
    group.repeatCount = CGFLOAT_MAX;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.animations = @[ opacityAnimation, keyAnimation2 ];
    
    [_meteorImageView2.layer addAnimation:keyAnimation2 forKey:nil];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"%@---%@",anim, [anim valueForKey:@"animatiionID"]);
}


@end
