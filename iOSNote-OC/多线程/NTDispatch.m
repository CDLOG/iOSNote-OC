//
//  NTDispatch.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import "NTDispatch.h"

@implementation NTDispatch


/// 后台执行耗时操作,主线程刷新UI
-(void)dispatch_background{
    dispatch_queue_t backgroundQueue = dispatch_queue_create("backgroundQueue", NULL);

    dispatch_async(backgroundQueue, ^{
        // 需要执行的耗时操作

        dispatch_async(dispatch_get_main_queue(), ^{
            // 在主线程上执行UI更新操作
        });
    });
}

/// 转换回到主线程执行的操作
-(void)dispatch_main{
    dispatch_async(dispatch_get_main_queue(), ^{
        // 在主线程上执行UI更新操作
    });
}
@end
