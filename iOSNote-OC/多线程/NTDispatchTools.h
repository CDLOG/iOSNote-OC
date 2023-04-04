//
//  NTDispatchTools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTDispatchTools : NSObject


/// 延时执行
/// - Parameters:
///   - interval: 时间
///   - completion: 代码
+ (void)startTimerWithInterval:(NSTimeInterval)interval completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
