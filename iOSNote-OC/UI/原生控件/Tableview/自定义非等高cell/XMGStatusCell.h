//
//  XMGStatusCell.h
//  07-自定义非等高cell-xib
//
//  Created by xiaomage on 15/6/2.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

/*
 核心:
 1,模型数据增加cell高度属性,来保存布局后cell的真实高度
 2,cell加载完成数据后强制布局,设置label每一行文字的最大宽度,更新cell高度属性
 3,tableview中使用预估高度方法,再调用高度方法加载对应模型获取高度来更新cell高度
 
 */

#import <UIKit/UIKit.h>
@class XMGStatus;

@interface XMGStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;


/** 微博模型数据 */
@property (nonatomic, strong) XMGStatus *status;
@end
