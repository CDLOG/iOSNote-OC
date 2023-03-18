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


- (void)viewDidLoad {
    [super viewDidLoad];
}


//统一设置返回按钮样式

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];    
// 当非根控制器设置导航条左侧返回按钮
    if (self.viewControllers.count > 1) {
        // 跟控制器
        // 设置导航条左侧返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
}
- (void)back{
    [self popViewControllerAnimated:YES];
}
@end
