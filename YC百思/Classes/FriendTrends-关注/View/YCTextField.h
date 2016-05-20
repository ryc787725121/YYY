//
//  YCTextField.h
//  YC百思
//
//  Created by 任任义春 on 16/5/18.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  占位控件：更改占位文字为高亮白色，也可以更改文本框右侧的清除按钮

#import <UIKit/UIKit.h>

@interface YCTextField : UITextField

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
