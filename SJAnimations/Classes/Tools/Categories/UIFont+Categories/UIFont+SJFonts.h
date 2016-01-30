//
//  UIFont+SJFonts.h
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/17.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

/**
 @file      UIFont+SJFonts.h
 @abstract  字体
 @author    shejun.zhou
 @version   1.0 16/1/17 Creation
 */

#import <UIKit/UIKit.h>

@interface UIFont (SJFonts)

#pragma mark - Addid Font

/**
 @method    HYQiHeiWithFontSize:
 @abstract  华文旗黑字体
 @param     size:字体大小
 @return    对应字体大小的华文旗黑字体
 */
+ (UIFont *)HYQiHeiWithFontSize:(CGFloat)size;

#pragma mark - System Font

/**
 @method    HeitiSCWithFontSize:
 @abstract  系统自带字体:Heiti SC
 @param     size:字体大小
 @return    对应字体大小的 "Heiti SC" 字体
 */
+ (UIFont *)HeitiSCWithFontSize:(CGFloat)size;

/**
 @method    AvenirLightWithFontSize:
 @abstract  系统自带字体:Avenir-Light
 @param     size:字体大小
 @return    对应字体大小的 "Avenir-Light" 字体
 */
+ (UIFont *)AvenirLightWithFontSize:(CGFloat)size;

@end
