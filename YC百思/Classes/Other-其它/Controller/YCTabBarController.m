//
//  YCTabBarController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCTabBarController.h"
#import "YCEssenceViewController.h"
#import "YCNewViewController.h"
#import "YCFriendTrendsViewController.h"
#import "YCMeViewController.h"
#import "YCTabBar.h"
#import "YCNavigationController.h"

/* 颜色说明
   [UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
    颜色：
    *24bit颜色： R G B        --- 3  x  8 = 24 bit
    #ff 00 00  ：也是 24bit颜色 ：（红色）    255：#ff 转成10进制也就是255
    #000000 ： 黑色
    #ffffff :  白色
    灰色的特点：RGB一样 ，比如： #111111  #999999
 
    *32bit颜色： ARGB
    #ff(alpha) 00 00 ff
 
    计算图片所占内存的大小： 比如 1024x1024 像素的图片  32bit颜色
        --> 1024x1024x32/8 == 1024x1024x4  (图片所占的字节数)
 */


@implementation YCTabBarController

/**
 *  一次性的设置，写在这里最好，只会调用一次
 */
+ (void)initialize {

    // 通过appearance统一设置所有UITabBarItem的文字属性 --- 后面带有UI_APPEARANCE_SELECTOR 的方法都可以通过appearance 对象来统一设置
    NSMutableDictionary *atts = [NSMutableDictionary dictionary];
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    atts[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *SelectedAtts = [NSMutableDictionary dictionary];
    SelectedAtts[NSFontAttributeName] = atts[NSFontAttributeName];
    SelectedAtts[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    [item setTitleTextAttributes:SelectedAtts forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 往里面添加子控制器
    [self setupChildVc:[[YCEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupChildVc:[[YCNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupChildVc:[[YCFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupChildVc:[[YCMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    //imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 生成原始的图片，不要渲染 或者在Assets里面设置图片
    
   
    
//    NSLog(@"-----%@",self.tabBar.subviews); //在viewDidLoad 方法中只能拿到我们刚才添加的按钮
    
    
    
    // 利用KVC更换tabBar --更换成自己的：可以点击查看视图按钮，;查看是不是自己的，之后在自己内部的layoutSubviews 方法中布局自己的控件位置
    [self setValue:[[YCTabBar alloc] init] forKeyPath:@"tabBar"];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"-----%@",self.tabBar.subviews);  //----想要更改内部的item的位置：只能自定义了
}

/**
 *  初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    // 设置文字和图片
    vc.navigationItem.title =  title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    vc.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0]; // 这里设置背景色，会一口气创建4个控制器，不合理，所以，不要设置view的背景色（懒加载）
   
    // 包装一个导航控制器，添加导航控制器为tabBarControler的子控制器
    YCNavigationController *nav = [[YCNavigationController alloc] initWithRootViewController:vc];
  
    // 添加子控制器
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
