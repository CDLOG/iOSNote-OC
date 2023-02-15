应用程序互相跳转
(用于授权,分享等)



每个程序都可以设置自己的Scheme,用于被其他应用启动
其他应用想要通过某个程序的Scheme来跳转时,必须将这个程序的Scheme设置到plist文件的白名单中,否则不能跳转
白名单设置:在 info.plist 增加 key：LSApplicationQueriesSchemes，类型为NSArray。
Scheme可以认为是某个应用的协议头,而具体路径可以用来跳转某一个具体的界面
/** 只要是由其他应用程序打开的，就会调用此方法 */
/** URL 就是其他应用程序，打开当前程序使用的URL */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url

/**
 openURL 是打开当前应用程序的url
 sourceApplication 是当开当前应用程序的源程序的BundleId
 
 提示：一旦重写了新方法，旧方法就不再被执行
 但是：很多第三方框架，都建议两个方法全都写
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
