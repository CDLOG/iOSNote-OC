//
//  NTSetRootVC.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/23.
//  返回需要的根控制器
// 控制器切换
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTSetRootVC : NSObject

/// App启动的控制器判断(引导页和主界面)
+ (UIViewController *)chooseWindowRootVC;
@end

NS_ASSUME_NONNULL_END
