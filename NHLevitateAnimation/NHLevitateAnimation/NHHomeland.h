//
//  NHHomeland.h
//  NHLevitateAnimation
//
//  Created by neghao on 2017/12/22.
//  Copyright © 2017年 neghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHomeland : UIView
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
