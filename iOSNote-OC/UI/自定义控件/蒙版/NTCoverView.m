//
//  NTCoverView.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/10.
//

#define NTKeyWindow [UIApplication sharedApplication].keyWindow
#import "NTCoverView.h"
#import "NTCover.h"

@interface NTCoverView ()
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end


@implementation NTCoverView

//点击关闭按钮
- (IBAction)closeAction:(id)sender {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}



@end
