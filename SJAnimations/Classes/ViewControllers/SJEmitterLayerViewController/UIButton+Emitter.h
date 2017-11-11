//
//  UIButton+Emitter.h
//  SJAnimations
//
//  Created by jocentzhou on 2017/11/11.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 粒子动画按钮，点击时发射粒子
 */
@interface UIButton (Emitter)

- (void)startEmitterAnimation;
- (void)stopEmitterAnimation;

@end
