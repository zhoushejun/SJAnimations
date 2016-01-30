//
//  SJDisplayLinkViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJDisplayLinkViewController.h"

#define IMAGE_COUNT 3

@interface SJDisplayLinkViewController ()

@property (nonatomic, strong) CALayer *subLayer;
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation SJDisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.layer addSublayer:self.subLayer];
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(step)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)step {
    static int s = 0;
    if (++s%(50) == 0) {
        UIImage *image = self.images[_currentIndex];
        _subLayer.contents = (id)image.CGImage;
        _currentIndex = (_currentIndex + 1)%IMAGE_COUNT;
    }
}

#pragma mark - getter and setter

- (CALayer *)subLayer {
    if (!_subLayer) {
        _subLayer = [[CALayer alloc] init];
        _subLayer.bounds = [UIScreen mainScreen].bounds;
        _subLayer.position = self.view.center;
    }
    return _subLayer;
}

- (NSMutableArray *)images {
    if (!_images) {
        _images = [[NSMutableArray alloc] init];
        for (int i = 0; i < IMAGE_COUNT; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%i.png", i];
            UIImage *image = [UIImage imageNamed:imageName];
            [_images addObject:image];
        }
    }
    return _images;
}

@end
