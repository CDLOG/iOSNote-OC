//
//  SceneDelegate.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2022/11/7.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;

+ (SceneDelegate *)shareApplication;
@end

