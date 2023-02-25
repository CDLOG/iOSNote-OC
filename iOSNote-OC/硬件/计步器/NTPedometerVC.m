//
//  NTPedometerVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/25.
//

//注意，为了获取步数数据，我们需要指定一个起始日期作为参数。在这个示例中，我们使用当前日期作为起始日期，以获取从当前时间开始的步数数据。

#import "NTPedometerVC.h"
#import <CoreMotion/CoreMotion.h>

@interface NTPedometerVC ()
@property (nonatomic, strong) CMPedometer *pedometer;
@property (weak, nonatomic) IBOutlet UILabel *stepLable;

@end

@implementation NTPedometerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)openACtion:(id)sender {

    // 检查计步器是否可用
    if ([CMPedometer isStepCountingAvailable]) {
        // 获取步数数据
        [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                // 获取步数
                NSNumber *numberOfSteps = pedometerData.numberOfSteps;
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 在主线程上执行UI更新操作
                    self.stepLable.text = [NSString stringWithFormat:@"已经走了%@步",numberOfSteps];
                });
                
            }
        }];
    } else {
        NSLog(@"Step counting is not available.");
    }
}
-(CMPedometer *)pedometer{
    if (_pedometer == nil) {
        _pedometer = [[CMPedometer alloc] init];
    }
    return _pedometer;
}
@end
