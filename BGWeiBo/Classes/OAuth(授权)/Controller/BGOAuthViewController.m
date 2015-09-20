//
//  BGOAuthViewController.m
//  BGWeiBo
//
//  Created by apple on 14-10-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "BGOAuthViewController.h"
#import "AFNetworking.h"
#import "BGAccount.h"
#import "BGTabBarViewController.h"
#import "BGNewfeatureViewController.h"
#import "MBProgressHUD+MJ.h"

@interface BGOAuthViewController () <UIWebViewDelegate>

@end

@implementation BGOAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建一个webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    // 2.用webView加载登录页面（新浪提供的）
    // 请求地址：https://api.weibo.com/oauth2/authorize
    /* 请求参数：
     client_id	true	string	申请应用时分配的AppKey。
     redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
    */
    /*
     Xcode7，访问https:会出现错误：NSURLSession/NSURLConnection HTTP load failed (kCFStreamErrorDomainSSL, -9802)
     原因是安全机制改了，需要在info文件中增加配置
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=497493438&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - webView代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载中......"];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 1.获得url
    NSString *url = request.URL.absoluteString;
    BGLog(@"%@", url);
    // 2.判断是否为回调地址
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) { // 是回调地址
        // 截取code=后面的参数值
        int fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        BGLog(@"%@", code);
        
        // 利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        // 返回NO，禁止调用后面的回调页面
        return NO;
    }
    
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUD];
}

/**
 *  利用code（授权成功后的request token）换取一个accessToken
 *
 *  @param code 授权成功后的request token
 */
- (void)accessTokenWithCode:(NSString *)code
{
/*
 URL：https://api.weibo.com/oauth2/access_token
 
 请求参数：
 client_id：申请应用时分配的AppKey
 client_secret：申请应用时分配的AppSecret
 grant_type：使用authorization_code
 redirect_uri：授权成功后的回调地址
 code：授权成功后返回的code
 */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // AFN的AFJSONResponseSerializer默认不接受text/plain这种类型
    // 修改AFURLResponseSerialization.m文件，self.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", @"text/json", @"text/javascript", nil];
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"497493438";
    params[@"client_secret"] = @"2b7ffa72da4c6cba326b6803cbf91cd1";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"http://www.baidu.com";
    params[@"code"] = code;
    
    // 3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        BGLog(@"请求成功-%@", responseObject);
        
        [MBProgressHUD hideHUD];
        
        // 沙盒路径
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [doc stringByAppendingPathComponent:@"account.data"];
        // 将返回来的字典转换成模型
        BGAccount *account = [BGAccount accountWithDict:responseObject];
        // 将模型转保存到沙盒文件中；自定义对象的存储必须用NSKeyedArchiver，不再用WriteToFile方法
        [NSKeyedArchiver archiveRootObject:account toFile:path];
        BGLog(@"%@", path);
        // 切换窗口的根控制器
        NSString *key = @"CFBundleVersion";
        // 上一次的使用版本（存在沙盒中的版本号）
        NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        // 当前软件的版本号（从Info.plist中获得）
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if ([currentVersion isEqualToString:lastVersion]) {  //版本相同，则直接进入主界面
            window.rootViewController = [[BGTabBarViewController alloc] init];
        }
        else  //版本不一样，则显示 新特性
        {
            window.rootViewController = [[BGNewfeatureViewController alloc] init];
            
            // 将当前版本号存入在沙盒中
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        BGLog(@"请求失败-%@", error);
        
        [MBProgressHUD hideHUD];
    }];
}
@end
