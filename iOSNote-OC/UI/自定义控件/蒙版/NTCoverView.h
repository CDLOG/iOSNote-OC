//
//  NTCoverView.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CancelBlock)(void);

@interface NTCoverView : UIView

@property (strong,nonatomic) CancelBlock cancelBlock;
@end

NS_ASSUME_NONNULL_END
