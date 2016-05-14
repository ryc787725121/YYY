//
//  UIView+YCExtensiom.h
//  YC百思
//
//  Created by 任任义春 on 16/5/12.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  UI控件的分类

#import <UIKit/UIKit.h>

@interface UIView (YCExtensiom)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

/** 在分类中声明@property，只会生成方法的声明（也就是set 和 get），不会生成方法的实现和带有_下划线的成员变量*/
@end
