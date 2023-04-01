//
//  NTAPPIconVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/26.
//


/*
 启动图标:在Assets中导入启动图标
 启动页面:1,如果在general中指定了启动页面(LaunchScreen),那么就按这个页面启动(高优先级),只要让美工提供一个可拉伸图片会自适应屏幕大小,拓展性和交互性会更好
        2,如果没有指定启动页面,那么会根据Assets中的LaunchImage来启动,且屏幕大小按照LaunchImage决定(UI需要提供更多适配的启动图),适配性会更好

 
 
 */



#import "NTAPPIconVC.h"

@interface NTAPPIconVC ()

@end

@implementation NTAPPIconVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
