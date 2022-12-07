//
//  CustomEqualCell.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/7.
//

#import "CustomEqualCell.h"
#import "XMGDeal.h"

@interface CustomEqualCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation CustomEqualCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"CustomEqualCell_ID";
    CustomEqualCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([CustomEqualCell class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setDeal:(XMGDeal *)deal
{
    _deal = deal;
    
    // 设置数据
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titleLabel.text = deal.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", deal.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", deal.buyCount];
}

@end
