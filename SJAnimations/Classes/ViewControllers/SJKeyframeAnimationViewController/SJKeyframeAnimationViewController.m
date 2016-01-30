//
//  SJKeyframeAnimationViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJKeyframeAnimationViewController.h"

#define WIDTH 70

@interface SJKeyframeAnimationViewController ()

@property (nonatomic, strong) CALayer *subLayer;

@end

@implementation SJKeyframeAnimationViewController

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
    [self transitionAnimation];
}

- (void)transitionAnimation {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
   //关键帧
    /*
    NSValue *key1 = [NSValue valueWithCGPoint:_subLayer.position];
    NSValue *key2 = [NSValue valueWithCGPoint:CGPointMake(45, 300)];
    NSValue *key3 = [NSValue valueWithCGPoint:CGPointMake(55, 400)];
    NSValue *key4 = [NSValue valueWithCGPoint:CGPointMake(80, 500)];
    keyframeAnimation.values = [NSArray arrayWithObjects:key1, key2, key3, key4, nil];
    */
    
    //绘制贝赛尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _subLayer.position.x, _subLayer.position.y);
    CGPathAddCurveToPoint(path, NULL, 105, 300, 165, 400, 120, 500);//绘制二次贝赛尔曲线
    keyframeAnimation.path = path;
    CGPathRelease(path);
    
    keyframeAnimation.duration = 8.0;
    keyframeAnimation.beginTime = CACurrentMediaTime();
    [_subLayer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
    
    [self wave];
}

- (void)wave {
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.duration = 1.5;
    scaleX.values = @[@1.0,@1.1,@1.0];
    scaleX.keyTimes = @[@0, @0.6, @1];
    scaleX.repeatCount = 10;
    scaleX.autoreverses = YES;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_subLayer addAnimation:scaleX forKey:@"scaleXAnimation"];
    
    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = 2;
    scaleY.values = @[@1.0,@1.1,@1.0];
    scaleY.keyTimes = @[@0, @0.5, @1];
    scaleY.repeatCount = 10;
    scaleY.autoreverses = YES;
    scaleY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_subLayer addAnimation:scaleY forKey:@"scaleYAnimation"];
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
