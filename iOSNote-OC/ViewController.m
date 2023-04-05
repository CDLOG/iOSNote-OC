//
//  ViewController.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import "ViewController.h"
#import "ViewNoteController.h"
#import "NTDelegateVC.h"
#import "NTBlockVC.h"
#import "NTCover.h"
#import "NTCoverView.h"
#import "NTAFNDownVC.h"
#import "NTNotificationVC.h"
#import "NTSaveTool.h"
#import "NTOddVC.h"
#import "NTtextVC.h"
#import "TableViewNoteVC.h"
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
    NTtextVC *tmpVC = [[NTtextVC alloc]init];
    [self.navigationController pushViewController:tmpVC animated:YES];
   
}



@end
