//
//  TimelineViewController.m
//  02-微信
//
//  Created by xiaomage on 15/8/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "TimelineViewController.h"

@interface TimelineViewController ()

- (IBAction)backToApp;

@end

@implementation TimelineViewController

- (IBAction)backToApp {
    
    // 0.拿到对应应用程序的urlScheme(wechat://session?news)
    /*
    NSRange range = [self.urlString rangeOfString:@"?"];
    range.location;
    self.urlString substringFromIndex:range.location
     */
    NSString *urlSchemeString = [[self.urlString componentsSeparatedByString:@"?"] lastObject];
    NSString *urlString = [urlSchemeString stringByAppendingString:@"://"];

    // 2.判断是否可以打开
    [self openURLWithString:urlString];
}

- (void)openURLWithString:(NSString *)urlString
{
    // 1.获取到对应应用程序的URL
    NSURL *wechatURL = [NSURL URLWithString:urlString];
    
    // 2.判断手机中是否安装了对应的应用程序
    if ([[UIApplication sharedApplication] canOpenURL:wechatURL]) {
        
        // 3.打开应用程序
        [[UIApplication sharedApplication] openURL:wechatURL options:nil completionHandler:nil];
    }
}

@end
