//
//  SJMath.h
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/17.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

/**
 @file      SJMath.h
 @abstract  数学计算
 @author    shejun.zhou
 @version   1.0 16/1/17 Creation
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SJMath : NSObject

@property (nonatomic) CGFloat  k; ///< 直线的斜率，不为0
@property (nonatomic) CGFloat  b; ///< 直线在 y 轴上的截距

/**
 @method    mathOnceLinearEquationWithPointA: PointB
 @abstract  生成点斜式方程的对象
 @param     pointA:第1个点
 @param     pointB:第2个点
 @return    包含斜率和截距的对象
 */
+ (instancetype)mathOnceLinearEquationWithPointA:(CGPoint)pointA PointB:(CGPoint)pointB;

/**
 @method    degreeFromRadian
 @abstract  弧度->圆角度数
 @param     radian:弧度
 @return    圆角度数
 */
+ (CGFloat)degreeFromRadian:(CGFloat)radian;

/**
 @method    radianFromDegree
 @abstract  圆角度数->弧度
 @param     degree:圆角度数
 @return    弧度
 */
+ (CGFloat)radianFromDegree:(CGFloat)degree;

/**
 @method    resetFromSize: withFixedWidth:
 @abstract  修改 size 的 width 属性
 @param     size:旧的size
 @param     width:目标width属性值
 @return    修改后的size
 */
+ (CGSize)resetFromSize:(CGSize)size withFixedWidth:(CGFloat)width;

/**
 @method    resetFromSize: withFixedHeight:
 @abstract  修改 size 的 height 属性
 @param     size:旧的size
 @param     height:目标height属性值
 @return    修改后的size
 */
+ (CGSize)resetFromSize:(CGSize)size withFixedHeight:(CGFloat)height;

/**
 @method    xValueWhenYEqual
 @abstract  根据给定的 y 的值由点斜方程式推算出对应的 x 的值
 @param     yValue:已知 y 的值
 @return    x 的值
 */
- (CGFloat)xValueWhenYEqual:(CGFloat)yValue;

/**
 @method    yValueWhenXEqual
 @abstract  根据给定的 x 的值由点斜方程式推算出对应的 y 的值
 @param     xValue:已知 x 的值
 @return    y 的值
 */
- (CGFloat)yValueWhenXEqual:(CGFloat)xValue;

@end
