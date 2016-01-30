//
//  SJBasicAnimationViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJBasicAnimationViewController.h"

#define WIDTH 70

@interface SJBasicAnimationViewController ()

@property (nonatomic, strong) CALayer *subLayer;

@end

@implementation SJBasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.layer addSublayer:self.subLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    CAAnimation *animation = [_subLayer animationForKey:@"KCBasicAnimation_Translation"];
    if (animation) {
        if (0 == _subLayer.speed) {
            [self animationResume];
        }else {
            [self animationPause];
        }
    }else {
        [self transitionAnimation:location];
        [self rotationAnimation];
        
    }
}

- (void)transitionAnimation:(CGPoint)location {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.toValue = [NSValue valueWithCGPoint:location];
    basicAnimation.duration = 3.0;
    basicAnimation.delegate = self;
    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"KCBasicAnimationLocation"];
    [self.subLayer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Translation"];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animation(%@) start.\r_subLayer.frame=%@", anim, NSStringFromCGRect(_subLayer.frame));
    NSLog(@"%@",[_subLayer animationForKey:@"KCBasicAnimation_Translation"]);//通过前面的设置的key获得动画
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"animation(%@) stop.\r_subLayer.frame=%@", anim, NSStringFromCGRect(_subLayer.frame));
    [CATransaction begin];//开启事务
    [CATransaction setDisableActions:YES];//禁用隐式动画
    _subLayer.position = [[anim valueForKey:@"KCBasicAnimationLocation"] CGPointValue];
    [CATransaction commit];//提交事务
    [self animationPause];
}

#pragma mark - getter and setter

- (CALayer *)subLayer {
    if (!_subLayer) {
        _subLayer = [[CALayer alloc] init];
        _subLayer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
        _subLayer.position = CGPointMake(100, 100);
        _subLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"photo.png"].CGImage);
    }
    return _subLayer;
}

#pragma mark - private

/** 旋转动画 */
- (void)rotationAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2 * 3];
    basicAnimation.duration = 6.0;
    basicAnimation.autoreverses = YES;
    //    basicAnimation.repeatCount = HUGE_VALF;//设置无限循环
    basicAnimation.removedOnCompletion = NO;
    [_subLayer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Rotation"];
}

/** 动画暂停 */
- (void)animationPause {
    CFTimeInterval interval = [_subLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    [_subLayer setTimeOffset:interval];
    _subLayer.speed = 0;
}

/** 动画恢复 */
- (void)animationResume {
    CFTimeInterval beginTime = CACurrentMediaTime() - _subLayer.timeOffset;
    _subLayer.timeOffset = 0;
    _subLayer.beginTime = beginTime;
    _subLayer.speed = 1.0;
}

@end
