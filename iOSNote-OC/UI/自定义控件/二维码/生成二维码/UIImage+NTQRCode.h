//
//  UIImage+NTQRCode.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (NTQRCode)


/// 返回二维码图片
/// - Parameters:
///   - text: 文字信息
///   - size: 二维码的宽高
+(UIImage *)creatQRCode:(NSString *)text andSize:(CGFloat) size;

@end

NS_ASSUME_NONNULL_END
