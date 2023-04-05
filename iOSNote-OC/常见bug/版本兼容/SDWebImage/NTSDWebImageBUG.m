//
//  NTSDWebImageBUG.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/5.
//

#import "NTSDWebImageBUG.h"

@interface NTSDWebImageBUG ()

@end

@implementation NTSDWebImageBUG

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - 版本4->5
-(void)bug{
/*    1.clearDiskOnCompletion和clearMemory失效
        [[[SDWebImageManager sharedManager] imageCache] clearWithCacheType:SDImageCacheTypeAll completion:nil];
*/
    
/*    2.downloadImageWithURL,loadImageWithURL失效
        [[SDWebImageManager sharedManager].imageLoader requestImageWithURL:[NSURL URLWithString:self.bgImgURL]  options:0 context:nil progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                         if (image) {
                         //
                         self.bgImageView.image = image;
                         CGFloat height = 0;
                         if (image.size.width > 0) {
                             // 等比例缩放
                             height = (self.vv_width / image.size.width) * image.size.height;
                         }
                         self.bgImageView.vv_height = height;
                         self.clipsToBounds = YES;
                     }
                     }];
*/
    
/*    3.diskImageDataExistsWithKey失效
        UIImage *image = [[SDImageCache sharedImageCache] imageFromCacheForKey:cacheKey];
*/
    
/*    4.缓存getSize失效
        NSString *cache = [NSString stringWithFormat:@"%.2fM",[[SDImageCache sharedImageCache] totalDiskSize] / 1024.0 / 1024.0];

*/

    
}

@end
