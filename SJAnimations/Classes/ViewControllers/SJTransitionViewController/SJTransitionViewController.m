//
//  SJTransitionViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJTransitionViewController.h"

#define IMAGE_COUNT 3

@interface SJTransitionViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) int currentIndex;

@end

@implementation SJTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.imageView];
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)leftSwipe:(UIGestureRecognizer *)gestureRecognizer {
    [self transitionAnimation:YES];
}

- (void)rightSwipe:(UIGestureRecognizer *)gestureRecognizer {
    [self transitionAnimation:NO];
}

/** 转场动画 */
- (void)transitionAnimation:(BOOL)isNext {
    CATransition *transition = [[CATransition alloc] init];
    transition.type = @"cube";
    if (isNext) {
        transition.subtype = kCATransitionFromRight;
    }else{
        transition.subtype = kCATransitionFromLeft;
    }
    transition.duration = 1.0f;
    _imageView.image = [self getImage:isNext];
    [_imageView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
}

#pragma mark - getter and setter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = [UIScreen mainScreen].bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:@"0.png"];
    }
    return _imageView;
}

- (UIImage *)getImage:(BOOL)isNext {
    if (isNext) {
        _currentIndex = (_currentIndex +1)%IMAGE_COUNT;
    }else {
        _currentIndex = (_currentIndex-1+IMAGE_COUNT)%IMAGE_COUNT;
    }
    NSString *imageName = [NSString stringWithFormat:@"%i.png", _currentIndex];
    return [UIImage imageNamed:imageName];
}

@end
