//
//  XMGDealsViewController.m
//  06-自定义等高cell01-storyboard
//
//  Created by xiaomage on 15/6/2.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGDealsViewController.h"
#import "XMGDeal.h"
#import "XMGDealCell.h"
@interface XMGDealsViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 所有的团购数据 */
@property (nonatomic, strong) NSMutableArray *deals;
@end

@implementation XMGDealsViewController

- (NSMutableArray *)deals
{
    if (_deals == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *dealArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            XMGDeal *deal = [XMGDeal dealWithDict:dict];
            [dealArray addObject:deal];
        }
        
        _deals = dealArray;
    }
    return _deals;
}


- (void)viewDidLoad {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
}

- (IBAction)switchEditing {
    // 进入编辑模式
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}


- (IBAction)add {
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"111" message:@"2222" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
//
//    [alertView show];
//    UIActionSheet *sheet;
    
    // 创建弹框控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入团购信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    // 添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // 创建模型
        XMGDeal *deal = [[XMGDeal alloc] init];
        deal.title = [alert.textFields[0] text];
        deal.price = [alert.textFields[1] text];
        [self.deals insertObject:deal atIndex:0];
        
        // 刷新数据
        [self.tableView reloadData];
    }]];
    // 添加文本输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入团购名字";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入团购价格";
    }];
    
    // 显示控制器
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)remove {
    // 移除模型数据
    [self.deals removeObjectAtIndex:0];
    [self.deals removeObjectAtIndex:0];
    [self.deals removeObjectAtIndex:0];
    
    
    // 局部刷新
    NSArray *indexPaths = @[
                            [NSIndexPath indexPathForRow:0 inSection:0],
                            [NSIndexPath indexPathForRow:1 inSection:0]
                            ];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    
    // 刷新表格
    [self.tableView reloadData];
}

- (IBAction)update {
    // 修改模型
    XMGDeal *deal = self.deals[3];
    deal.price = [NSString stringWithFormat:@"%d", 50 + arc4random_uniform(100)];;
    
    // 刷新表格
    [self.tableView reloadData];
}

#pragma mark - <UIAlertViewDelegate>
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    NSLog(@"---%zd", buttonIndex);
//}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deals.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    // 创建cell
    XMGDealCell *cell = [XMGDealCell cellWithTableView:tableView];
    
    // 取出模型数据
    cell.deal = self.deals[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.title = @"界面";
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:NO];
}
#pragma mark - TableView代理方法
/**
 * 只要实现这个方法，左划cell出现删除按钮的功能就有了
 * 用户提交了添加（点击了添加按钮）\删除（点击了删除按钮）操作时会调用
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {  // 点击了“删除”
        // 删除模型
        [self.deals removeObjectAtIndex:indexPath.row];
        
        // 刷新表格
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) { // 点击了+
        NSLog(@"+++++ %zd", indexPath.row);
    }
}

/**
 * 这个方法决定了编辑模式时，每一行的编辑类型：insert（+按钮）、delete（-按钮）
 */
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return indexPath.row % 2 == 0? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
//}
@end
