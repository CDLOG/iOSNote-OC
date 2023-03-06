//
//  NTTools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import "NTTools.h"

@implementation NTTools


#pragma mark- 图片相关
/**
 *  加载原始图片
 *
 *  @param name 图片名字
 *
 *  @return 返回一张不要渲染的图片
 */
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name{
    UIImage *image =  [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
#pragma mark- 文字相关

+(void)textChange:(UITextField *)textField target:(nullable id)target action:(SEL)action{

    [textField addTarget:target action:action forControlEvents:UIControlEventEditingChanged];
    
}

#pragma mark- 系统相关
/// 结束程序运行
+(void)finishApp{
    exit(0);
}
/// 获取APP的BundleID
+(NSString *)getBundleID{
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    return bundleIdentifier;
}


+(void)openSettingWithID:(nullable NSString *)ID{
    if(ID == nil){
        ID = [NTTools getBundleID];
    }
    NSString *bundleIdentifier = ID; //
    NSURL *appSettingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:appSettingsURL]) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://", bundleIdentifier]];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        } else {
            [[UIApplication sharedApplication] openURL:appSettingsURL];
        }
    }
}

@end
