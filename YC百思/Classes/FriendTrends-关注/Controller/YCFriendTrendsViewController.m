//
//  YCFriendTrendsViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCFriendTrendsViewController.h"

@interface YCFriendTrendsViewController ()

@end

@implementation YCFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YCLogFunc;
    
    // 设置导航栏的内容
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
     self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" hightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendButtonClick)];

    // 设置背景色
    self.view.backgroundColor = YCGlobalBg;
}
- (void)friendButtonClick {
    YCLogFunc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
