//
//  XMGProvince.m
//  04-键盘处理
//
//  Created by xiaomage on 15/6/9.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGProvince.h"

@implementation XMGProvince


+ (instancetype)provinceWithDict:(NSDictionary *)dict
{
    XMGProvince *p = [[self alloc] init];
    
    [p setValuesForKeysWithDictionary:dict];
    
    return p;
}

@end
