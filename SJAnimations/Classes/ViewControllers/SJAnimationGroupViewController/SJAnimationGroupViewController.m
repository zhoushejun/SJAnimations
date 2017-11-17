//
//  SJAnimationGroupViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJAnimationGroupViewController.h"

#define WIDTH 70

@interface SJAnimationGroupViewController ()

@property (nonatomic, strong) CALayer *subLayer;

@end

@implementation SJAnimationGroupViewController

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
    CAAnimation *animation = [_subLayer animationForKey:@"AnimationGroup"];
    if (animation) {
        return;
    }
    [self groupAnimation];
}

#pragma mark -
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAAnimationGroup *animationGroup = (CAAnimationGroup *)anim;
    CABasicAnimation *basicAnimation = (CABasicAnimation *)animationGroup.animations[0];
    CAKeyframeAnimation *keyframeAnimation = (CAKeyframeAnimation *)animationGroup.animations[1];
    CGFloat toValue = [[basicAnimation valueForKey:@"KCBasicAnimationProperty_ToValue"] floatValue];
    CGPoint endPoint = [[keyframeAnimation valueForKey:@"KCKeyframeAnimationProperty_EndPosition"] CGPointValue];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _subLayer.position = endPoint;
    _subLayer.transform = CATransform3DMakeRotation(toValue, 0, 0, 1);
    [CATransaction commit];
}

#pragma mark - private

- (void)groupAnimation {
    //创建动画组
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[[self rotationAnimation], [self transitionAnimation]];
    animationGroup.delegate = self;
    animationGroup.duration = 10.0f;
    animationGroup.beginTime = CACurrentMediaTime();
    
    [_subLayer addAnimation:animationGroup forKey:@"AnimationGroup"];
}

- (CABasicAnimation *)rotationAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    CGFloat toValue = M_PI_2 * 3;
    basicAnimation.toValue = [NSNumber numberWithFloat:toValue];
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;
    [basicAnimation setValue:[NSNumber numberWithFloat:toValue] forKey:@"KCBasicAnimationProperty_ToValue"];
    return basicAnimation;
}

- (CAKeyframeAnimation *)transitionAnimation {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //绘制贝赛尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _subLayer.position.x, _subLayer.position.y);
    CGPathAddCurveToPoint(path, NULL, 105, 300, 165, 400, 120, 500);//绘制二次贝赛尔曲线
    keyframeAnimation.path = path;
    CGPathRelease(path);
    
    [keyframeAnimation setValue:[NSValue valueWithCGPoint:CGPointMake(120, 500)] forKey:@"KCKeyframeAnimationProperty_EndPosition"];
    return keyframeAnimation;
}

#pragma mark - getter and setter

- (CALayer *)subLayer {
    if (!_subLayer) {
        _subLayer = [[CALayer alloc] init];
        _subLayer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
        _subLayer.position = CGPointMake(80, 150);
        _subLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"photo.png"].CGImage);
    }
    return _subLayer;
}

@end
