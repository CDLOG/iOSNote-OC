//
//  NTAppDelegate.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/13.
// app的生命周期代理

#import "NTAppDelegate.h"

@implementation NTAppDelegate

// 程序启动完成的时候调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s",__func__);
    return YES;
}

// 当app失去焦点的时候调用
- (void)applicationWillResignActive:(UIApplication *)application {
        NSLog(@"%s",__func__);
  
}

// app进入后台的时候调用
// app忽然打断的时候，在这里保存一些需要用到的数据
- (void)applicationDidEnterBackground:(UIApplication *)application {
        NSLog(@"%s",__func__);

}


// app进入即将前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
        NSLog(@"%s",__func__);

}

// 当app获取到焦点的时候调用，意味着app可以与用户交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
        NSLog(@"%s",__func__);

}

// app被关闭的时候调用
- (void)applicationWillTerminate:(UIApplication *)application {
        NSLog(@"%s",__func__);

}


// app接收到内存警告的时候调用
// 清空图片的缓存
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"%s",__func__);
}

@end


