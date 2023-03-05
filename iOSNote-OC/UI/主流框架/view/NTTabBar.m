//
//  NTTabBar.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/5.
//

#import "NTTabBar.h"
#import "NTTabBarButton.h"

@interface NTTabBar()

/** 记录选中的按钮 */
@property (nonatomic, weak) UIButton *selButton;

@end

@implementation NTTabBar

- (void)setItems:(NSArray *)items{
    _items = items;
    for (int i = 0; i < self.items.count; i++) {
        // 添加子控件
        UIButton *button = [[NTTabBarButton alloc] init];
        [self addSubview:button];
        UITabBarItem *tabBarItem = self.items[i];
        
        [button setBackgroundImage:tabBarItem.image forState:UIControlStateNormal];
        [button setBackgroundImage:tabBarItem.selectedImage  forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchDown];
        
    }
}
// 当按钮点击的时候调用
- (void)buttonOnClick:(UIButton *)button{
    
    // 1.取消上次选中
    self.selButton.selected = NO;
    
    // 2.选中当前点击的按钮
    button.selected = YES;
    
    // 3.记录当前选中的按钮
    self.selButton = button;
    
    // 4.通知外界切换子控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:index:)]) {
        [self.delegate tabBar:self index:button.tag];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    // 调整子控件的frame
    
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = 49;
    
    int i = 0;
    for (UIButton *button in self.subviews) {
        
        button.tag = i;
        
        buttonX = buttonW * i;
        if (i == 0) {
            [self buttonOnClick:button];
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        i++;
        
    }
}
@end
