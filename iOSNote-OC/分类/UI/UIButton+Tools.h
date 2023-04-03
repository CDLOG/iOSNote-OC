//
//  UIButton+Tools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Tools)

/// 限制按钮的点击频率,避免重复执行
/// - Parameters:
///   - interval: 限制的时间间隔
- (void)addClickLimitWithInterval:(NSTimeInterval)interval;

@end

NS_ASSUME_NONNULL_END
