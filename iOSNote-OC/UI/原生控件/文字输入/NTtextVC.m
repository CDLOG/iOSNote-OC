//
//  NTtextVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NTtextVC.h"
#import "NSString+Tools.h"
#import "NTSetRootVC.h"
#import "DataTools.h"
@interface NTtextVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UILabel *testLable;

@end

@implementation NTtextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTextField.delegate = self;
    self.pwdText.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - 6位数验证码输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if(textField != self.myTextField){
        return YES;
    }
    
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

#pragma mark - 密码明暗文切换

- (IBAction)changgeAction:(UIButton *)sender {
    
    self.pwdText.enabled = NO;
    self.pwdText.secureTextEntry = sender.selected;
    sender.selected = !sender.selected;
    self.pwdText.enabled = YES;
    [self.pwdText becomeFirstResponder];
    
}

- (IBAction)testAction:(id)sender {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    NSArray *colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(1, 1);
    CAGradientLayer *gradientLayer = [self gradientLayerWithFrame:view.bounds colors:colors startPoint:startPoint endPoint:endPoint];
    [self.view.layer addSublayer:gradientLayer];
}
- (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame colors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    return gradientLayer;
}

#pragma mark - 指定控件文字的行间距
-(void)setLineSpace:(CGFloat)lineSpace withText:(NSString *)text inLabel:(UILabel *)label{
    if (!text || !label) {
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;  //设置行间距
    paragraphStyle.lineBreakMode = label.lineBreakMode;
    paragraphStyle.alignment = label.textAlignment;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    label.attributedText = attributedString;
}
@end
