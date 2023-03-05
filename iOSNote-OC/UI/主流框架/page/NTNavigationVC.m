//
//  NTNavigationVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/5.
//

#import "NTNavigationVC.h"

@interface NTNavigationVC ()

@end

@implementation NTNavigationVC

// 什么时候调用 当程序一启动的时候就会调用
// 作用: 将当前类加载进内存, 放在代码区,比main更先调用
//+ (void)load{
//    NSLog(@"%s",__func__);
//}

// 什么时候调用 当第一次初始这个类的时候调用,只会调用一次
// 设置导航条内容
// 作用 初始化这个类
+ (void)initialize{
//    NSLog(@"%s",__func__);
    
    // 1.获取导航条标识(当需要在类方法中,使用self方法时,用标识解决)
    // Class 获取某几个类的导航条标识,进行统一设置
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[NTNavigationVC class]]];

    //设置导航条的背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置字体颜色大小
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    
    //字体大小
    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
    // 字体颜色
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:dictM];

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
