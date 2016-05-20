//
//  YCLoginRegisterController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/17.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCLoginRegisterController.h"

@interface YCLoginRegisterController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

/** 登陆框距离控制器view左边的间距 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;


@end

@implementation YCLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

/**
 *  登陆注册按钮
 * 
 */
- (IBAction)showLoginOrRegister:(UIButton *)sender {
    
    // 退出键盘
    [self.view endEditing:YES];
    
    if (self.loginViewLeftMargin.constant == 0) { // 显示注册界面
        
        sender.selected = YES;
        self.loginViewLeftMargin.constant = -self.view.width;

    }else { // 显示登陆界面
         self.loginViewLeftMargin.constant = 0;
        sender.selected = NO;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];

}


- (IBAction)back {
    // 退出键盘
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  当前对应的状态栏是白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

@end
