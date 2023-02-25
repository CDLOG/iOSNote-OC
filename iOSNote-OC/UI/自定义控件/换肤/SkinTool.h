//
//  SkinTool.h
//  换肤
//
//  Created by xiaomage on 15/8/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkinTool : NSObject


/// 保存用户选择的皮肤颜色
/// - Parameter skinColor: 皮肤颜色
+ (void)setSKinColor:(NSString *)skinColor;


/// 返回当前皮肤的图片,图片名:当前皮肤_图片名
/// - Parameter imageName: 图片名
+ (UIImage *)skinToolWithImageName:(NSString *)imageName;

/// 返回当前皮肤的文本颜色
+ (UIColor *)skinToolWithLabelColor;

@end
