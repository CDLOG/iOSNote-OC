//
//  ViewController.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import "ViewController.h"
#import "ViewNoteController.h"
#import "XcodeVC.h"
#import "PlistLoadVC.h"
#import "CustomViewClass.h"
#import "ScrollVC.h"
#import "TableViewNoteVC.h"
#import "XMGDealsViewController.h"
#import "PickerViewNoteVC.h"
#import "CLJDatePickAndCityPickVC.h"
#import "NTUICollectionViewVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *hitBtn = [UIView addButtonWithUIview:self.view Frame:CGRectMake(100, 100, 200, 200) Title:@"加载"];
    [hitBtn addTarget:self action:@selector(loadAction) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"导航";
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)loadAction{
    NTUICollectionViewVC *vc = [[NTUICollectionViewVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
