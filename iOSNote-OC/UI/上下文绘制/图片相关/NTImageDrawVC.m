//
//  NTImageDrawVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/26.
//

#import "NTImageDrawVC.h"
#import "UIImage+Image.h"
@interface NTImageDrawVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation NTImageDrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self watermark];
    self.imageView2.image = [UIImage imageWithClipImage:[UIImage imageNamed:@"1"] borderWidth:1 borderColor:[UIColor redColor]];
}
//图片文字水印绘制
-(void)watermark{
    // 加载图片
    UIImage *image = [UIImage imageNamed:@"img_01"];
    
    // 开启一个位图上下文，注意位图上下文跟view无关联，所以不需要在drawRect.
    // size:位图上下文的尺寸（新图片的尺寸）
    // opaque: 不透明度 YES：不透明 NO:透明，通常我们一般都弄透明的上下文
    // scale:通常不需要缩放上下文，取值为0，表示不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    
    // 1.绘制原生的图片
    [image drawAtPoint:CGPointZero];
    
    // 2.给原生的图片添加文字
    NSString *str = @"图片水印";
    
    // 创建字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    [str drawAtPoint:CGPointMake(image.size.width-80, image.size.height-30) withAttributes:dict];
    
    // 3.生成一张图片给我们,从上下文中获取图片
    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    _imageView.image = imageWater;
}

@end
