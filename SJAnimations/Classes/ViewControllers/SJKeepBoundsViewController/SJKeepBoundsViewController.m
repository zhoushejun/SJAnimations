//
//  SJKeepBoundsViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 2017/10/24.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import "SJKeepBoundsViewController.h"
#import "UIView+KeepBounds.h"

@interface SJKeepBoundsViewController ()
@property (nonatomic, strong) UIView *keepBoundsView;
@end

@implementation SJKeepBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.keepBoundsView.frame = CGRectMake(SCREEN_WIDTH/2.0-50.0, SCREEN_HEIGHT/2.0-50.0, 100, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIView *)keepBoundsView {
    if (!_keepBoundsView) {
        _keepBoundsView = [[UIView alloc] init];
        _keepBoundsView.backgroundColor = [UIColor orangeColor];
        _keepBoundsView.isKeepBounds = YES;
        [self.view addSubview:_keepBoundsView];
    }
    return _keepBoundsView;
}

@end
