//
//  NTUIbug.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/5.
//

#import "NTUIbug.h"

@interface NTUIbug ()

@end

@implementation NTUIbug

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - cell
-(void)bug{
/*
    cell复用问题导致选中cell的错乱bug
    解决方案:在cell的model中单独使用一个属性来标识被选中的cell。
            在每次复用的时候都会调用setmodel方法，根据这个属性来设置不同的UI。
 ```
 if (self.cellmodel.isSelect) {
         self.backColorView.backgroundColor = color_Alpha(@"6A43D1", 0.06);
     }else{
 // 必须设置else，设置其他cell
         self.backColorView.backgroundColor = color_clear;
     }
   
 ```
 */
}

@end
