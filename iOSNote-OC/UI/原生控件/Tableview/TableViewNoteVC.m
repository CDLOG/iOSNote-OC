//
//  TableViewNoteVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/5.
//

#import "TableViewNoteVC.h"
#import "CustomEqualCell.h"
@interface TableViewNoteVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 所有的团购数据 */
@property (nonatomic, strong) NSArray *deals;
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
        return 4;
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
    }else{
        return 100;
    }
    
    
}


/**
 *  什么时候调用：每当有一个cell进入视野范围内就会调用
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    CustomEqualCell *cell = [CustomEqualCell cellWithTableView:tableView];
    
    // 取出模型数据
    cell.deal = self.deals[indexPath.row];
    
    return cell;
    
}

/**
 *  告诉tableView第section组的头部标题,设置头部控件后没有头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"第一组";
    } else if (section == 1) {
        return @"第2组";
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




@end
