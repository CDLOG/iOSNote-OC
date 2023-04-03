//
//  NTOddVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NTOddVC.h"
#import "UIButton+Tools.h"
#import "UIControl+tools.h"
@interface NTOddVC ()
@end

@implementation NTOddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    UIButton *btn= [UIButton addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 80, 40) Title:@"点击"];
    //    [btn addTarget:self action:@selector(repetitionClick) forControlEvents:UIControlEventTouchUpInside withInterval:3.0];
    ////    [btn clickLimit_addTarget:self action:@selector(repetitionClick) forControlEvents:UIControlEventTouchUpInside withClickLimitInterval:3];
    //}
    //
    //-(void)repetitionClick{
    //    NSLog(@"点击了");
    //}
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [button setTitle:@"Click Me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.center = self.view.center;
    button.layer.cornerRadius = 10.0;
    button.layer.masksToBounds = YES;
    [self.view addSubview:button];
    
    // 设置按钮点击事件的最小时间间隔为1秒
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button addClickLimitWithInterval:3];
//    [button addClickLimitWithSelector:@selector(buttonClicked:) limitInterval:3];
}
- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"Button clicked!");
}



@end
