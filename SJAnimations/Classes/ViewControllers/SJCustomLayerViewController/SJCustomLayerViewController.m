//
//  SJCustomLayerViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/30.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJCustomLayerViewController.h"
#import "SJCustomLayer.h"

@interface SJCustomLayerViewController ()

@end

@implementation SJCustomLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SJCustomLayer *customLayer = [[SJCustomLayer alloc] init];
    customLayer.backgroundColor = [UIColor clearColor].CGColor;
    customLayer.bounds = CGRectMake(0, 0, 200, 200);
    customLayer.position = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    [customLayer setNeedsDisplay];//显示自定义图层
    [self.view.layer addSublayer:customLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
