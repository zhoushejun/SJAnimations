//
//  SJGradientLayerAnimationViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/2/19.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJGradientLayerAnimationViewController.h"
#import "SJGradientView.h"

@interface SJGradientLayerAnimationViewController ()

@property (nonatomic, strong) SJGradientView *gradientView;
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation SJGradientLayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.gradientView];
    self.gradientView.progress = 0.0;
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateGradient)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)viewDidDisappear:(BOOL)animated {
    [_displayLink invalidate];
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLogCurrentFunction
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (SJGradientView *)gradientView {
    if (!_gradientView) {
        _gradientView = [[SJGradientView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 10.0/([UIScreen mainScreen].scale))];
    }
    return _gradientView;
}

- (void)updateGradient {
    if (self.gradientView.progress < 1.0) {
        self.gradientView.progress += 0.001;
    }else {
        [_displayLink invalidate];
    }

}

@end
