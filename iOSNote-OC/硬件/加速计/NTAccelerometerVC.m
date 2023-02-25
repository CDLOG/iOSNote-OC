//
//  NTAccelerometerVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/25.
//


/*
 在iOS设备中，加速计通常位于设备底部。
 加速计是一种感应器，可以测量设备的加速度、速度和方向等数据。
 可以用作计步器,摇一摇等应用
 */

#import "NTAccelerometerVC.h"
#import <CoreMotion/CoreMotion.h>
@interface NTAccelerometerVC ()
@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation NTAccelerometerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)openAction:(id)sender {
    // 创建CMMotionManager对象
    self.motionManager = [[CMMotionManager alloc] init];
    // 设置采样间隔
    self.motionManager.magnetometerUpdateInterval = 3;
    // 开始获取加速计数据
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            // 获取x、y、z方向的加速度
            double x = accelerometerData.acceleration.x;
            double y = accelerometerData.acceleration.y;
            double z = accelerometerData.acceleration.z;
            
            NSLog(@"Acceleration - X: %f, Y: %f, Z: %f", x, y, z);
        }
    }];
}

@end
