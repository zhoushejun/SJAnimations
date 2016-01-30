//
//  SJRootViewController.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJRootViewController.h"
#import "SJViewControllersHeader.h"
#import "SJItem.h"
#import "SJRootViewCell.h"

@interface SJRootViewController ()

@property (nonatomic, strong, nullable) NSMutableArray *items;

@end

@implementation SJRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SJRootViewCell *cell = (SJRootViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SJRootTableViewCellIdentifier" forIndexPath:indexPath];
    [cell loadContentWithData:self.items[indexPath.row] indexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SJItem *item = self.items[indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(item.object)];
    viewController.title = item.name;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - private

#pragma mark - getter and setter

- (NSMutableArray *)items {
    if (!_items) {
        NSArray *array = @[[SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-UIView原生简单动画" object:[SJSimpleAnimationViewController class]],
                           [SJItem itemWithName:@"POP-基础动画" object:[SJBasicAnimationViewController class]],
                           [SJItem itemWithName:@"POP-关键帧动画" object:[SJKeyframeAnimationViewController class]],
                           [SJItem itemWithName:@"POP-动画组" object:[SJAnimationGroupViewController class]],
                           [SJItem itemWithName:@"POP-转场动画" object:[SJTransitionViewController class]],
                           [SJItem itemWithName:@"POP-逐帧动画" object:[SJDisplayLinkViewController class]],
                           [SJItem itemWithName:@"POP-CALayer图层动画" object:[SJLayerAnimationViewController class]],
                           [SJItem itemWithName:@"POP-自定义图层动画" object:[SJCustomLayerViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]],
                           [SJItem itemWithName:@"POP-按钮动画" object:[SJButtonPressViewController class]]];
        _items = [NSMutableArray arrayWithArray:array];
    }
    return _items;
}

@end
