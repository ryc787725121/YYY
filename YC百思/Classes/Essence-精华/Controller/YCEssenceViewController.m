//
//  YCEssenceViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCEssenceViewController.h"
#import "YCRecommendTagsViewController.h"
@interface YCEssenceViewController ()

@end

@implementation YCEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" hightImage:@"MainTagSubIconClick" target:self action:@selector(essenceButtonClick)];
    
    // 设置背景色
     self.view.backgroundColor = YCGlobalBg;
}

- (void)essenceButtonClick {
    YCRecommendTagsViewController *tagsVC = [[YCRecommendTagsViewController alloc] init];
    [self.navigationController pushViewController:tagsVC animated:YES];
    
}


@end
