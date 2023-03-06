//
//  ViewController.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import "ViewController.h"
#import "ViewNoteController.h"
#import "XcodeVC.h"
#import "NTDelegateVC.h"
#import "NTBlockVC.h"
@interface ViewController ()<NTDelegateVCDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    

    [super viewDidLoad];
    UIButton *hitBtn = [UIView addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 200, 200) Title:@"加载"];
    [hitBtn addTarget:self action:@selector(loadAction) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"导航";
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)loadAction{
    NTBlockVC *vc = [[NTBlockVC alloc]init];
    vc.myBlock = ^(NSString * _Nonnull data) {
        NSLog(@"被动接受的数据--%@",data);
    };
    [vc clickWithBlock:^(NSString * _Nonnull data) {
        NSLog(@"函数调用完成后block返回的数据--%@",data);
    }];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
