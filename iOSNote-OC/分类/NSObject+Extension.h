//
//  NSObject+Extension.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extension)

/// 根据函数名和函数参数,调用函数,可用于JS调用OC函数
/// - Parameters:
///   - selector: 函数名
///   - objects: 函数参数
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;

@end

NS_ASSUME_NONNULL_END
