//
//  ScrollVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/1.
//

#import "ScrollVC.h"

@interface ScrollVC ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_bg"]];
    [self.scrollView addSubview:imageView];
    
    // 设置内容大小
    self.scrollView.contentSize = imageView.image.size;
}

- (IBAction)left:(id)sender {
    // self.scrollView.contentOffset ： 偏移量
    // 记录UIScrollView滚动的位置，滚到哪
    // 总结：内容的左上角 和 scrollView自身左上角 的 X\Y差值

    [UIView animateWithDuration:2.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        NSLog(@"执行完毕");
    }];
}

- (IBAction)top:(id)sender {

    CGPoint offset = CGPointMake(self.scrollView.contentOffset.x, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (IBAction)bottom:(id)sender {
    [UIView animateWithDuration:2.0 animations:^{
        CGFloat offsetY = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, offsetY);;
    }];
    
}

- (IBAction)right:(id)sender {
    
    [UIView animateWithDuration:2.0 animations:^{
        CGFloat offsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
    }];
}
@end
