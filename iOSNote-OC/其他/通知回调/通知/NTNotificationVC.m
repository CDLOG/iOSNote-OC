//
//  NTNotificationVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NTNotificationVC.h"

@interface NTNotificationVC ()

@end

@implementation NTNotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self get];
    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self post];
}

//发送通知
-(void)post{
    //通知信息
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"userInfo消息" forKey:@"param"];
        
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:nil userInfo:dic];
}

// 添加通知观察者
-(void)get{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti3:) name:@"noti" object:nil];
    
}
//接收到消息执行的方法,参数包含通知的数据
-(void)noti3:(NSNotification *)noti{
    
    //使用userInfo处理消息
    
    NSDictionary  *dic = [noti userInfo];
    
    NSString *info = [dic objectForKey:@"param"];
    
    NSLog(@"接收 userInfo传递的消息：%@",info);
    
}
// 观察者需要移除通知
-(void)dealloc{
    
    //移除观察者，Observer不能为nil
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
