//
//  DataTools.h
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataTools : NSObject


/// 查找两个数组相同的和不同的数据，传入的参数有：两个用于查找的数组，两个用于保存数据的数组
/*
 示例:NSArray *array1 = @[@1, @2, @3, @4];
 NSArray *array2 = @[@3, @4, @5, @6];
 NSMutableArray *commonObjects = [NSMutableArray array];
 NSMutableArray *differentObjects = [NSMutableArray array];
 [DataTools findCommonAndDifferentObjectsInArray1:array1
                                     array2:array2
                              commonObjects:&commonObjects
                           differentObjects:&differentObjects];
 NSLog(@"共同元素：%@", commonObjects);
 NSLog(@"不同元素：%@", differentObjects);
 */
+ (void)findCommonAndDifferentObjectsInArray1:(NSArray *)array1
                                     array2:(NSArray *)array2
                              commonObjects:(NSMutableArray **)commonObjects
                             differentObjects:(NSMutableArray **)differentObjects;
@end

NS_ASSUME_NONNULL_END
