//
//  UIBarButtonItem+UISet.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (UISet)

/// 设置item个钟属性下的图片,和方法
/// - Parameters:
///   - image: 默认图片
///   - highImage: 高亮图片
///   - target: self
///   - action: 方法地址
+ (UIBarButtonItem *)itemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithimage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;


/// 设置返回按钮
+ (UIBarButtonItem *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
