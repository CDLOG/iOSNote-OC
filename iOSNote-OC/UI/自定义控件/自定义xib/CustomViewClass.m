//
//  CustomView.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/1.
//

#import "CustomViewClass.h"

@implementation CustomViewClass

+(instancetype)customViewCreat{
    return  [[[NSBundle mainBundle]loadNibNamed:@"CustomViewClass" owner:nil options:nil]lastObject];
}


/**
 *  自定义控件布局子控件需要调用方法
 * 这个方法专门用来布局子控件，一般在这里设置子控件的frame
 * 当控件本身的尺寸发生改变的时候，系统会自动调用这个方法
 *
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //根据控件数据自适应布局(常在控件设置数据后调用)
    [self sizeToFit];
    
}

@end
