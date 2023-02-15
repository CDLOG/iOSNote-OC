//
//  AppDelegate.m
//  02-微信
//
//  Created by xiaomage on 15/8/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TimelineViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    
//}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // self.url = url.absoluteString;
    
    // 1.将URL转成字符串
    NSString *urlString = url.absoluteString;
    
    // 获取到主页控制器
    UINavigationController *rootNav = (UINavigationController *)self.window.rootViewController;
    [rootNav popToRootViewControllerAnimated:NO];
    ViewController *homeVc = [rootNav.childViewControllers firstObject];
    homeVc.urlString = urlString;
    
    // 2.判断是通过朋友圈还是微信好友跳转过来
    if ([urlString containsString:@"timeline"]) {
        TimelineViewController *timeVC = [[TimelineViewController alloc]init];
        timeVC.view.backgroundColor = [UIColor whiteColor];
        timeVC.urlString = urlString;
        [homeVc.navigationController pushViewController:timeVC animated:YES];
    } 
    
    return YES;
}

@end
