//
//  NTReachabilityVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/9.
//

#import "NTReachabilityVC.h"
#import <AFNetworkReachabilityManager.h>
@interface NTReachabilityVC ()
/** 监控网络 */
@property (nonatomic, strong) AFNetworkReachabilityManager *reachability;
@end

@implementation NTReachabilityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self afnMonitoring];
}

- (void)afnMonitoring
{
    // 开始网络监控
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];

    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"-----当前的网络状态---%zd", status);
    }];
    
    [mgr startMonitoring];
    
    // 拿到当前网络状态
//    mgr.networkReachabilityStatus;
}


@end
