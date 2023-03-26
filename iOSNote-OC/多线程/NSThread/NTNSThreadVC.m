//
//  NTNSThreadVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/26.
//

#import "NTNSThreadVC.h"

@interface NTNSThreadVC ()

@end

@implementation NTNSThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)introduce{
    //1.获得主线程
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"%@",mainThread);
    
    //2.获得当前线程
    NSThread *currentThread  = [NSThread currentThread];
    NSLog(@"%@",currentThread);
    
    //3.判断主线程
    BOOL isMainThreadA = [NSThread isMainThread];
}
//1.alloc init 创建线程,需要手动启动线程
//线程的生命周期:当任务执行完毕之后被释放掉
-(void)createNewThread1
{
    //1.创建线程
    NSThread *threadA = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    
    //设置属性
    threadA.name = @"线程A";
    //设置优先级  取值范围 0.0 ~ 1.0 之间 最高是1.0 默认优先级是0.5
    threadA.threadPriority = 1.0;
    
    //2.启动线程
    [threadA start];
}

//2.分离子线程,自动启动线程
-(void)createNewThread2
{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"分离子线程"];
}

//3.开启一条后台线程
-(void)createNewThread3
{
    [self performSelectorInBackground:@selector(run:) withObject:@"开启后台线程"];
}

-(void)run:(NSString *)param
{
    NSLog(@"---run----%@---%@",[NSThread currentThread].name,param);

}
@end
