//
//  ViewController.m
//  01-新闻
//
//  Created by xiaomage on 15/8/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

/*
 URL : 统一资源定位符(可以没有路径,但是必须有协议头 http:// )
 scheme : 协议头,用来决定查找资源的方式 http:// ftp://
 path : 路径
 
 默认情况下应用程序是没有URL,并且在iOS中打开一个应用程序只要能拿到这个应用程序的协议头即可
 */

#import "ViewController.h"

@interface ViewController ()

- (IBAction)skipToWechat;
- (IBAction)skipToTimeline;
- (IBAction)skipToSession;

@end

@implementation ViewController

- (IBAction)skipToWechat {
    [self openURLWithString:@"wechat222://"];
}

- (IBAction)skipToTimeline {
    [self openURLWithString:@"wechat222://timeline?news"];
}

- (IBAction)skipToSession {
    [self openURLWithString:@"wechat222://session?news"];
}

- (void)openURLWithString:(NSString *)urlString
{
    // 1.获取到对应应用程序的URL
    NSURL *wechatURL = [NSURL URLWithString:urlString];
    
    // 2.判断手机中是否安装了对应的应用程序
    if ([[UIApplication sharedApplication] canOpenURL:wechatURL]) {
        
        // 3.打开应用程序
        [[UIApplication sharedApplication] openURL:wechatURL];
    }
}

@end
