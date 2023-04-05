//
//  TableViewNoteVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/5.
//

#import "TableViewNoteVC.h"
#import "CustomEqualCell.h"
#import "XMGStatus.h"
#import "XMGStatusCell.h"
@interface TableViewNoteVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 所有的团购数据 */
@property (nonatomic, strong) NSArray *deals;
@property (strong, nonatomic) NSArray *statuses;
@end

@implementation TableViewNoteVC



- (NSArray *)deals
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
- (NSArray *)statuses
{
    if (_statuses == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            XMGStatus *status = [XMGStatus statusWithDict:dict];
            [statusArray addObject:status];
        }
        
        _statuses = statusArray;
    }
    return _statuses;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // 行高
    self.tableView.rowHeight = 70;
    
    [self tableviewSet];
}



/// tableview的常见设置
-(void)tableviewSet{
    // 分割线颜色
    self.tableView.separatorColor = [UIColor redColor];

    // 隐藏分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

/// cell常见设置
-(void)cellSet:(UITableViewCell *)cell{
    // 取消选中的样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 设置选中的背景色
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = selectedBackgroundView;
    
    // 设置默认的背景色 1
    cell.backgroundColor = [UIColor blueColor];
    
    // 设置默认的背景色 2
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor greenColor];
    cell.backgroundView = backgroundView;
    
    // 设置指示器
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    自定义指示器
    //    cell.accessoryView = [[UISwitch alloc] init];
}
#pragma mark- UITableViewDataSource,数据源的加载顺序

/**
 *  告诉tableView一共有多少组数据,默认为1
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
/**
 *  告诉tableView第section组有多少个数据
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.deals.count;
    } else if (section == 1) {
        return self.statuses.count;
    } else if (section == 2) {
        return 2;
    } else {
        return 2;
    }
}

/**
 *  告诉tableView第indexPath行cell的高度
 *
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){//等高cell
        return 70;
    }else if(indexPath.section == 1){//非等高cell
        XMGStatus *staus = self.statuses[indexPath.row];
        return staus.cellHeight;
    }else{
        return 100;
    }
    
    
}
/**
 * 返回每一行的估计高度.非等高cell
 * 只要返回了估计高度，那么就会先调用tableView:cellForRowAtIndexPath:方法创建cell，再调用tableView:heightForRowAtIndexPath:方法获取cell的真实高度
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

/**
 *  什么时候调用：每当有一个cell进入视野范围内就会调用
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        // 创建cell
        CustomEqualCell *cell = [CustomEqualCell cellWithTableView:tableView];
        
        // 取出模型数据
        cell.deal = self.deals[indexPath.row];
        
        return cell;
    }else if(indexPath.section == 1){
        XMGStatusCell *cell = [XMGStatusCell cellWithTableView:tableView];
        cell.status = self.statuses[indexPath.row];
        return cell;
    }else{
        // 创建cell
        CustomEqualCell *cell = [CustomEqualCell cellWithTableView:tableView];
        
        // 取出模型数据
        cell.deal = self.deals[indexPath.row];
        
        return cell;
    }
    
    
    
}

/**
 *  告诉tableView第section组的头部标题,设置头部控件后没有头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"等高cell";
    } else if (section == 1) {
        return @"非等高cell";
    } else if (section == 2) {
        return @"第3组";
    } else {
        return @"其他";
    }
}
/**
 *  告诉tableView第section组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"第一组尾部标题";
    } else if (section == 1) {
        return @"第2组尾部标题";
    } else if (section == 2) {
        return @"第3组尾部标题";
    } else {
        return @"其他尾部标题";
    }
}

/**
 *  每组头部的高度
 *
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

/**
 *  告诉tableView第section显示怎样的头部控件,设置头部控件后就没有头部标题了
 *
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}


#pragma mark - <UITableViewDelegate>
/**
 *  选中某一行的时候调用(点击某一行)
 *
 *  @param indexPath 被选中的那一行
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中selectRowAtIndexPath - %zd", indexPath.row);
}

/**
 *  取消选中某一行的时候调用
 *
 *  @param indexPath 被取消选中的那一行
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"取消选中deselectRowAtIndexPath - %zd", indexPath.row);
}

#pragma mark - 左滑显示多个按钮

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        // 处理删除操作
        completionHandler(YES);
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    
    UIContextualAction *moreAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"More" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        // 处理更多操作
        completionHandler(YES);
    }];
    moreAction.backgroundColor = [UIColor grayColor];
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction, moreAction]];
    config.performsFirstActionWithFullSwipe = NO; // 是否需要完全滑动才能触发第一个动作
    return config;
}
@end
