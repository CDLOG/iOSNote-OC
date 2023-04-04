//
//  AppDelegate.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) UIScene * scene;
@property (strong, nonatomic)  UITabBarController* tabBarVC;
+ (AppDelegate *)shareApplication;
@end

