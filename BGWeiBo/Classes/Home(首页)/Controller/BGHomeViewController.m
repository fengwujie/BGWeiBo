//
//  BGHomeViewController.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/14.
//  Copyright (c) 2015年 BG. All rights reserved.
//

#import "BGHomeViewController.h"
#import "BGTitleMenuViewController.h"
#import "BGDropdownMenu.h"
#import "AFNetworking.h"
#import "BGAccountTool.h"
#import "MBProgressHUD+MJ.h"
#import "BGTitleButton.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "BGStatus.h"
#import "BGUser.h"

@interface BGHomeViewController ()<BGDropdownMenuDelegate>
/**
 *  微博模型数组
 */
@property (nonatomic, strong) NSArray *statuses;

@end

@implementation BGHomeViewController

-(NSArray *)statuses{
    if(_statuses==nil)
    {
        _statuses = [NSArray array];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏信息
    [self setupNav];
    
    // 获得用户信息（昵称）
    [self setupUserInfo];
    
    // 加载最新微博信息
    [self loadNewStatus];
}

/**
 *  加载最新微博信息
 */
-(void)loadNewStatus
{
    /*
     URL：https://api.weibo.com/2/statuses/friends_timeline.json
     
     请求参数：
     access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
     uid	false	int64	需要查询的用户ID。
     */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    BGAccount *account = [BGAccountTool account];
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"count"] = @20;   //默认是20
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        BGLog(@"请求成功-%@", responseObject);
        [MBProgressHUD hideHUD];
        
        self.statuses = [BGStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        //self.statuses = responseObject[@"statuses"];
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        BGLog(@"请求失败-%@", error);
        
        [MBProgressHUD hideHUD];
    }];
}

/**
 *  获得用户信息（昵称）
 */
-(void)setupUserInfo
{
    /*
    URL：https://api.weibo.com/2/users/show.json
    
    请求参数：
     access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
     uid	false	int64	需要查询的用户ID。
    */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    BGAccount *account = [BGAccountTool account];
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        BGLog(@"请求成功-%@", responseObject);
        
        [MBProgressHUD hideHUD];
        BGUser *user = [BGUser objectWithKeyValues:responseObject];
        // 设置名称
        UIButton *titileButton = (UIButton *)self.navigationItem.titleView;
        [titileButton setTitle:user.name forState:UIControlStateNormal];
        
        // 保存账号信息
        account.name = user.name;
        [BGAccountTool saveAccount:account];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        BGLog(@"请求失败-%@", error);
        
        [MBProgressHUD hideHUD];
    }];
}

/**
 *  设置导航栏内容
 */
- (void)setupNav
{
    // 设置导航栏左上角的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    // 设置导航栏右上角的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    
    /* 中间的标题按钮 */
    BGTitleButton *titleButton = [[BGTitleButton alloc] init];
    titleButton.width = 200;
    titleButton.height = 30;
    
    // 设置图片和文字
    NSString *name = [BGAccountTool account].name;
    [titleButton setTitle:name ? name : @"首页" forState:UIControlStateNormal];
    
    // 监听标题点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
    // 如果图片的某个方向上不规则，比如有突起，那么这个方向就不能拉伸
}

/**
 *  标题点击
 */
- (void)titleClick:(UIButton *)titleButton
{
    // 1.创建下拉菜单
    BGDropdownMenu *menu = [BGDropdownMenu menu];
    menu.delegate = self;
    
    // 2.设置内容
    BGTitleMenuViewController *vc = [[BGTitleMenuViewController alloc] init];
    vc.view.height = 150;
    vc.view.width = 150;
    menu.contentController = vc;
    
    // 3.显示
    [menu showFrom:titleButton];
}


- (void)friendSearch
{
    BGLog(@"friendSearch");
}

- (void) pop
{
    BGLog(@"pop");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HWDropdownMenuDelegate
/**
 *  下拉菜单被销毁了
 */
- (void)dropdownMenuDidDismiss:(BGDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    // 让箭头向下
    titleButton.selected = NO;
}

/**
 *  下拉菜单显示了
 */
- (void)dropdownMenuDidShow:(BGDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    // 让箭头向上
    titleButton.selected = YES;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"status";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 取出这行对应的微博字典
    BGStatus *status = self.statuses[indexPath.row];
    // 取得这条微博的作者（用户）
    BGUser *user = status.user;
    cell.textLabel.text = user.name;
    // 设置微博的文字
    cell.detailTextLabel.text=status.text;
    //设置微博的头像
    UIImage *placeholder = [UIImage imageNamed:@"avatar_default_small"];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:placeholder];
    return cell;
}

@end
