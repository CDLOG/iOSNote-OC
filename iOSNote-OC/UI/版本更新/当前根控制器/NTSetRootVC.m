//
//  NTSetRootVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/23.
//
#define NTVersion @"version"
#import "NTSetRootVC.h"
#import "NTTabBarVC.h"
@implementation NTSetRootVC
/// App启动的控制器判断(引导页和主界面)
+ (UIViewController *)chooseWindowRootVC{
    // 当有版本更新,或者第一次安装的时候显示新特性界面;
    // 1.获取当前版本号
  NSString *currVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSLog(@"%@",currVersion);
    
    // 2.上一次版本号
   NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:NTVersion];
    
    UIViewController *rootVc;
    
    if (![currVersion isEqualToString:lastVersion]) {
        // 进入引导页面
        rootVc = [[UIViewController alloc] init];
        rootVc.view.backgroundColor = [UIColor yellowColor];
        // 存储当前版本号
        [[NSUserDefaults standardUserDefaults] setObject:currVersion forKey:NTVersion];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        // 进入主框架
        UITabBarController *tabBarVc = [[NTTabBarVC alloc] init];
        rootVc = tabBarVc;
    }
    
    return rootVc;
}
@end
