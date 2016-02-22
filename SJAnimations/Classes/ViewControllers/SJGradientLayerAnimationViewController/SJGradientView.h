//
//  SJGradientView.h
//  SJAnimations
//
//  Created by shejun.zhou on 16/2/19.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJGradientView : UIView

@property (nonatomic, readonly) CALayer *maskLayer;
@property (nonatomic, assign) CGFloat progress;

@end
