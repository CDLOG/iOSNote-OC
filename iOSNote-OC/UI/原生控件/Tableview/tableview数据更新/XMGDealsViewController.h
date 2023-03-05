//
//  XMGDealsViewController.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/18.
//



//表格的刷新实质是先更新数据,再去刷新表格
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMGDealsViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom_tableview;
@end

NS_ASSUME_NONNULL_END
