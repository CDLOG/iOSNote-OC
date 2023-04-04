//
//  NTtextVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NTtextVC.h"

@interface NTtextVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation NTtextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTextField.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - 6位数验证码输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//验证码的位数
    NSInteger count = 6;
//    得到输入的字符串
    NSString *aStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self.myTextField) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            //没有有输入,改变按钮颜色等
            return YES;
        }else if (aStr.length<=count){
            //有输入,没输入完成,改变按钮颜色等
            return YES;
        }else if (aStr.length>count){
            //超过限制个数
            
            return NO;
        }
    }
    return [self validateNumber:string];
}
- (BOOL)validateNumber:(NSString*)number {
    
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

@end
