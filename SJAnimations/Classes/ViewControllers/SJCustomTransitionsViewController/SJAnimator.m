//
//  SJAnimator.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/3/4.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJAnimator.h"

@implementation SJAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
