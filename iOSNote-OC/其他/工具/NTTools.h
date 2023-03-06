//
//  NTTools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTTools : NSObject

#pragma mark- 图片相关

/**
 *  加载原始图片
 *
 *  @param name 图片名字
 *
 *  @return 返回一张不要渲染的图片
 */
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name;
 

#pragma mark- 文字相关

/// 实时检测文本框文字改变
/// - Parameters:
///   - textField: 文本框
///   - target: 文本框当前控制器
///   - action: 文字变化时的回调
+(void)textChange:(UITextField *)textField target:(nullable id)target action:(SEL)action;

#pragma mark- 系统相关
/// 结束程序运行
+(void)finishApp;

/// 获取APP的BundleID
+(NSString *)getBundleID;

/// 进入APP的权限设置界面
/// - Parameter ID: APP的BundleID,默认为当前APP的ID
+(void)openSettingWithID:(nullable NSString *)ID;
@end

NS_ASSUME_NONNULL_END
