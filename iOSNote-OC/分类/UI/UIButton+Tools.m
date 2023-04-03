//
//  UIButton+Tools.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/4/3.
//

#import "UIButton+Tools.h"
#import <objc/runtime.h>
@implementation UIButton (Tools)


- (void)addClickLimitWithInterval:(NSTimeInterval)interval {
    SEL originalSelector = @selector(sendAction:to:forEvent:);
    SEL swizzledSelector = @selector(click_limit_sendAction:to:forEvent:);
    
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
    
    BOOL didAddMethod = class_addMethod([self class], originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod([self class], swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    objc_setAssociatedObject(self, @selector(clickLimitInterval), @(interval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)click_limit_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSTimeInterval interval = [objc_getAssociatedObject(self, @selector(clickLimitInterval)) doubleValue];
    if (NSDate.date.timeIntervalSince1970 - self.clickLimitLastClickTime < interval) {
        return;
    }
    self.clickLimitLastClickTime = NSDate.date.timeIntervalSince1970;
    [self click_limit_sendAction:action to:target forEvent:event];
}

- (void)setClickLimitLastClickTime:(NSTimeInterval)clickLimitLastClickTime {
    objc_setAssociatedObject(self, @selector(clickLimitLastClickTime), @(clickLimitLastClickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)clickLimitLastClickTime {
    return [objc_getAssociatedObject(self, @selector(clickLimitLastClickTime)) doubleValue];
}

- (void)setClickLimitInterval:(NSTimeInterval)clickLimitInterval {
    objc_setAssociatedObject(self, @selector(clickLimitInterval), @(clickLimitInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)clickLimitInterval {
    return [objc_getAssociatedObject(self, @selector(clickLimitInterval)) doubleValue];
}

@end
