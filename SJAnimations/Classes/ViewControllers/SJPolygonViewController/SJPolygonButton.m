//
//  SJPolygonButton.m
//  SJAnimations
//
//  Created by jocentzhou on 2017/11/7.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import "SJPolygonButton.h"
#import "UIImage+GetPixelRGBA.h"

@implementation SJPolygonButton

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event  {
    UIImage *image = [self backgroundImageForState:UIControlStateNormal];
    if (!image) {
        return YES;
    }
    
    CGColorRef color = [[image colorAtPoint:point WithImageSize:self.frame.size] CGColor];
    CGFloat alphaValue = CGColorGetAlpha(color);
    return (alphaValue >= 0.1f);
}

@end
