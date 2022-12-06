//
//  TableViewNoteVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/5.
//

#import "TableViewNoteVC.h"

@interface TableViewNoteVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TableViewNoteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    // 行高
    tableView.rowHeight = 70;
    self.tableView = tableView;
    [self.view addSubview:tableView];
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
        return 3;
    } else if (section == 1) {
        return 4;
    } else if (section == 2) {
        return 2;
    } else {
        return 2;
    }
}
/**
 *  告诉tableView第indexPath行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"文案";
    return cell;
}
/**
 *  告诉tableView第section组的头部标题
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


@end
