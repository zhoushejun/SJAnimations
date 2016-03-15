//
//  SJAnimator.h
//  SJAnimations
//
//  Created by shejun.zhou on 16/3/4.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

/**
 @file      SJAnimator.h
 @abstract  视图转场动画
 @author    shejun.zhou
 @version   1.0 16/3/4 Creation
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SJAnimatedTransitionType) {
    SJAnimatedTransitionTypePresent = 0,    ///< present 动画
    SJAnimatedTransitionTypeDismiss,        ///< dismiss 动画
    SJAnimatedTransitionTypePush,           ///< push 动画
    SJAnimatedTransitionTypePop             ///< pop 动画
};

@interface SJAnimator : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(SJAnimatedTransitionType)type;
- (instancetype)initWithTransitionType:(SJAnimatedTransitionType)type;

@end
