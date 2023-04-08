//
//  CL_TextView.m
//  CL_TextView
//
//  Created by 陈乐杰 on 2018/11/21.
//  Copyright © 2018 nst. All rights reserved.
//

#import "CL_TextView.h"
#import <Masonry.h>
@interface CL_TextView()<UITextViewDelegate>

@end

@implementation CL_TextView


-(instancetype)initWithFrame:(CGRect)frame
                    letfEdge:(CGFloat)leftedge
                     topEdgw:(CGFloat)topedge
                    hintText:(NSString*)hinttext
                   maxLength:(NSInteger)maxlength
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textLenthLable = [[UILabel alloc]init];
        self.hintLable = [[UILabel alloc]init];
        
        self.textView_leftEdge = leftedge;
        self.textView_topEdge = topedge;
        self.hintLable.text = hinttext;
        self.maxLength = maxlength;
        self.textView = [[UITextView alloc]initWithFrame:CGRectMake(self.bounds.origin.x+self.textView_leftEdge, self.bounds.origin.y+self.textView_topEdge, self.bounds.size.width-self.textView_leftEdge*2, self.bounds.size.height-34)];
        [self.textView setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    
    [self addSubview:self.textView];
    [self.textView.layer setMasksToBounds:YES];
    [self.textView.layer setCornerRadius:5.0];
    self.textView.delegate = self;
    
    
    
    [self addSubview:self.hintLable];
    [self.hintLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textView).mas_offset(5);
        make.left.mas_equalTo(self.textView).mas_offset(5);
        make.width.mas_equalTo(self.textView.bounds.size.width-10);
    }];
//    self.hintLable.text = @"这是提示文案，这是提示文案，这是提示文案，这是提示文案，这是提示文案，这是提示文案，这是提示文案，";
    self.hintLable.numberOfLines = 100;
    self.hintLable.font = [UIFont systemFontOfSize:15];
    self.hintLable.textAlignment = NSTextAlignmentLeft;
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:_radius];
    
    
    [self addSubview:self.textLenthLable];
    self.textLenthLable.text = [NSString stringWithFormat:@"0/%ld",(long)self.maxLength];
    [self.textLenthLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).mas_offset(-5);
        make.right.mas_equalTo(self).mas_offset(-15);
        make.width.mas_equalTo(200);
    }];
    self.textLenthLable.font = [UIFont systemFontOfSize:14];
    self.textLenthLable.textAlignment = NSTextAlignmentRight;
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    NSInteger tlength = text.length;
    if (range.location+tlength >self.maxLength) {
        return NO;
    }
    NSString * str = [self.textView.text stringByReplacingCharactersInRange:range withString:text];
    if(str.length>0){
        self.hintLable.hidden = YES;
    }else{
        self.hintLable.hidden = NO;
    }
    
    if ( textView== self.textView) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && text.length == 0) {
            NSString * length = [NSString stringWithFormat:@"%ld/%ld",str.length,self.maxLength];
            self.textLenthLable.text = length;
            return YES;
        }
        //so easy
        else if (self.textView.text.length >= self.maxLength) {
            self.textView.text = [textView.text substringToIndex:self.maxLength];
            NSString * length = [NSString stringWithFormat:@"%ld/%ld",self.maxLength,self.maxLength];
            self.textLenthLable.text = length;
            return NO;
        }
    }
    NSString * length = [NSString stringWithFormat:@"%ld/%ld",str.length,self.maxLength];
    self.textLenthLable.text = length;
    return YES;
}
@end
