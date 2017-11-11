//
//  SJEmitterLayerViewController.m
//  SJAnimations
//
//  Created by jocentzhou on 2017/11/11.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import "SJEmitterLayerViewController.h"
#import "UIButton+Emitter.h"

@interface SJEmitterLayerViewController ()
@property (nonatomic, strong) UIButton *btnEmitterAnimation;
@end

@implementation SJEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnEmitterAnimation.frame = CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_HEIGHT-100)/2, 100, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)btnEmitterAnimation {
    if (!_btnEmitterAnimation) {
        _btnEmitterAnimation = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnEmitterAnimation setImage:[UIImage imageNamed:@"ic_favour_nor"] forState:UIControlStateNormal];
        [_btnEmitterAnimation setImage:[UIImage imageNamed:@"ic_favour_sel"] forState:UIControlStateSelected];
        _btnEmitterAnimation.layer.cornerRadius = 50.0;
        
        [_btnEmitterAnimation addTarget:self action:@selector(tappedEmitterButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnEmitterAnimation];
    }
    
    return _btnEmitterAnimation;
}

- (void)tappedEmitterButtonAction:(UIButton *)button {
    button.selected = YES;
    [button startEmitterAnimation];
    NSLogCurrentFunction
}

@end
