//
//  NTWebViewOCAndJSVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/9.
//

#import "NTWebViewOCAndJSVC.h"

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
- (void)openCamera
{
    NSLog(@"%s", __func__);
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
    //JS和OC约定好的协议头
    NSString *scheme = @"xmg://";
    if ([url hasPrefix:scheme]) {
        //获取JS传过来的方法名
        NSString *methodName = [url substringFromIndex:scheme.length];
        //执行OC的方法
        [self performSelector:NSSelectorFromString(methodName) withObject:nil];
        
        return NO;
    }else{
        NSLog(@"想加载其他请求，不是想调用OC的方法");
    }
    
    
    
    return YES;
}

@end
