//
//  NTTabBarVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/3/5.
//

#import "NTTabBarVC.h"
#import "NTNavigationVC.h"
#import "NTTabBar.h"
#import "XMGDealsViewController.h"
@interface NTTabBarVC ()<NTTabBarDelegate>
/** taBBar item 模型数组 */
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation NTTabBarVC

- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加子控制器
    [self setupAllChildViewController];
    
//    self.selectedIndex = 1;
    
    // 2.自定义tabBar
    [self setupTabBar];
    
}
// 自定义tabBar
- (void)setupTabBar{
    /*
     // 1.移除(简单粗暴)
     1.tabBar UIView
     2.UIButton
     3.切换自控制 selectedIndex
     */
    // 1.移除系统的tabBar
    [self.tabBar removeFromSuperview];
//
//    // 2.添加自己的tabBar
    NTTabBar *tabBar = [[NTTabBar alloc] init];
    tabBar.items = self.items;

    [self.view addSubview:tabBar];
    tabBar.frame = CGRectMake(0, sc_height - TabbarH - TabbarSafeBottomMargin, sc_width, TabbarH + TabbarSafeBottomMargin);
    
    tabBar.backgroundColor = [UIColor redColor];
    tabBar.delegate = self;
    
    
}

#pragma mark - XMGTabBarDelegate
- (void)tabBar:(NTTabBar *)tabBar index:(NSInteger)index{
//    NSLog(@"%ld",index);
    // 切换子控制器
    self.selectedIndex = index;
    
}
// 添加所有的子控制器
- (void)setupAllChildViewController{
    
     // 怎么解
    // 1.找UI妹子 调整图片, 项目负责, PM
    // 2.自定义
   
    /*
     // 1.移除(简单粗暴)
     1.tabBar UIView
     2.UIButton
     3.切换自控制 selectedIndex
    */
    // 2.移除tabBar子控件
    
    
    // tabBarItem 模型 , 对应子控制器的tabBarItem 决定
    // 1.购彩大厅
    XMGDealsViewController *hall = [[XMGDealsViewController alloc] init];
    
    hall.view.backgroundColor = [UIColor yellowColor];
    [self setupOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_Hall_new"] selImage:[UIImage imageNamed:@"TabBar_Hall_selected_new"] title:@"购彩大厅"];
    
//    [self.items addObject:hall.tabBarItem];
    
    // 2.竞技场
    UIViewController *arena = [[UIViewController alloc] init];
    arena.view.backgroundColor =[UIColor greenColor];
    
    [self setupOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    // 3.发现
    UIViewController *discover = [[UIViewController alloc] init];
    discover.view.backgroundColor  = [UIColor orangeColor];
    
    [self setupOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 4.开奖信息
    UIViewController *history = [[UIViewController alloc] init];
    history.view.backgroundColor = [UIColor blueColor];
    
    [self setupOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 5.我的彩票
    UIViewController *myLottery = [[UIViewController alloc] init];
    myLottery.view.backgroundColor = [UIColor purpleColor];
    
    [self setupOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}


/// 设置导航控制器的子控制器
/// - Parameters:
///   - vc: 导航控制器的rootvc
///   - image:tabBarItem.image
///   - selImage: tabBarItem.selectedImage
///   - title: navigationItem.title
- (void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title{
    
    // 包装成导航控制器
    // 1.创建导航控制器
    UINavigationController *nav = [[NTNavigationVC alloc] initWithRootViewController:vc];
    
    //单独设置某一个控制器的导航控制器
    if ([vc isKindOfClass:[UIViewController class]]) {
        //竞技场
        nav = [[UINavigationController alloc] initWithRootViewController:vc];
    }
    
    [self addChildViewController:nav];
    
    // 导航控制器上的内容有栈顶控制器navigationItem
    vc.navigationItem.title = title;

    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
//    vc.tabBarItem.title =
    [self.items addObject:vc.tabBarItem];
}
@end
