//
//  NTQRCodeCreateVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import "NTQRCodeCreateVC.h"
#import "UIImage+NTQRCode.h"
@interface NTQRCodeCreateVC ()
@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageView;
@property (weak, nonatomic) IBOutlet UITextField *contentFeild;

@end

@implementation NTQRCodeCreateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)creatQRCodeAction:(id)sender {
  self.QRCodeImageView.image =  [UIImage creatQRCode:self.contentFeild.text andSize:200];
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
