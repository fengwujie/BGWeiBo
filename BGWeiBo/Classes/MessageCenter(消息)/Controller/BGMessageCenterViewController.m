//
//  BGMessageCenterViewController.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/14.
//  Copyright (c) 2015年 BG. All rights reserved.
//

#import "BGMessageCenterViewController.h"

@interface BGMessageCenterViewController ()

@end

@implementation BGMessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // UIBarButtonItemStyle在IOS6中比较明显
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(composeMsg)];
    
    // 这个item不能点击(目前放在viewWillAppear就能显示disable下的主题)
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void) composeMsg
{
    BGLog(@"composeMsg");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
