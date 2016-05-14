//
//  YCNavigationController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCNavigationController.h"

@interface YCNavigationController ()

@end

@implementation YCNavigationController

/**
 *  第一次使用这个类的时候会调用
 */
+ (void)initialize {
    // 设置导航栏的背景颜色 或者下面那种方法（全局设置的方法）
    // 这个方法直接拿到当前的导航栏进行设置
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    // 只有是YCNavigationController 这个类的时候  全局背景图片- --才会有效。下面可以指定类型
    if (YCIOS9) {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[YCNavigationController class] ]];
        [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    }else {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[YCNavigationController class], nil];
        [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //    YCLog(@"------------%lu---",(unsigned long)self.childViewControllers.count);
    // 这里第一次push的时候，也是程序开始的时候，这个时候，self.childViewControllers.count = 0,
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(70, 30);
        // 按钮内部的所有内容靠左边对齐：UIControl的属性，或者使用[button sizeToFit];也行，这个是控件大小包裹着内容，等于内容大小
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        // 隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这里将父类的push 放在后面，是为了让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
