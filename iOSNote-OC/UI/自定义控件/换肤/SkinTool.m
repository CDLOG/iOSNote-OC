//
//  SkinTool.m
//  换肤
//
//  Created by xiaomage on 15/8/19.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "SkinTool.h"

@implementation SkinTool

static NSString *_skinColor;

+ (void)initialize
{
    _skinColor = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
    //默认皮肤
    if (_skinColor == nil) {
        _skinColor = @"blue";
    }
}

+ (void)setSKinColor:(NSString *)skinColor
{
    _skinColor = skinColor;
    
    // 保存用户选中的皮肤颜色
    [[NSUserDefaults standardUserDefaults] setObject:skinColor forKey:@"skinColor"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (UIImage *)skinToolWithImageName:(NSString *)imageName
{
    NSString *imagePath = [NSString stringWithFormat:@"%@_%@", _skinColor ,imageName];
    
    return [UIImage imageNamed:imagePath];
}

+ (UIColor *)skinToolWithLabelColor
{
    
    NSInteger red = 0;
    NSInteger green = 0;
    NSInteger blue = 0;
    
    if([_skinColor  isEqual: @"blue"]){
         red = 0;
         green = 0;
         blue = 255;
    }else if([_skinColor  isEqual: @"green"]){
        red = 0;
        green = 255;
        blue = 0;
    }
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
