//
//  NTHTMLABCVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/9.
//

#import "NTHTMLABCVC.h"

@interface NTHTMLABCVC ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
//返回按钮
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
//前进按钮
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

@end

@implementation NTHTMLABCVC
- (IBAction)back:(id)sender {
    [self.webView goBack];
}

- (IBAction)forward:(id)sender {
    [self.webView goForward];
}

- (IBAction)refresh:(id)sender {
    //刷新网页
    [self.webView reload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.webView.delegate = self;
    //设置网页内边距
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    
    // 网页内容缩小到适应整个设备屏幕
    self.webView.scalesPageToFit = YES;
    
    // 检测各种特殊的字符串：比如电话、网站,自动识别并响应
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;

    [self loadData];
   
    
}

//页面加载
-(void)loadData{
    //加载本地HTML页面
    [self.webView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"]]];
    
    //通过url加载页面
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
     
//通过文件路径加载文件
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:@"/Users/xiaomage/Desktop/test.pptx"]]];
    
   
//通过HTML源代码加载页面
//    [self.webView loadHTMLString:@"<html><body><div style=\"color: red; font-size:10px; border:1px solid blue;\">哈哈哈哈哈</div></body></html>" baseURL:nil];
}


#pragma mark - <UIWebViewDelegate>
//加载结束
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    NSLog(@"%s", __func__);
    
    self.backItem.enabled = webView.canGoBack;
    self.forward.enabled = webView.canGoForward;
}
//开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    NSLog(@"%s", __func__);
}
//加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    NSLog(@"%s", __func__);
    
    self.backItem.enabled = webView.canGoBack;
    self.forward.enabled = webView.canGoForward;
}

/**
 *是否允许请求
 * 每当webView即将发送一个请求之前，都会调用这个方法,也可以用于和JS交互
 * 返回YES：允许加载这个请求
 * 返回NO：禁止加载这个请求
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
//    NSLog(@"%@", request.URL);
    if ([request.URL.absoluteString containsString:@"life"]) return NO;
    
 
    return YES;
}

@end
