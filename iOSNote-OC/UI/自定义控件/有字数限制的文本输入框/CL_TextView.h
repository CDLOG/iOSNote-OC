//
//  CL_TextView.h
//  CL_TextView
//
//  Created by 陈乐杰 on 2018/11/21.
//  Copyright © 2018 nst. All rights reserved.
//


/*
 使用示例:
 feedView 是要父控件
    [self.feedView setBackgroundColor:[UIColor clearColor]];
    self.C_textView = [[CL_TextView alloc]initWithFrame:self.feedView.bounds letfEdge:5 topEdgw:10 hintText:@"提示文案" maxLength:100];
    [self.C_textView setBackgroundColor:[UIColor orangeColor]];
    [self.C_textView.textView setFont:[UIFont systemFontOfSize:14]];
    [self.C_textView.hintLable setFont:[UIFont systemFontOfSize:14]];
    self.C_textView.hintLable.textColor =[UIColor grayColor];
    [self.C_textView.textLenthLable setFont:[UIFont systemFontOfSize:14]];
    self.C_textView.textLenthLable.textColor = [UIColor redColor];
    self.C_textView.radius = 4;
    [self.feedView addSubview:self.C_textView];
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CL_TextView : UIView
@property (assign,nonatomic) CGFloat textView_leftEdge;
@property (assign,nonatomic) CGFloat textView_topEdge;
@property (strong,nonatomic) UITextView *textView;
@property (strong, nonatomic)  UILabel *hintLable;
@property (assign,nonatomic) NSInteger maxLength;
@property (strong, nonatomic)  UILabel *textLenthLable;
@property (assign,nonatomic) CGFloat radius;
//初始化需要，大小，左边距，上边距，提示文字，最大文字
-(instancetype)initWithFrame:(CGRect)frame
                    letfEdge:(CGFloat)leftedge
                     topEdgw:(CGFloat)topedge
                    hintText:(NSString*)hinttext
                   maxLength:(NSInteger)maxlength;

@end

NS_ASSUME_NONNULL_END
