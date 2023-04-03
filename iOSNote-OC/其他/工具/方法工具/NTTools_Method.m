//
//  NTTools_Method.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "NTTools_Method.h"

@interface NTTools_Method()
@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;
@property (nonatomic, strong) id argument;

@property (nonatomic) BOOL isExecuting;

@end


@implementation NTTools_Method

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static NTTools_Method *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NTTools_Method alloc] init];
    });
    return sharedInstance;
}

+ (void)debounceWithDelay:(NSTimeInterval)delay target:(id)target selector:(SEL)selector argument:(nullable id)argument {
    NTTools_Method *debouncer = [NTTools_Method sharedInstance];
    
    if (debouncer.isExecuting) {
        return;
    }
    
    debouncer.target = target;
    debouncer.selector = selector;
    debouncer.argument = argument;
    debouncer.isExecuting = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [debouncer.target performSelector:debouncer.selector withObject:debouncer.argument];
        #pragma clang diagnostic pop
        
        debouncer.isExecuting = NO;
    });
}

@end
