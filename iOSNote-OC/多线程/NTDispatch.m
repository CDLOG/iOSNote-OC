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

#pragma mark 两个异步任务同步执行
//(A,B)执行完成后再执行C任务(C需要A和B的数据等)
/*
 计数器实现:dispatch_group_enter和dispatch_group_leave
 dispatch_group_enter 标志着一个任务追加到 group，执行一次，相当于 group 中未执行完毕任务数+1
 dispatch_group_leave 标志着一个任务离开了 group，执行一次，相当于 group 中未执行完毕任务数-1。
 当 group 中未执行完毕任务数为0的时候，才会使dispatch_group_wait解除阻塞，以及执行追加到dispatch_group_notify中的任务。
 异步任务执行前执行dispatch_group_enter
 */
//演示
-(void)loadGroup2{
    NSURLSession *session = [NSURLSession sharedSession];
    
    //创建队列组
    dispatch_group_t dispatchGroup = dispatch_group_create();
    //任务A加入队列组
    dispatch_group_enter(dispatchGroup);

    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        sleep(2.0);
        NSLog(@"got2 data from internet2");
        
                dispatch_group_leave(dispatchGroup);
    }];
    //    执行网络任务
    [task resume];
    //任务B加入队列组
    dispatch_group_enter(dispatchGroup);
    
    NSURLSessionDataTask *task2 = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        sleep(2.0);
        NSLog(@"got2 data from internet1");
        dispatch_group_leave(dispatchGroup);
        
    }];
    [task2 resume];
    
    //任务C返回主线程执行
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
        NSLog(@"end");
    });
}

@end
