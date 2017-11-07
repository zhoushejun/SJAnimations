//
//  SJPolygonViewController.m
//  SJAnimations
//
//  Created by jocentzhou on 2017/11/7.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import "SJPolygonViewController.h"
#import "SJPolygonButton.h"

@interface SJPolygonViewController ()
@property (nonatomic, strong) UIButton *btnLeft;
@property (nonatomic, strong) SJPolygonButton *btnCenter;
@property (nonatomic, strong) UIButton *btnRight;
@end

@implementation SJPolygonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnLeft.frame = CGRectMake(10, 100, 100, 58);
    self.btnRight.frame = CGRectMake(SCREEN_WIDTH-110, 100, 100, 58);
    self.btnCenter.frame = CGRectMake(80, 100-3, SCREEN_WIDTH-80*2, 64);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)btnLeft {
    if (!_btnLeft) {
        _btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnLeft setBackgroundImage:[UIImage imageNamed:@"team_root_top_polygon_left"] forState:UIControlStateNormal];
        [self.view addSubview:_btnLeft];
     }
    return _btnLeft;
}

- (SJPolygonButton *)btnCenter {
    if (!_btnCenter) {
        _btnCenter = [SJPolygonButton buttonWithType:UIButtonTypeCustom];
        [_btnCenter setBackgroundImage:[[UIImage imageNamed:@"team_root_top_polygon_center"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 60, 0, 60)] forState:UIControlStateNormal];
        [self.view addSubview:_btnCenter];
    }
    return _btnCenter;
}

- (UIButton *)btnRight {
    if (!_btnRight) {
        _btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnRight setBackgroundImage:[UIImage imageNamed:@"team_root_top_polygon_right"] forState:UIControlStateNormal];
        [self.view addSubview:_btnRight];
    }
    return _btnRight;
}

@end
