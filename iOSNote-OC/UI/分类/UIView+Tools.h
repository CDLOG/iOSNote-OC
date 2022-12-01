//
//  UIView+Tools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Tools)
/// 控件虚线边框
/// - Parameters:
///   - view: 需要添加边框的控件
///   - lineWidth: 虚线宽度
///   - strokeColor:虚线颜色
///   - lineDash: 虚线长度
///   - linePattern: 虚线间距
+(void)dottedLineBorder:(UIView *)view
           andLineWidth:(float)lineWidth
         andStrokeColor:(UIColor *)strokeColor andLineDash:(float)lineDash andLinePattern:(float)linePattern;


/// 给uiview添加按钮和事件
/// - Parameters:
///   - view: 目标view
///   - frame: 在目标view的frame
+ (UIButton *)addButtonWithUIview:(UIView *)view  Frame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
