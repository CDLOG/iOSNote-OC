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

/// 跳转到前面跳转过的页面
/// - Parameter target: 页面类名
/// 使用示例:[self jumpExistVC: [XMGDealsViewController class]];
-(void)jumpExistVC:(Class)target{
    UIViewController *targetVC = nil;
    for (UIViewController * controller in self.navigationController.viewControllers) { //遍历
        
        if ([controller isKindOfClass:target]) {
            targetVC = controller;
        }
    }

    if (targetVC) {
        [self.navigationController popToViewController:targetVC animated:YES]; //跳转
    }
}

/// 跳转前面的某一级页面层级,然后推出新的页面,常用与某一个层级的不同页面逻辑
/// @param target 层级页面
/// @param page 新推出的页面
-(void)jumpNotExistVC:(Class)target andTargetVC:(UIViewController *)page{

    UIViewController *targetVC = nil;

    for (UIViewController * controller in self.navigationController.viewControllers) { //遍历
        
        if ([controller isKindOfClass:[target class]]) { //这里判断是否为你想要跳转的页面
            
            targetVC = controller;
            
        }
        
    }

    if (target) {
        [self.navigationController popToViewController:targetVC animated:YES]; //跳转
        [self.navigationController pushViewController:page animated:NO]; //跳转
    }

}
@end
