//
//  NTSaveTool.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTSaveTool : NSObject

/// 读取数据
/// - Parameter defaultName: key
+ (nullable id)objectForKey:(NSString *)defaultName;


/// 设置数据
/// - Parameters:
///   - value: 值
///   - defaultName: key
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;
@end

NS_ASSUME_NONNULL_END
