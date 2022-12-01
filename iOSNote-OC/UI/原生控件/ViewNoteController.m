//
//  ViewNoteController.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import "ViewNoteController.h"
#import "UIView+Tools.h"
@interface ViewNoteController ()

@end

@implementation ViewNoteController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIButtonNote];
    // Do any additional setup after loading the view from its nib.
}


/// UIView的相关属性
-(void)UIViewNote{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
//    添加子控件
    [self.view addSubview:view];
//    获取父控件
    NSLog(@"%@",view.superview);
//    获取所有子控件
    NSLog(@"%@",self.view.subviews);
//    控件的ID(标识)，父控件可以通过tag来找到对应的子控件
    view.tag = 10;
//    根据一个tag标识找出对应的控件（一般都是子控件）
    [self.view viewWithTag:10];
//    将自己从父控件中移除
//    [view removeFromSuperview];
//    虚线边框
    [UIView dottedLineBorder:view andLineWidth:2 andStrokeColor:[UIColor grayColor] andLineDash:10 andLinePattern:4];
}

/// 按钮的相关属性
-(void)UIButtonNote{
//    创建自定义类型的按钮,避免被系统设置干扰
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 40);
    [self.view addSubview:button];
//    按钮状态,根据不同的状态单独设置,按钮的颜色标题等.
//    设置普通状态下的文字
    [button setTitle:@"确定" forState:UIControlStateNormal];
//  设置普通状态下的文字颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    将按钮设置为选中状态
    [button setSelected:YES];
//    设置选中状态下的文字
    [button setTitle:@"取消" forState:UIControlStateSelected];
//    设置按钮图片
    [button setImage:[UIImage imageNamed:@"default_icon"] forState:UIControlStateNormal];
//    设置按钮背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"default_bg"] forState:UIControlStateNormal];
    
}

@end
