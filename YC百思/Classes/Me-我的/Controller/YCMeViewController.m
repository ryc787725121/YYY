//
//  YCMeViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCMeViewController.h"
@interface YCMeViewController ()

@end

@implementation YCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏的内容
    self.navigationItem.title = @"我的";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItems = @[
                                                [UIBarButtonItem itemWithImage:@"mine-setting-icon" hightImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)],
                                                [UIBarButtonItem itemWithImage:@"mine-moon-icon" hightImage:@"mine-moon-icon-click" target:self action:@selector(nightModeButtonClick)]
                                                
                                                ];
    
    // 设置背景色
    self.view.backgroundColor = YCGlobalBg;
    

    
}

- (void)settingButtonClick {
    YCLogFunc;
}

- (void)nightModeButtonClick {
    YCLogFunc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
