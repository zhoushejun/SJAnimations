//
//  SJSimpleAnimationViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJSimpleAnimationViewController.h"

@interface SJSimpleAnimationViewController ()

@end

@implementation SJSimpleAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animateWithDuration];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animateWithDuration {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo.png"]];
    imageView.frame = CGRectMake(100, 100, 70, 70);
    [self.view addSubview:imageView];
    [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        imageView.frame = CGRectMake(100, SCREEN_HEIGHT - 100, 70, 70);
    } completion:nil];
}

@end
