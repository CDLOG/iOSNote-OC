//
//  UIImage+Image.h
//  02-图片裁剪
//
//  Created by xiaomage on 15/6/19.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/// 返回圆形图片(头像)
/// - Parameters:
///   - image: 图片
///   - borderWidth: 边框宽度
///   - color: 边框颜色
+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;
@end
