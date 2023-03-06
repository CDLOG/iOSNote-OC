//
//  NTBlockVC.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/6.
//能够直接访问上下文

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^MyBlock)(NSString *data);
//block传递的数据在参数中
typedef void(^MyBlock2)(NSString *data);

@interface NTBlockVC : UIViewController
//block作为属性,主动调用外界的代码
@property (nonatomic, strong) MyBlock myBlock;
//block作为函数参数,外界传递函数调用完成后需要执行的代码
-(void)clickWithBlock:(MyBlock2)myblockAcion;

@end

NS_ASSUME_NONNULL_END
