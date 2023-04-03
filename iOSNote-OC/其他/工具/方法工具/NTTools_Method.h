//
//  NTTools_Method.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTTools_Method : NSObject
/**
 * 限制指定函数的执行频率，通过delay参数控制时间间隔,先延时,后执行
 * @param delay 时间间隔
 * @param target 目标对象
 * @param selector 目标方法
 * @param argument 目标方法的参数
 */
+ (void)debounceWithDelay:(NSTimeInterval)delay target:(id)target selector:(SEL)selector argument:(nullable id)argument;
@end

NS_ASSUME_NONNULL_END
