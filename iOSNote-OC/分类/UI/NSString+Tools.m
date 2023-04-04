//
//  NSString+Tools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)
/// 隐藏手机号
/// - Parameter phone: 手机号
+(NSString *)hidePhone:(NSString *)phone{
    if(phone.length != 11){
        return @"手机号错误";
    }
    return [phone stringByReplacingOccurrencesOfString:[phone substringWithRange:NSMakeRange(3,4)]withString:@"****"];
}

/// 返回布尔值的字符串
/// - Parameter boolValue: 布尔值
+(NSString *)boolPrint:(BOOL)boolValue{
    return boolValue?@"YES":@"NO";
}

@end
