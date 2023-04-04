//
//  UIColor+Hex.h
//  颜色常识
//
//  Created by yz on 15/12/15.
//  Copyright © 2015年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 返回渐变图层
/*
 示例:
 UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
 NSArray *colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];
 CGPoint startPoint = CGPointMake(0, 0);
 CGPoint endPoint = CGPointMake(1, 1);
 CAGradientLayer *gradientLayer = [self gradientLayerWithFrame:view.bounds colors:colors startPoint:startPoint endPoint:endPoint];
 [view.layer addSublayer:gradientLayer];
 */
- (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame colors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
