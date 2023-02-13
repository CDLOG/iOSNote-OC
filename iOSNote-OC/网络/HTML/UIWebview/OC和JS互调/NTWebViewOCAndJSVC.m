//
//  NTWebViewOCAndJSVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/9.
//

#import "NTWebViewOCAndJSVC.h"
#import "NSObject+Extension.h"
@interface NTWebViewOCAndJSVC ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation NTWebViewOCAndJSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"]]];
}

//JS调用的OC方法
- (void)sendMessage
{
    NSLog(@"%s", __func__);
}

- (void)sendMessage1:(NSString *)Param
{
    NSLog(@"%s %@", __func__,Param);
}
- (void)sendMessage1:(NSString *)Param number2:(NSString *)Param2
{
    NSLog(@"%s %@ %@", __func__,Param,Param2);
}
//有参数,有返回值
- (NSString *)sendMessage1:(NSString *)Param number2:(NSString *)Param2 number3:(NSString *)Param3
{
    NSLog(@"%s %@ %@ %@", __func__,Param,Param2,Param3);
    return @"有返回值";
}
#pragma mark - <UIWebViewDelegate>

//OC调用JS方法stringByEvaluatingJavaScriptFromString
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [webView stringByEvaluatingJavaScriptFromString:@"alert(100);"];
    
    // 利用JS获得当前网页的标题
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title;"];
    
//    OC调用JS方法
    NSString *result = [webView stringByEvaluatingJavaScriptFromString:@"loginn();"];
    NSLog(@"%@", result);
}

/**
 * 通过这个方法完成JS调用OC,只能通过拦截跳转请求来使JS调用OC的方法,网页通过修改当前的href来变更请求,约定好JS调用OC的协议头,跳转时识别到这个协议,就执行对应OC方法.
 * JS和OC交互的第三方框架：WebViewJavaScriptBridge
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    //JS和OC约定好的协议头,判断是JS调用OC方法,而不是跳转链接
    NSString *scheme = @"xmg://";
    if ([url hasPrefix:scheme]) {
        // 获得协议后面的路径(方法名和参数信息)
        NSString *path = [url substringFromIndex:scheme.length];
        
        [self JS2OCMethod:path];
        
        return NO;
    }
    
    NSLog(@"想加载其他请求");
    
    return YES;
}

/// 函数有两个及以下参数的处理
/// - Parameter path: 去掉协议头后的字符串
-(void)JS2OCMethod:(NSString *)path{
    // 利用?切割路径
    NSArray *subpaths = [path componentsSeparatedByString:@"?"];
    // 方法名 methodName == sendMessage:number2:,因为H5不能直接写:,所以需要符号替换
    NSString *methodName = [[subpaths firstObject] stringByReplacingOccurrencesOfString:@"_" withString:@":"];
    // 函数参数 
    NSString *param = [subpaths lastObject];
    NSArray *subparams = nil;
    if (param.length > 0 || [param containsString:@"&"]) {
        subparams = [param componentsSeparatedByString:@"&"];
    }
    //调用OC方法,获取函数返回值
    id returnValue =  [self performSelector:NSSelectorFromString(methodName) withObjects:subparams];
    if ([returnValue isKindOfClass:[NSString class]]){
        NSLog(@"returnValue是---%@",returnValue);
    }
}


@end
