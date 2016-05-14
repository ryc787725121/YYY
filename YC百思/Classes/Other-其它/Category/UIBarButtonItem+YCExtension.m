
//
//  UIBarButtonItem+YCExtension.m
//  YC百思
//
//  Created by 任任义春 on 16/5/12.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "UIBarButtonItem+YCExtension.h"

@implementation UIBarButtonItem (YCExtension)

+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)highImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
@end
