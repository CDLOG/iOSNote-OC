//
//  NTChangeSkinVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/25.
//

//注意:切换颜色后需要通知其他需要改变皮肤的控制器
//或者写一个父类,viewWillAppear方法中,及时检测当前的皮肤颜色


#import "NTChangeSkinVC.h"
#import "SkinTool.h"
@interface NTChangeSkinVC ()
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@end

@implementation NTChangeSkinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeImages];
}

- (IBAction)changeToBlueSkin {
    [SkinTool setSKinColor:@"blue"];
    
    [self changeImages];
}

- (IBAction)changeToGreenSkin {
    [SkinTool setSKinColor:@"green"];
    
    [self changeImages];
}

- (void)changeImages
{
    [self.jumpBtn setTitleColor:[SkinTool skinToolWithLabelColor] forState:UIControlStateNormal];
    self.faceImageView.image = [SkinTool skinToolWithImageName:@"face"];
    self.heartImageView.image = [SkinTool skinToolWithImageName:@"heart"];
    self.rectImageView.image = [SkinTool skinToolWithImageName:@"rect"];
}

@end
