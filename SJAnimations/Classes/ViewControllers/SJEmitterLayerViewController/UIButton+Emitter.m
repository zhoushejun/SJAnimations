//
//  UIButton+Emitter.m
//  SJAnimations
//
//  Created by jocentzhou on 2017/11/11.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import "UIButton+Emitter.h"
#import <objc/runtime.h>

@interface UIButton ()
@property (nonatomic, strong) CAEmitterLayer * emitterLayer;
@end

@implementation UIButton (Emitter)

- (void)setEmitterLayer:(CAEmitterLayer *)emitterLayer {
    objc_setAssociatedObject(self, @selector(emitterLayer), emitterLayer, OBJC_ASSOCIATION_RETAIN);
}
- (CAEmitterLayer *)emitterLayer {
    return objc_getAssociatedObject(self, @selector(emitterLayer));
}

- (void)startEmitterAnimation {
    if (!self.emitterLayer) {
        self.emitterLayer = [[CAEmitterLayer alloc] init];
        self.emitterLayer.name = @"emitterLayer";
        self.emitterLayer.emitterShape = kCAEmitterLayerCircle;//发射源的形状
        self.emitterLayer.emitterMode = kCAEmitterLayerOutline;//发射模式
        self.emitterLayer.emitterSize = CGSizeMake(5, 0);//发射源大小
        self.emitterLayer.renderMode = kCAEmitterLayerOldestFirst;//渲染模式
        self.emitterLayer.masksToBounds = NO;
        self.emitterLayer.zPosition = 0;
        self.emitterLayer.position = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);//发射位置
        
        {//设置粒子属性
            CAEmitterCell *cell = [[CAEmitterCell alloc] init];
            cell.name = @"emitterLayerCell";
            cell.alphaRange = 0.1;//设置粒子颜色alpha能改变的范围
            cell.alphaSpeed = -0.1;//粒子alpha的改变速度
            cell.lifetime = 0.7;//粒子的生命周期
            cell.lifetimeRange = 0.3;//粒子生命周期的范围;
            cell.birthRate = 2500;//粒子发射的初始速度
            cell.velocity = 40.0;//粒子的速度
            cell.velocityRange = 10.0;//粒子速度范围
            cell.scale = 0.03;//粒子的缩放比例
            cell.scaleRange = 0.02;//缩放比例范围
            cell.contents = (id)[UIImage imageNamed:@"AppIcon"].CGImage;//粒子要展现的图片
            
            self.emitterLayer.emitterCells = @[cell];//发射源包含的粒子
        }
        
        [self.layer addSublayer:self.emitterLayer];
    }
    self.emitterLayer.birthRate = 1;
    self.emitterLayer.beginTime = CACurrentMediaTime();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopEmitterAnimation];
    });
    [self animation];
}

- (void)stopEmitterAnimation {
    self.emitterLayer.birthRate = 0;
}

- (void)animation {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    if (self.selected) {
        animation.values = @[@1.5,@0.8,@1.0,@1.2,@1.0];
        animation.duration = 0.5;
    }else{
        animation.values = @[@0.8,@1.0];
        animation.duration = 0.4;
    }
    
    animation.calculationMode = kCAAnimationCubic;
    
    [self.layer addAnimation:animation forKey:@"transform.scale"];
}

@end
