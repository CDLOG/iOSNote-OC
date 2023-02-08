//
//  NTOutputStreamVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/7.
//

#import "NTOutputStreamVC.h"

@interface NTOutputStreamVC ()<NSURLConnectionDataDelegate>
/** 输出流对象 */
@property (nonatomic, strong) NSOutputStream *stream;

@end

@implementation NTOutputStreamVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4"]] delegate:self];
}

#pragma mark - <NSURLConnectionDataDelegate>
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // response.suggestedFilename : 服务器那边的文件名
    
    // 文件路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *file = [caches stringByAppendingPathComponent:response.suggestedFilename];
    NSLog(@"%@", file);
    
    // 利用NSOutputStream往Path中写入数据（append为YES的话，每次写入都是追加到文件尾部）
    self.stream = [[NSOutputStream alloc] initToFileAtPath:file append:YES];
    // 打开流(如果文件不存在，会自动创建)
    [self.stream open];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.stream write:[data bytes] maxLength:data.length];
    NSLog(@"didReceiveData-------");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.stream close];
    NSLog(@"-------");
}

@end
