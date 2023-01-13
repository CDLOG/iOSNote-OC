//
//  NTUIApplicationVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/13.
// 通过UIApplication进行系统级别操作

#import "NTUIApplicationVC.h"

@interface NTUIApplicationVC ()

@end

@implementation NTUIApplicationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



/// 打开外部链接
-(void)openUrl{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    [[UIApplication sharedApplication] openURL:url options:nil completionHandler:^(BOOL success) {
        NSLog(@"加载完成");
    }];
}
#pragma mark - 设置提醒数字
- (void)application
{
    

}



/// 隐藏状态栏
- (void)statusHidden
{
    // 获取UIApplication
    UIApplication *app = [UIApplication sharedApplication];
    
    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}
#pragma mark - 控制器设置状态栏
// 在iOS7以后，状态栏默认由控制器决定
// 隐藏状态栏
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}


//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}



@end
