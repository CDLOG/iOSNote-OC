//
//  XMGProvince.h
//  04-键盘处理
//
//  Created by xiaomage on 15/6/9.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGProvince : NSObject

@property (nonatomic, strong) NSArray *cities;

@property (nonatomic, strong) NSString *name;


+ (instancetype)provinceWithDict:(NSDictionary *)dict;

@end
