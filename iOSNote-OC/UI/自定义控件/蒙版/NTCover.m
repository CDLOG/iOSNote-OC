//
//  NTCover.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/10.
//

#import "NTCover.h"

@implementation NTCover

-(instancetype)initWithFrame:(CGRect)frame
{
    self =  [super initWithFrame:frame];
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _baseHeight = screenHeight;
    [self addSubview:self.baseView];
    return self;
}
-(float)baseHeight{
    if (_baseHeight==0) {
        return 200;
    }
    return _baseHeight;
}
-(UIView *)baseView
{
    if(_baseView)
        return _baseView;
    _baseView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.baseHeight)];
    
    return _baseView;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(_canTouchHide){
        [self hideAnimation];
    }
    
}

-(void)showAnimation
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 1;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
        self.baseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - self.baseHeight, [UIScreen mainScreen].bounds.size.width , self.baseHeight);
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)hideAnimation{
    if (self.disBlock) {
        self.disBlock();
    }
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.alpha = 0;
        self.baseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, self.baseHeight);
        
    } completion:^(BOOL finished) {
                [self removeFromSuperview];
    }];
}
-(void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.alpha = 1;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
    self.baseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - self.baseHeight, [UIScreen mainScreen].bounds.size.width , self.baseHeight);
}
-(void)hide{
    if (self.disBlock) {
        self.disBlock();
    }
    self.alpha = 0;
    self.baseView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, self.baseHeight);
    [self removeFromSuperview];
}
@end
