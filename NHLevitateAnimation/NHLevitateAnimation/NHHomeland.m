//
//  NHHomeland.m
//  NHLevitateAnimation
//
//  Created by neghao on 2017/12/22.
//  Copyright © 2017年 neghao. All rights reserved.
//

#import "NHHomeland.h"
#define kScreenBounds     [UIScreen mainScreen].bounds
#define kScreenSize       [[UIScreen mainScreen] bounds].size
#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define kScreenHeight     [UIScreen mainScreen].bounds.size.height

@interface NHHomeland ()<CAAnimationDelegate>
@property (nonatomic, strong) UIImageView *meteorImageView;//流星
@property (nonatomic, strong) UIImageView *meteorImageView2;//流星

@property (nonatomic, strong) UIImageView *windmillImageView;//风车
@property (nonatomic, strong) UIImageView *houseImageView;//房子
@property (nonatomic, strong) UIImageView *lawnImageView;//草坪
@end

@implementation NHHomeland

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
    CGFloat height = self.bounds.size.height;
    
    
    _meteorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 50, 70, 89)];
    [_meteorImageView setImage:[UIImage imageNamed:@"liuxing_"]];
    [self addSubview:_meteorImageView];
    
    
    _meteorImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 100, 20, 70, 89)];
    [_meteorImageView2 setImage:[UIImage imageNamed:@"liuxing_"]];
    [self addSubview:_meteorImageView2];
    
    
    _lawnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, height - 104, kScreenWidth, 104)];
    _lawnImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_lawnImageView setImage:[UIImage imageNamed:@"homeland"]];
    [self addSubview:_lawnImageView];
    
    
    CGRect houseFrame = CGRectMake(200, CGRectGetMaxY(_lawnImageView.frame) - 89 - 10, 70.5, 85.5);
    _houseImageView = [[UIImageView alloc] initWithFrame:houseFrame];
    [_houseImageView setImage:[UIImage imageNamed:@"house"]];
    [self addSubview:_houseImageView];
    
    
    CGRect windmillFrame = CGRectMake(0, 0, 91.5, 91.5);
    _windmillImageView = [[UIImageView alloc] initWithFrame:windmillFrame];
    _windmillImageView.center = CGPointMake(_houseImageView.center.x, _houseImageView.center.y - _houseImageView.bounds.size.height * 0.2);
    [_windmillImageView setImage:[UIImage imageNamed:@"windmill"]];
    [self addSubview:_windmillImageView];
    
    
    [self bringSubviewToFront:_houseImageView];

}


- (void)startAllAnimation {
    
    [self startwindmillAnimation];
    [self startMeteorAnimation];
}


- (void)startMeteorAnimation {
    
    UIBezierPath *meteorPath = [[UIBezierPath alloc] init];
    [meteorPath moveToPoint:CGPointMake(_meteorImageView.center.x, _meteorImageView.center.y)];
    [meteorPath addLineToPoint:CGPointMake(0, self.bounds.size.height + 50) ];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.path = meteorPath.CGPath;
    keyAnimation.duration = 5;
    keyAnimation.repeatCount = CGFLOAT_MAX;
    keyAnimation.calculationMode = kCAAnimationLinear;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //    keyAnimation.removedOnCompletion = NO;
    //    keyAnimation.fillMode = kCAFillModeForwards;
    [_meteorImageView.layer addAnimation:keyAnimation forKey:@"position"];
    
    
    
    
    UIBezierPath *meteorPath2 = [[UIBezierPath alloc] init];
    [meteorPath2 moveToPoint:CGPointMake(_meteorImageView2.center.x, _meteorImageView2.center.y)];
    [meteorPath2 addLineToPoint:CGPointMake(80, self.bounds.size.height + _meteorImageView2.bounds.size.height) ];
    
    CAKeyframeAnimation *keyAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation2.path = meteorPath2.CGPath;
    keyAnimation2.duration = 6;
    keyAnimation2.delegate = self;
    keyAnimation2.beginTime = CACurrentMediaTime() + 2;
    keyAnimation2.repeatCount = CGFLOAT_MAX;
    keyAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    keyAnimation2.calculationMode = kCAAnimationPaced;

    [_meteorImageView2.layer addAnimation:keyAnimation2 forKey:nil];
}



- (void)startwindmillAnimation {
    
    NSTimeInterval tmpSpeed = (_speed <= 0) ? 1 : _speed;
    
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue         = @(_startAngle);
    rotationAnimation.toValue           = @(_clockWise ? (M_PI * 100000) : (-M_PI * 100000) + _startAngle);
    rotationAnimation.duration          = tmpSpeed * 100000;
    [_windmillImageView.layer addAnimation:rotationAnimation forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"%@---%@",anim, [anim valueForKey:@"animatiionID"]);
}

@end
