//
//  NTOneDownFileVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/6.
//

#import "NTOneDownFileVC.h"

//保存文件路径
#define XMGFile [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"minion_15.mp4"]

@interface NTOneDownFileVC ()<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
/** 文件的总长度 */
@property (nonatomic, assign) NSInteger contentLength;
/** 当前下载的总长度 */
@property (nonatomic, assign) NSInteger currentLength;

/** 文件句柄对象 */
@property (nonatomic, strong) NSFileHandle *handle;

@end

@implementation NTOneDownFileVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_15.mp4"];
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
}

#pragma mark - <NSURLConnectionDataDelegate>
/**
 * 接收到响应的时候：创建一个空的文件
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response
{
    // 获得文件的总长度
    self.contentLength = [response.allHeaderFields[@"Content-Length"] integerValue];
    
    // 创建一个空的文件
    [[NSFileManager defaultManager] createFileAtPath:XMGFile contents:nil attributes:nil];
    
    // 创建文件句柄
    self.handle = [NSFileHandle fileHandleForWritingAtPath:XMGFile];
}

/**
 * 接收到具体数据：马上把数据写入一开始创建好的文件
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 指定数据的写入位置 -- 文件内容的最后面
    [self.handle seekToEndOfFile];
    
    // 写入数据
    [self.handle writeData:data];
    
    // 拼接总长度
    self.currentLength += data.length;
    
    // 进度
    self.progressView.progress = 1.0 * self.currentLength / self.contentLength;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 关闭handle
    [self.handle closeFile];
    self.handle = nil;
    
    // 清空长度
    self.currentLength = 0;
}

@end
