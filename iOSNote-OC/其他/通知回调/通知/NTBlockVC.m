//
//  NTBlockVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/6.
//

#import "NTBlockVC.h"

@interface NTBlockVC ()

@end

@implementation NTBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *clickBtn1 = [UIButton addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 180, 40) Title:@"block作为属性回调1"];
    [clickBtn1 addTarget:self action:@selector(clickAction1) forControlEvents:UIControlEventTouchUpInside];
    UIButton *clickBtn2 = [UIButton addButtonWithUIview:self.view Frame:CGRectMake(100, 200, 80, 40) Title:@"block作为参数回调2"];
    [clickBtn2 addTarget:self action:@selector(clickWithBlock:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickAction1{
    if(self.myBlock){
        self.myBlock(@"传递的数据");
    }
}

-(void)clickWithBlock:(MyBlock2)myblockAcion{
    //执行代码
    //...
    //回调
    if(myblockAcion){
        myblockAcion(@"block返回的数据");
    }
}

@end
