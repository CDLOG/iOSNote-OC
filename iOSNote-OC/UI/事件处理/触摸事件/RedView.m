//
//  RedView.m
//  03-UIView的拖拽
//
//  Created by xiaomage on 15/6/16.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

/*
 
 当用户用一根手指触摸屏幕时，会创建一个与手指相关联的UITouch对象
 根据touches中UITouch的个数可以判断出是单点触摸还是多点触摸
 
 UITouch的属性
 触摸产生时所处的窗口
 @property(nonatomic,readonly,retain) UIWindow    *window;

 触摸产生时所处的视图
 @property(nonatomic,readonly,retain) UIView      *view;

 短时间内点按屏幕的次数，可以根据tapCount判断单击、双击或更多的点击
 @property(nonatomic,readonly) NSUInteger          tapCount;

 记录了触摸事件产生或变化时的时间，单位是秒
 @property(nonatomic,readonly) NSTimeInterval      timestamp;

 当前触摸事件所处的状态
 @property(nonatomic,readonly) UITouchPhase        phase;

 UITouch的方法
 - (CGPoint)locationInView:(UIView *)view;
 返回值表示触摸在view上的位置
 这里返回的位置是针对view的坐标系的（以view的左上角为原点(0, 0)）
 调用时传入的view参数为nil的话，返回的是触摸点在UIWindow的位置

 - (CGPoint)previousLocationInView:(UIView *)view;
 该方法记录了前一个触摸点的位置

 */

/*
 
 每产生一个事件，就会产生一个UIEvent对象
 称为事件对象，记录事件产生的时刻和类型

 
 */

//uiview的拖拽

#import "RedView.h"

@implementation RedView


// 当手指开始触摸view
// NSArray,字典，NSSet(无序)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%ld", touches.count);
    NSLog(@"%s",__func__);
}

// 当手指在view上移动的时候
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    
    // 获取UITouch对象
    UITouch *touch = [touches anyObject];
    
    // 获取当前点
    CGPoint curP = [touch locationInView:self];
    
    // 获取上一个点
    CGPoint preP = [touch previousLocationInView:self];
    
    // 获取x轴偏移量
    CGFloat offsetX = curP.x - preP.x;
    
    // 获取y轴偏移量
    CGFloat offsetY = curP.y - preP.y;
    
    // 修改view的位置（frame,center,transform）
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
   
//    self.transform = CGAffineTransformMakeTranslation(offsetX, 0);
    
}

// 当手指离开这个view的时候
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
     NSLog(@"%s",__func__);
}

// 当触摸事件被打断的时候调用(电话打入)
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


@end
