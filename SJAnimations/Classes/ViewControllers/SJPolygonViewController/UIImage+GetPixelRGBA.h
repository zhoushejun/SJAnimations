//
//  UIImage+GetPixelRGBA.h
//  SJAnimations
//
//  Created by jocentzhou on 2017/11/7.
//  Copyright © 2017年 shejun.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GetPixelRGBA)

-(UIColor *)colorAtPoint:(CGPoint)point WithImageSize:(CGSize)size;
-(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end
