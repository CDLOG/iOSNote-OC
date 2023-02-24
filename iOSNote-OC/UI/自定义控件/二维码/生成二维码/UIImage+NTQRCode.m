//
//  UIImage+NTQRCode.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import "UIImage+NTQRCode.h"

@implementation UIImage (NTQRCode)



+(UIImage *)creatQRCode:(NSString *)text andSize:(CGFloat) size {   
    
    // 创建一个CIFilter对象，用于生成二维码图像
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 将输入数据设置为文本内容
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    // 设置纠错级别
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    // 生成CIImage对象
    CIImage *image = filter.outputImage;
    

    // 将CIImage对象转换为UIImage对象，并调整大小
    UIImage *qrCodeImage = [self createNonInterpolatedUIImageFormCIImage:image withSize:size];
    
    return qrCodeImage;
}
/**
 *  根据CIImage生成指定大小的UIImage,并解决二维码模糊的问题
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
@end
