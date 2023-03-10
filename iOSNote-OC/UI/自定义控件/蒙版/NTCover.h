//
//  NTCover.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/10.
//


/*
默认蒙版覆盖整个屏幕，addBaseView是蒙版上的弹窗
 //创建蒙版
 NTCover *view = [[NTCover alloc]init];
 view.canTouchHide = YES;
 //获取弹窗控件
 NTCoverView * addBaseView = [[NSBundle mainBundle]loadNibNamed:@"NTCoverView" owner:nil options:nil].firstObject;
 addBaseView.frame = CGRectMake(0, 0, sc_width, 200);
 //弹窗居中
 addBaseView.center = view.center;
 [view.baseView addSubview: addBaseView];
 [view showAnimation];
 
 addBaseView.cancelBlock = ^{
     [view hideAnimation];
 };
 addBaseView控件使用block来实现关闭弹窗等回调
*/


#import <UIKit/UIKit.h>
//关闭弹窗回调
typedef void(^DisBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface NTCover : UIView<UIGestureRecognizerDelegate>

/// 蒙版本身的view,用于加载弹窗
@property (strong,nonatomic) UIView * baseView;
/// 弹窗控件高度,默认为200
@property (assign,nonatomic) float  baseHeight;
/// 关闭弹窗回调
@property (strong,nonatomic) DisBlock disBlock;

/// 是否可以点击蒙版隐藏
@property (assign,nonatomic) BOOL canTouchHide;

/// 显示蒙版(带动画)
-(void)showAnimation;
/// 隐藏蒙版(带动画)
-(void)hideAnimation;

/// 显示蒙版(不带动画)
-(void)show;
/// 隐藏蒙版(不带动画)
-(void)hide;



@end


NS_ASSUME_NONNULL_END
