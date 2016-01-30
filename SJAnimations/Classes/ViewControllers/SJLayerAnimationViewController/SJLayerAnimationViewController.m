//
//  SJLayerAnimationViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJLayerAnimationViewController.h"

#define WIDTH 50

@interface SJLayerAnimationViewController ()

@property (nonatomic, strong) CALayer *subLayer;

@end

@implementation SJLayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawMyLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.subLayer.delegate = nil;
}

#pragma mark - CALayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -WIDTH);
    UIImage *image = [UIImage imageNamed:@"photo.png"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, WIDTH, WIDTH), image.CGImage);
    CGContextRestoreGState(ctx);
}

#pragma mark -

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGFloat width = self.subLayer.bounds.size.width;
    if (width == WIDTH) {
        width = WIDTH * 4;
    }else {
        width = WIDTH;
    }
    self.subLayer.bounds = CGRectMake(0, 0, width, width);
    self.subLayer.position = [touch locationInView:self.view];
    self.subLayer.cornerRadius = width/2;
}

#pragma mark - private

- (void)drawMyLayer {
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.position = CGPointMake(size.width/2, size.height/2);
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.cornerRadius = WIDTH/2;
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = 0.9;
    
//    layer.borderColor = [UIColor whiteColor].CGColor;
//    layer.borderWidth = 2;
//    layer.masksToBounds = YES;
//    layer.delegate = self;

    self.subLayer = layer;
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay];
}

@end
