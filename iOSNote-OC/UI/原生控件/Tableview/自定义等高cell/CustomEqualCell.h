//
//  CustomEqualCell.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/7.
//
/*
 核心:
 1,cell的复用
 2,cell数据的加载
 */

#import <UIKit/UIKit.h>
#import "XMGDeal.h"
NS_ASSUME_NONNULL_BEGIN

@interface CustomEqualCell : UITableViewCell
/** 团购模型数据 */
@property (nonatomic, strong) XMGDeal *deal;

/// cell的复用,避免在tableView的注册cell
/// - Parameter tableView: tableView
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
