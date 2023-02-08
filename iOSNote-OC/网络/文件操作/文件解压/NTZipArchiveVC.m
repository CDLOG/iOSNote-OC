//
//  NTZipArchiveVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/7.
//

#import "NTZipArchiveVC.h"
#import <SSZipArchive.h>
@interface NTZipArchiveVC ()

@end

@implementation NTZipArchiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self zip];
    // Do any additional setup after loading the view from its nib.
}

//压缩文件夹到指定路径
-(void)zip{
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];

    NSString* zipPath = [paths stringByAppendingPathComponent:@"SSZipArchive.zip"];
    NSLog(@"zipPath === %@",zipPath);
    
    
    if([SSZipArchive createZipFileAtPath:zipPath withContentsOfDirectory:@"/Users/chenlejie/Desktop/TEXT"]){
        NSLog(@"压缩成功");
    }else{
        NSLog(@"压缩失败");
    }
}

-(void)unZip{
    
    
    //Caches路径

NSString * cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];

    //解压目标路径

    NSString* destinationPath = [cachesPath stringByAppendingPathComponent:@"SSZipArchive"];

    //zip压缩包的路径

    NSString* zipPath = [cachesPath stringByAppendingPathComponent:@"SSZipArchive.zip"];
    
    
    
    if([SSZipArchive unzipFileAtPath:zipPath toDestination:@"/Users/chenlejie/Desktop"]){
        NSLog(@"解压缩成功");
    }else{
        NSLog(@"解压缩失败");
    }}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self unZip];
}



@end
