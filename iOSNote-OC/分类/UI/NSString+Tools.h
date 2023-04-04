//
//  NSString+Tools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Tools)

/// 隐藏手机号
/// - Parameter phone: 手机号
+(NSString *)hidePhone:(NSString *)phone;


/// 返回布尔值的字符串
/// - Parameter boolValue: 布尔值
+(NSString *)boolPrint:(BOOL)boolValue;



/// 根据传入的字符串、指定区间、字体、颜色和字体大小，返回一段富文本
//示例:self.testLable.attributedText = [NSString attributedStringWithString:self.testLable.text range:NSMakeRange(1, 2) font:[UIFont fontWithName:@"Helvetica-Bold" size:20] color:[UIColor redColor] fontSize:13];
+ (NSAttributedString *)attributedStringWithString:(NSString *)string range:(NSRange)range font:(UIFont *)font color:(UIColor *)color fontSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
