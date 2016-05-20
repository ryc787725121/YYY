//
//  YCFriendTrendsViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCFriendTrendsViewController.h"
#import "YCRecommendViewController.h"
#import "YCLoginRegisterController.h"
@interface YCFriendTrendsViewController ()

@end

@implementation YCFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏的内容
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
     self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" hightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendButtonClick)];

    // 设置背景色
    self.view.backgroundColor = YCGlobalBg;
}
- (void)friendButtonClick {

    YCRecommendViewController *vc = [[YCRecommendViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark --- 登陆注册事件
- (IBAction)loginRegister {
    
    YCLoginRegisterController *login = [[YCLoginRegisterController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
