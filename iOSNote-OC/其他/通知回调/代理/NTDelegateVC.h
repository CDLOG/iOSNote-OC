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
