//
//  YCNewViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCNewViewController.h"

@interface YCNewViewController ()

@end

@implementation YCNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" hightImage:@"MainTagSubIconClick" target:self action:@selector(newButtonClick)];
    
    // 设置背景色
    self.view.backgroundColor = YCGlobalBg;
}

- (void)newButtonClick {
    YCLogFunc;
}


@end
