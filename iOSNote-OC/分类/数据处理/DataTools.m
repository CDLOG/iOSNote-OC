//
//  DataTools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/4.
//

#import "DataTools.h"

@implementation DataTools
+ (void)findCommonAndDifferentObjectsInArray1:(NSArray *)array1
                                     array2:(NSArray *)array2
                              commonObjects:(NSMutableArray **)commonObjects
                           differentObjects:(NSMutableArray **)differentObjects {
    if (!array1 || !array2) {
        return;
    }
    NSMutableSet *set1 = [NSMutableSet setWithArray:array1];
    NSMutableSet *set2 = [NSMutableSet setWithArray:array2];
    
    // 计算交集
    NSMutableSet *intersectionSet = [NSMutableSet setWithSet:set1];
    [intersectionSet intersectSet:set2];
    if (commonObjects) {
        *commonObjects = [NSMutableArray arrayWithArray:[intersectionSet allObjects]];
    }
    
    // 计算差集
    NSMutableSet *differenceSet = [NSMutableSet setWithSet:set1];
    [differenceSet minusSet:set2];
    NSMutableSet *differenceSet2 = [NSMutableSet setWithSet:set2];
    [differenceSet2 minusSet:set1];
    [differenceSet unionSet:differenceSet2];
    if (differentObjects) {
        *differentObjects = [NSMutableArray arrayWithArray:[differenceSet allObjects]];
    }
}
@end
