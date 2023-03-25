//
//  NTNavigationVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/5.
//

#import "NTNavigationVC.h"

@interface NTNavigationVC ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
/** 系统手势代理 */
@property (nonatomic, strong) id popGesture;

@end

@implementation NTNavigationVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self allScreenMove];
    
}

/// 系统滑动移除控制器的方法(只有滑动左边才行)
-(void)systemMove{
    //保存滑动返回手势代理
    self.popGesture = self.interactivePopGestureRecognizer.delegate;
    // 当是跟控制器,还原代理,如果是非跟控制器,清空代理
    self.delegate = self;
}

/// 全屏滑动移除控制器
-(void)allScreenMove{
    
    UIScreenEdgePanGestureRecognizer *gest = self.interactivePopGestureRecognizer;
    

    id target = self.interactivePopGestureRecognizer.delegate;
//    // 2.自己添加手势
//    // 禁止系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];

    pan.delegate = self;
}
#pragma mark - UIGestureRecognizerDelegate
// 当开始滑动的就会调用 如果返回YES ,可以滑动 返回NO,禁止手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    // 当是跟控制器不让移除(禁止), 非根控制器,允许移除控制
    BOOL open = self.viewControllers.count > 1;
    
    return open;
}

#pragma mark - UINavigationControllerDelegate
// 当控制器显示完毕的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers[0] == viewController) {
        // 还原代理,根控制器不能滑动
        self.interactivePopGestureRecognizer.delegate  = self.popGesture;
    }else{
//        清空代理,可以滑动返回
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}




//统一设置返回按钮样式

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    // 当非根控制器隐藏底部tabbar,要放重写父类之前
    
    if (self.viewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    
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
