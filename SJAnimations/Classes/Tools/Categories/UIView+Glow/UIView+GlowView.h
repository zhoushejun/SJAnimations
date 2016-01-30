//
//  UIView+GlowView.h
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/25.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

/**
 @file      UIView+GlowView.h
 @abstract  添加 UIView 对象属性，使其具备"辉光"效果功能
 @author    shejun.zhou
 @version   1.0 16/1/25 Creation
 */
#import <UIKit/UIKit.h>

@interface UIView (GlowView)

#pragma mark - 设置辉光效果

@property (nonatomic, strong) UIColor  *glowColor;  ///< 辉光的颜色
@property (nonatomic, strong) NSNumber *glowOpacity;///< 辉光的透明度
@property (nonatomic, strong) NSNumber *glowRadius; ///< 辉光的阴影半径

#pragma mark - 设置辉光时间间隔

@property (nonatomic, strong) NSNumber *glowAnimationDuration;///< 一次完整的辉光周期（从显示到透明或者从透明到显示），默认1s
@property (nonatomic, strong) NSNumber *glowDuration;///< 保持辉光时间（不设置，默认为0.5s）
@property (nonatomic, strong) NSNumber *hideDuration;///< 不显示辉光的周期（不设置默认为0.5s）

#pragma mark - 辉光相关操作

/** 创建出辉光layer */
- (void)createGlowLayer;

/** 插入辉光的layer */
- (void)insertGlowLayer;

/** 移除辉光的layer */
- (void)removeGlowLayer;

/** 显示辉光 */
- (void)glowToshow;

/** 隐藏辉光 */
- (void)glowToHide;

/** 开始循环辉光 */
- (void)startGlowLoop;

@end
