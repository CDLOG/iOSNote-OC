//
//  NTSaveTool.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/23.
//

#import "NTSaveTool.h"

@implementation NTSaveTool

/// 保存数据
/// - Parameter defaultName: key
+ (nullable id)objectForKey:(NSString *)defaultName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}


/// 设置数据
/// - Parameters:
///   - value: 值
///   - defaultName: key
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName{
    if (defaultName) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
