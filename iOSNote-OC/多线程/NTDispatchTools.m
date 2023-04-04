//
//  NTDispatchTools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/4.
//

#import "NTDispatchTools.h"

@implementation NTDispatchTools
/// 延时执行
/// - Parameters:
///   - interval: 时间
///   - completion: 代码
+ (void)startTimerWithInterval:(NSTimeInterval)interval completion:(void (^)(void))completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}
@end
