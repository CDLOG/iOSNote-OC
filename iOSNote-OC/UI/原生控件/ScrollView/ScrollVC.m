//
//  ScrollVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/1.
//

#import "ScrollVC.h"
#import "XMGPageView.h"
@interface ScrollVC ()<UIScrollViewDelegate>
/** 分页控件 */
@property (nonatomic, strong) XMGPageView *pageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_bg"]];
    self.imageView = imageView;
    [self.scrollView addSubview:imageView];
    
    //常用属性
    //偏移量
    self.scrollView.contentOffset = CGPointMake(0,0);
    // 这个属性用来表示UIScrollView内容的尺寸，滚动范围（能滚多远）
    self.scrollView.contentSize = imageView.image.size;
    //这个属性能够在UIScrollView的4周增加额外的滚动区域，一般用来避免scrollView的内容被其他控件挡住
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    //是否需要弹簧效果
    self.scrollView.bounces = false;
    //是否能滚动
    self.scrollView.scrollEnabled = YES;
    //是否显示水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = YES;
    //是否显示垂直滚动条
    self.scrollView.showsVerticalScrollIndicator = YES;
    //设置代理
    self.scrollView.delegate = self;
    // 设置缩放比例
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.2;
    
    [self pageSet];
}


/// 定时轮播图
-(void)pageSet{
    XMGPageView *pageView = [XMGPageView pageView];
    pageView.frame = CGRectMake(70, 350, 300, 80);
    pageView.imageNames = @[@"img_00", @"img_01", @"img_02", @"img_03", @"img_04"];
    pageView.otherColor = [UIColor grayColor];
    pageView.currentColor = [UIColor orangeColor];
    [self.view addSubview:pageView];
    self.pageView = pageView;
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

#pragma mark - <UIScrollViewDelegate>,UIScrollView代理
/**
 * 滚动中
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll------%f,%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

/**
 * 即将开始拖拽的时候调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging------");
}

/**
 * 结束拖拽的时候调用,二选一
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging------");
}

/**
 * (减速完毕)由于惯性停止滚动的时候调用,二选一
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating------");
}

/**
 这个方法的返回值决定了要缩放的内容(返回值只能是UIScrollView的子控件)
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"缩放ing-----%f", scrollView.zoomScale);
}
@end
