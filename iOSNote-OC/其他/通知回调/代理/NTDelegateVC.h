//
//  NTDelegateVC.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/6.
//
/*
 通知，代理，block都用于系统回调
 通知用于一对多的关系，即一个发送与多个接收
 代理，block都是一对一，但是block的阅读性和效率更高
 DelegateBlock相比，是一个重量级的回调。方法的声明和实现分离开来，代码的连贯性不是很好，但是可以同时传递多组函数，方便在不同时候调用。
 */


//接收方1,遵守代理,2,成为代理,3,实现代理方法成功回调

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NTDelegateVC;

@protocol NTDelegateVCDelegate <NSObject>
//传递本身,传递参数
- (void)delegateClick:(NTDelegateVC *)delegateVC andText:(NSString *)text;

@end

@interface NTDelegateVC : UIViewController
@property (nonatomic, weak) id<NTDelegateVCDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
