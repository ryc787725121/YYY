//
//  UIBarButtonItem+YCExtension.h
//  YC百思
//
//  Created by 任任义春 on 16/5/12.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YCExtension)

/**
 *  返回一个UIBarButtonItem
 */
+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
