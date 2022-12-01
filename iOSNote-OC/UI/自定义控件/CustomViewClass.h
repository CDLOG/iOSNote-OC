//
//  CustomView.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/12/1.
//

//示例
//CustomView *custom_view = [CustomView customViewCreat];
//custom_view.frame = CGRectMake(100, 100, 100, 30);
//[self.view addSubview:custom_view];


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomViewClass : UIView
+(instancetype)customViewCreat;   
@end

NS_ASSUME_NONNULL_END
