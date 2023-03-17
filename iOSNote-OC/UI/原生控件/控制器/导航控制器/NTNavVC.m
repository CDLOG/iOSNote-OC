//
//  NTNavVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/15.
//

/* 控制器view的生命周期,LoadView,viewDidLoad,viewWillAppear,
viewWillLayoutSubviews,viewDidLayoutSubviews,viewDidAppear,
 viewWillDisappear,viewDidDisappear
*/


#import "NTNavVC.h"

@interface NTNavVC ()

@end

@implementation NTNavVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self navUI];
    [self navigationBarUI];
    
    
}


// 什么时候调用 当第一次初始这个类的时候调用,只会调用一次
// 设置导航条内容
+ (void)initialize{
//    NSLog(@"%s",__func__);
    
    // 1.获取导航条标识(当需要在类方法中,使用self方法时,用标识解决)
    // Class 获取某几个类的导航条标识,进行统一设置
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];

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


//导航条内容(导航条背景色,标题的大小和颜色)
-(void)navigationBarUI{
    
    //导航条的背景色在没有滑动之前,是透明的,显示的是上一层的颜色
    
    //通过颜色设置导航条的背景色
    self.navigationBar.barTintColor=[UIColor colorWithRed:0 green:148 / 255.0 blue:238 /255.0 alpha:1];
    //通过图片设置导航条的颜色
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];

    // 设置字体颜色大小
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];

    //字体大小
    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
    // 字体颜色
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];

    [self.navigationBar setTitleTextAttributes:dictM];
}

//导航栏的内容由栈顶控制器的navigationItem属性决定
//左右和中间的视图,可以设置文字,图片,控件.
-(void)navUI{
    //左上角的返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]init];
    //中间的标题视图
    self.navigationItem.titleView = [[UIView alloc]init];
    //中间的标题文字
    self.navigationItem.title = @"标题";
    //左上角的视图
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:0 target:self action:@selector(backClick)];
    //右上角的视图
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
}

-(void)backClick{
    NSLog(@"点击返回");
}

/// 导航控制器的跳转
-(void)jump{
    //使用push方法能将某个控制器压入栈
    UIViewController *newVC = [UIViewController new];
    [self.navigationController pushViewController:newVC animated:YES];
    
    //使用pop方法可以移除控制器,返回上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
    //回到指定的子控制器
    [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
    //回到根控制器（栈底控制器）
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
