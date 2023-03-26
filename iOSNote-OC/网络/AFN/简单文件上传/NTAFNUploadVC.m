//
//  NTAFNUploadVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/9.
//

#import "NTAFNUploadVC.h"
#import <AFNetworking.h>
@interface NTAFNUploadVC ()

@end

@implementation NTAFNUploadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//注意点,上传文件的参数名要在block中设置(name)
- (void)upload
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    
    [mgr POST:@"http://120.25.226.186:32812/upload" parameters:@{@"username" : @"123"} headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 在这个block中设置需要上传的文件
        
        //自动判断上传文件的源类型,并将本地的文件名作为服务器的文件名,name是服务器规定的参数名称
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"/Users/xiaomage/Desktop/placeholder.png"] name:@"file"  error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传进度%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功---%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败---%@",error);
    }];
    
  
}



@end
