//
//  NTSDWebimageUseVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/5.
//

#import "NTSDWebimageUseVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIImage+GIF.h>
@interface NTSDWebimageUseVC ()
@property (weak, nonatomic) IBOutlet UIView *baseView;

@end

@implementation NTSDWebimageUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)testAction:(id)sender {
    
    
}
#pragma mark 加载gif
/*
 头文件:#import <SDWebImage/UIImageView+WebCache.h>
       #import <SDWebImage/UIImage+GIF.h>
 */
-(void)loadGIf{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

    NSURL *gifURL = [NSURL URLWithString:@"https://img.zcool.cn/community/01be175c613345a801203d222acdde.gif"];
    [imageView sd_setImageWithURL:gifURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image.images) {
            // 如果是GIF图片，则播放动画
            imageView.animationImages = image.images;
            imageView.animationDuration = image.duration;
            imageView.animationRepeatCount = 0; // 0 表示无限循环
            [imageView startAnimating];
        }
    }];
    [self.baseView addSubview:imageView];
}


@end
