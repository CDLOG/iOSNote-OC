

/*
 使用方式
 1,目标类导入头文件,#import "XMGSingleton.h"
 2,目标类的.h文件,属性声明位置-XMGSingletonH
 3,目标类的.m文件,方法实现位置-XMGSingletonM
 
 之后通过sharedInstance创建单例
 
 */





// .h文件
#define XMGSingletonH + (instancetype)sharedInstance;

// .m文件
#define XMGSingletonM \
static id _instace; \
 \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instace = [super allocWithZone:zone]; \
    }); \
    return _instace; \
} \
 \
+ (instancetype)sharedInstance \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instace = [[self alloc] init]; \
    }); \
    return _instace; \
} \
 \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instace; \
}
