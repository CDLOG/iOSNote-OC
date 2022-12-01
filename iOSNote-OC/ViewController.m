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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomViewClass *custom_view = [CustomViewClass customViewCreat];
    custom_view.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:custom_view];
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PlistLoadVC *vc = [[PlistLoadVC alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
