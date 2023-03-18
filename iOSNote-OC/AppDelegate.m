//
//  AppDelegate.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NTTabBarVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)shareApplication {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self addRootVC];
    return YES;
}


/// 添加根控制器
-(void)addRootVC{
    if (@available(iOS 13.0, *)) {
        
    }
    else {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor grayColor];
        self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]] ;
        [self.window makeKeyAndVisible];
    }
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
