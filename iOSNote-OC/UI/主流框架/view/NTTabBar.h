//
//  NTTabBar.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/5.
// 自定义TabBaritem

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NTTabBar;

@protocol NTTabBarDelegate <NSObject>
//传递本身,传递参数
- (void)tabBar:(NTTabBar *)tabBar index:(NSInteger)index;

@end

@interface NTTabBar : UIView

/** 模型数组 */
@property (nonatomic, strong) NSArray *items;


@property (nonatomic, weak) id<NTTabBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
