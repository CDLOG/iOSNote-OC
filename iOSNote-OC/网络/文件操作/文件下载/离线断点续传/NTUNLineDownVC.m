//
//  NTUNLineDownVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/14.
//

//待完善,封装一下

/*
 
 //    [[XMGDownloadManager sharedInstance] download:@"" progress:^(CGFloat progress) {
 //
 //    } complete:(NSError *error, NSString *filepath) {
 //
 //    }];
 */


// 所需要下载的文件的URL
#define XMGFileURL @"https://img1.baidu.com/it/u=16757792,2087889397&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500"

// 文件名（沙盒中的文件名）,需要包含文件类型
#define XMGFilename XMGFileURL.md5String
// 文件的存放路径（caches）
#define XMGFileFullpath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:XMGFilename]

// 存储文件总长度的文件路径（caches）
#define XMGTotalLengthFullpath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"totalLength.xmg"]

// 文件的已下载长度
#define XMGDownloadLength [[[NSFileManager defaultManager] attributesOfItemAtPath:XMGFileFullpath error:nil][NSFileSize] integerValue]


#import "NTUNLineDownVC.h"
#import "NSString+Hash.h"
@interface NTUNLineDownVC ()<NSURLSessionDataDelegate>
/** 下载任务 */
@property (nonatomic, strong) NSURLSessionDataTask *task;
/** session */
@property (nonatomic, strong) NSURLSession *session;
/** 写文件的流对象 */
@property (nonatomic, strong) NSOutputStream *stream;
/** 文件的总长度 */
@property (nonatomic, assign) NSInteger totalLength;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation NTUNLineDownVC

- (NSURLSession *)session
{
    
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    }
    return _session;
}

- (NSOutputStream *)stream
{
    if (!_stream) {
        _stream = [NSOutputStream outputStreamToFileAtPath:XMGFileFullpath append:YES];
    }
    return _stream;
}


- (NSURLSessionDataTask *)task
{
    if (!_task) {
        NSInteger totalLength = [[NSDictionary dictionaryWithContentsOfFile:XMGTotalLengthFullpath][XMGFilename] integerValue];
        if (totalLength && XMGDownloadLength == totalLength) {
            NSLog(@"----文件已经下载过了,%@\n",XMGFileFullpath);
            //下载完成后加载数据
            NSData *date = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:XMGFileFullpath]];
            self.imageView.image = [UIImage imageWithData:date];
            return nil;
        }
        
        // 创建请求
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:XMGFileURL]];
        
        // 设置请求头
        // Range : bytes=xxx-xxx
        NSString *range = [NSString stringWithFormat:@"bytes=%zd-", XMGDownloadLength];
        [request setValue:range forHTTPHeaderField:@"Range"];
        
        // 创建一个Data任务
        _task = [self.session dataTaskWithRequest:request];
    }
    return _task;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", XMGFileFullpath);
}

/**
 * 开始下载
 */
- (IBAction)start:(id)sender {
    // 启动任务
    [self.task resume];
}

/**
 * 暂停下载
 */
- (IBAction)pause:(id)sender {
    [self.task suspend];
}

#pragma mark - <NSURLSessionDataDelegate>
/**
 * 1.接收到响应
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSHTTPURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 打开流
    [self.stream open];
    
    // 获得服务器这次请求 返回数据的总长度
    self.totalLength = [response.allHeaderFields[@"Content-Length"] integerValue] + XMGDownloadLength;
    
    // 存储总长度
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:XMGTotalLengthFullpath];
    if (dict == nil) dict = [NSMutableDictionary dictionary];
    dict[XMGFilename] = @(self.totalLength);
    [dict writeToFile:XMGTotalLengthFullpath atomically:YES];
    
    // 接收这个请求，允许接收服务器的数据
    completionHandler(NSURLSessionResponseAllow);
}

/**
 * 2.接收到服务器返回的数据（这个方法可能会被调用N次）
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    // 写入数据
    [self.stream write:data.bytes maxLength:data.length];
    
    // 下载进度
    NSLog(@"%f", 1.0 * XMGDownloadLength / self.totalLength);
}

/**
 * 3.请求完毕（成功\失败）
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        //下载完成后加载数据
        NSData *date = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:XMGFileFullpath]];
        self.imageView.image = [UIImage imageWithData:date];
    });
    
    // 关闭流
    [self.stream close];
    self.stream = nil;
    
    // 清除任务
    self.task = nil;
}

@end
