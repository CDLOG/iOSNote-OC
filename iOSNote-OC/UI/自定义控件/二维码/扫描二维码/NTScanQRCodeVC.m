//
//  NTScanQRCodeVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import "NTScanQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
@interface NTScanQRCodeVC ()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, weak) AVCaptureSession *session;
@property (nonatomic, weak) AVCaptureVideoPreviewLayer *layer;
@property (weak, nonatomic) IBOutlet UILabel *resultLable;

@end

@implementation NTScanQRCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)startScanAction:(id)sender {
    // 1.创建捕捉会话
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    self.session = session;
    
    // 2.添加输入设备(数据从摄像头输入)
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [session addInput:input];
    
    // 3.添加输出数据(示例对象-->类对象-->元类对象-->根元类对象)
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [session addOutput:output];
    
    // 3.1.设置输入元数据的类型(类型是二维码数据)
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    // 4.添加扫描图层
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.frame = self.view.bounds;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
    // 5.开始扫描
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.session startRunning];
    });
    
    
}

#pragma mark - 实现output的回调方法
// 当扫描到数据时就会执行该方法
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        NSLog(@"%@", object.stringValue);
        self.resultLable.text = object.stringValue;
        // 停止扫描
        [self.session stopRunning];
        
        // 将预览图层移除
        [self.layer removeFromSuperlayer];
    } else {
        NSLog(@"没有扫描到数据");
    }
}

@end
