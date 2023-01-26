//
//  NTGestureVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/26.
//

#import "NTGestureVC.h"

@interface NTGestureVC ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation NTGestureVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\

    [self setUpPinch];
    
    [self setUpRotation];

    [self setUpPan];
    
}
#pragma mark - 手势代理方法
// 是否允许开始触发手势
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    return NO;
//}

// 是否允许同时支持多个手势，默认是不支持多个手势
// 返回yes表示支持多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 是否允许接收手指的触摸点
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    // 获取当前的触摸点
//    CGPoint curP = [touch locationInView:self.imageView];
//
//    if (curP.x < self.imageView.bounds.size.width * 0.5) {
//        return NO;
//    }else{
//        return YES;
//    }
//}


#pragma mark - 点按手势

- (void)setUpTap
{
    // 创建点按手势和对应触发事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    tap.delegate = self;
    //控件添加手势
    [_imageView addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    // 获取手势的触摸点
    CGPoint curP = [tap locationInView:self.imageView];
    NSLog(@"%s",__func__);
}

#pragma mark - 长按手势
// 默认会触发两次
- (void)setUpLongPress
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [self.imageView addGestureRecognizer:longPress];
}


- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"%s",__func__);
    }
}

#pragma mark - 清扫
- (void)setUpSwipe
{
    // 默认轻扫的方向是往右
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.imageView addGestureRecognizer:swipe];
    
    // 如果以后想要一个控件支持多个方向的轻扫，必须创建多个轻扫手势，一个轻扫手势只支持一个方向
    // 默认轻扫的方向是往右
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe)];
    
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.imageView addGestureRecognizer:swipeDown];

    
}

- (void)swipe
{
    NSLog(@"%s",__func__);
}

#pragma mark - 旋转手势
- (void)setUpRotation
{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [self.imageView addGestureRecognizer:rotation];
}

// 默认传递的旋转的角度都是相对于最开始的位置
- (void)rotation:(UIRotationGestureRecognizer *)rotation
{
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
    
    // 复位,相对于上一次的位置
    rotation.rotation = 0;
    
    // 获取手势旋转的角度
    NSLog(@"--%f",rotation.rotation);
}

#pragma mark - 捏合
- (void)setUpPinch
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale, pinch.scale);
    
    // 复位
    
    pinch.scale = 1;
}

#pragma mark - uiview拖拽
- (void)setUpPan
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    
    [self.imageView addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取手势的触摸点
    CGPoint curP = [pan locationInView:self.imageView];
    
    // 移动视图
    // 获取手势的移动，也是相对于最开始的位置
    CGPoint transP = [pan translationInView:self.imageView];
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transP.x, transP.y);
    
    // 复位
    [pan setTranslation:CGPointZero inView:self.imageView];
    
  //  NSLog(@"%@",NSStringFromCGPoint(curP));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
