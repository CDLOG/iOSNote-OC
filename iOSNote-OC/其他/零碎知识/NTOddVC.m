//
//  NTOddVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NTOddVC.h"
#import "UIButton+Tools.h"
#import "NSObject+Extension.h"
#import "NTTools_Method.h"
#import "NSString+Tools.h"
@interface NTOddVC ()
@end

@implementation NTOddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn= [UIButton addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 80, 40) Title:@"点击"];
    [btn addClickLimitWithInterval:3];
    [btn addTarget:self action:@selector(repetitionClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}




-(void)repetitionClick{
    
    NSString * number = [NSString stringWithFormat:@"tel://%@",@"18328035560"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:number]];
}


@end
