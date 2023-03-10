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
#import "NTCover.h"
#import "NTCoverView.h"
@interface ViewController ()

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
    //创建蒙版
    NTCover *view = [[NTCover alloc]init];
    view.canTouchHide = YES;
    //获取弹窗控件
    NTCoverView * addBaseView = [[NSBundle mainBundle]loadNibNamed:@"NTCoverView" owner:nil options:nil].firstObject;
    addBaseView.frame = CGRectMake(0, 0, sc_width, 200);
    //弹窗居中
    addBaseView.center = view.center;
    [view.baseView addSubview: addBaseView];
    [view show];
    
    addBaseView.cancelBlock = ^{
        [view hide];
    };
    
   
}

@end
