//
//  SJMath.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/17.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJMath.h"

@implementation SJMath

+ (CGFloat)degreeFromRadian:(const CGFloat)radian {
    return ((radian) * (180.0 / M_PI));
}

+ (CGFloat)radianFromDegree:(const CGFloat)degree{
    return ((degree) * M_PI / 180.f);
}

+ (CGSize)resetFromSize:(const CGSize)size withFixedWidth:(const CGFloat)width {
    CGFloat newHeight = size.height * (width / size.width);
    CGSize  newSize   = CGSizeMake(width, newHeight);
    
    return newSize;
}

+ (CGSize)resetFromSize:(const CGSize)size withFixedHeight:(const CGFloat)height {
    float  newWidth = size.width * (height / size.height);
    CGSize newSize  = CGSizeMake(newWidth, height);
    
    return newSize;
}

+ (instancetype)mathOnceLinearEquationWithPointA:(const CGPoint)pointA PointB:(const CGPoint)pointB {
    SJMath *equation = [[[self class] alloc] init];
    
    CGFloat x1 = pointA.x;
    CGFloat y1 = pointA.y;
    CGFloat x2 = pointB.x;
    CGFloat y2 = pointB.y;
    
    equation.k = calculateSlope(x1, y1, x2, y2);
    equation.b = calculateConstant(x1, y1, x2, y2);
    
    return equation;
}

- (CGFloat)xValueWhenYEqual:(const CGFloat)yValue {
    
    return (0 == _k) ? 0:((yValue - _b) / _k);
}

- (CGFloat)yValueWhenXEqual:(const CGFloat)xValue {
    return _k * xValue + _b;
}

#pragma mark - private

CGFloat calculateSlope(const CGFloat x1, const CGFloat y1, const CGFloat x2, const CGFloat y2) {
    return (x2 == x1) ? 0:((y2 - y1) / (x2 - x1));
}

CGFloat calculateConstant(const CGFloat x1, const CGFloat y1, const CGFloat x2, const CGFloat y2) {
    
    return (x2 == x1) ? 0:((y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1));
}


@end
