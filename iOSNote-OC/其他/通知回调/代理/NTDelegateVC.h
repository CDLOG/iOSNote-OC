//
//  NTDelegateVC.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/6.
//

//接收方1,遵守代理,2,成为代理,3,实现代理方法成功回调

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NTDelegateVC;

@protocol NTDelegateVCDelegate <NSObject>
//传递本身,传递参数
- (void)NTDelegateClick:(NTDelegateVC *)delegateVC andText:(NSString *)text;

@end

@interface NTDelegateVC : UIViewController
@property (nonatomic, weak) id<NTDelegateVCDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
