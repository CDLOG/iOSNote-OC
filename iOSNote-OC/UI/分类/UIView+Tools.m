//
//  UIView+Tools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import "UIView+Tools.h"

@implementation UIView (Tools)

/// 控件虚线边框
/// - Parameters:
///   - view: 需要添加边框的控件
///   - lineWidth: 虚线宽度
///   - strokeColor:虚线颜色
///   - lineDash: 虚线长度
///   - linePattern: 虚线间距
+(void)dottedLineBorder:(UIView *)view
           andLineWidth:(float)lineWidth
         andStrokeColor:(UIColor *)strokeColor andLineDash:(float)lineDash andLinePattern:(float)linePattern{
    CAShapeLayer *dottedLineBorder  = [[CAShapeLayer alloc] init];

    dottedLineBorder.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);

    [dottedLineBorder setLineWidth:lineWidth];

    [dottedLineBorder setStrokeColor:strokeColor.CGColor];

    [dottedLineBorder setFillColor:[UIColor clearColor].CGColor];

    dottedLineBorder.lineDashPattern = @[@(lineDash),@(linePattern)];//10 - 线段长度 ，20 － 线段与线段间距

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:dottedLineBorder.frame];

    dottedLineBorder.path = path.CGPath;

    [view.layer addSublayer:dottedLineBorder];
}

#pragma mark 添加按钮

+ (UIButton *)addButtonWithUIview:(UIView *)view  Frame:(CGRect)frame
{
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    // 设置位置和尺寸
    btn.frame = frame;
    // 添加按钮
    [view addSubview:btn];
    return btn;
}

@end
