//
//  UIDevice.h
//
//  Created by Geniune on 2020/4/23.
//  Copyright © 2020 Geniune. All rights reserved.
//


/*
 使用方法如下：
 ```
 #import "UIDevice+Hardware.h" //需要import头文件

 UIDevice *device = [UIDevice currentDevice];
 NSLog(@"%@", [device generation]); //输出
 ```
 */

@interface UIDevice (Hardware)

//注意：请使用真机测试，否则会固定返回simulator
- (NSString *)generation;

@end
