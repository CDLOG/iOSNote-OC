//
//  PlistLoadVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/1.
//

#import "PlistLoadVC.h"
@interface PlistLoadVC ()
/** 全部商品数据 */
@property (strong, nonatomic) NSArray *shops;
@end

@implementation PlistLoadVC

// 加载plist数据（比较大）
// 懒加载：用到时再去加载，而且也只加载一次
- (NSArray *)shops
{
    if (_shops == nil) {
        NSString *file = [[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"];
        self.shops = [NSArray arrayWithContentsOfFile:file];
//        _shops = [NSArray arrayWithContentsOfFile:file];
//        [self setShops:[NSArray arrayWithContentsOfFile:file]];
    }
    return _shops;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *loadBtn = [UIView addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 100, 30) Title:@"加载plist"];
    [loadBtn addTarget:self action:@selector(loadPlist) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadPlist{
    
    NSLog(@"加载plist\n %@",self.shops);
}

@end
