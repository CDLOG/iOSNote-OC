//
//  NTProximitySensorVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/25.
//


/*
 距离传感器是一种可以检测物体与设备之间距离的传感器。在iOS设备中，距离传感器通常位于设备的顶部，贴近听筒附近。
注意，当距离感应启用时，设备的屏幕会变暗，并且不再响应触摸事件。这是因为距离传感器会检测物体是否靠近设备，并相应地调整设备的行为。
 听筒打电话屏幕熄灭就是这个.
 */

#import "NTProximitySensorVC.h"
#import <AVFoundation/AVFoundation.h>
@interface NTProximitySensorVC ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation NTProximitySensorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)openAction:(id)sender {
    // 创建音频播放器
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CarelessWhisper" ofType:@"mp3"]];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.player.delegate = self;
    
    // 开启距离感应
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    
    // 添加观察者，监听距离感应状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorStateChange:) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

- (void)sensorStateChange:(NSNotificationCenter *)notification {
    if ([[UIDevice currentDevice] proximityState]) {
        // 如果物体靠近设备，则播放音乐
        [self.player play];
    } else {
        // 如果物体离开设备，则停止播放音乐
        [self.player stop];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //关闭距离感应
    self.player = nil;
    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
}
@end
