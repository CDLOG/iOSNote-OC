//
//  NTDelegateVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/6.
//

#import "NTDelegateVC.h"

@interface NTDelegateVC ()

@end

@implementation NTDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *clickBtn = [UIButton addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 80, 40) Title:@"代理回调"];
    [clickBtn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickAction{
    // 通知
    if ([self.delegate respondsToSelector:@selector(delegateClick:andText:)]) {
        [self.delegate delegateClick:self andText:@"代理传递参数"];
    }

}


@end
