//
//  NSString+Tools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)
/// 隐藏手机号
/// - Parameter phone: 手机号
+(NSString *)hidePhone:(NSString *)phone{
    if(phone.length != 11){
        return @"手机号错误";
    }
    return [phone stringByReplacingOccurrencesOfString:[phone substringWithRange:NSMakeRange(3,4)]withString:@"****"];
}

/// 返回布尔值的字符串
/// - Parameter boolValue: 布尔值
+(NSString *)boolPrint:(BOOL)boolValue{
    return boolValue?@"YES":@"NO";
}


+ (NSAttributedString *)attributedStringWithString:(NSString *)string range:(NSRange)range font:(UIFont *)font color:(UIColor *)color fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (NSMaxRange(range) > string.length) {
        range = NSMakeRange(0, string.length);
    }
    
    UIFontDescriptor *fontDescriptor = font.fontDescriptor;
    UIFontDescriptor *newFontDescriptor = [fontDescriptor fontDescriptorWithSize:fontSize];
    UIFont *newFont = [UIFont fontWithDescriptor:newFontDescriptor size:0];
    [attributedString addAttributes:@{ NSFontAttributeName: newFont, NSForegroundColorAttributeName: color } range:range];

    return attributedString;
}
@end
