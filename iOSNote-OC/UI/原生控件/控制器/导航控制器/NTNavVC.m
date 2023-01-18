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
    
    
}
//导航栏的内容由栈顶控制器的navigationItem属性决定
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
