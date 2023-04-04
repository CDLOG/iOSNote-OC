//
//  NSString+Tools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Tools)

/// 隐藏手机号
/// - Parameter phone: 手机号
+(NSString *)hidePhone:(NSString *)phone;


/// 返回布尔值的字符串
/// - Parameter boolValue: 布尔值
+(NSString *)boolPrint:(BOOL)boolValue;

@end

NS_ASSUME_NONNULL_END
