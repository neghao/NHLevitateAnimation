//
//  NHLevitateView.h
//  NHlevitateAnimation
//
//  Created by neghao on 2017/12/8.
//  Copyright © 2017年 neghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHLevitateView : UIView
/**
 *  How many seconds to rotate 1 π (s/π).
 */
@property (nonatomic) NSTimeInterval  speed;

/**
 *  Direction of rotation, default is YES.
 */
@property (nonatomic) BOOL    clockWise;

/**
 *  Start angle.
 */
@property (nonatomic) CGFloat startAngle;


-(void)startAllAnimation;


@end
