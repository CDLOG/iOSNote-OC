//
//  NTTips.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/15.
//
//零散的知识

#import "NTTips.h"

@interface NTTips ()

@end

@implementation NTTips

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


/// 加载原始图片
-(void)iamgeLoadOriginal{
    UIImage *image = [UIImage imageNamed:@"tt"];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
/// 控件大小图片自适应
-(void)viewFit{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tt"]];
    [imageView sizeToFit];
}


/// 及时监听文本框内容的改变
-(void)textChange{
    
    UITextField *textField = [[UITextField alloc]init];
    [textField addTarget:self action:@selector(txtChange) forControlEvents:UIControlEventEditingChanged];
    
}
-(void)txtChange{
    NSLog(@"文字改变");
}

/// 结束程序运行
-(void)finishApp{
    exit(0);
}

@end
