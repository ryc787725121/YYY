//
//  YCTextField.m
//  YC百思
//
//  Created by 任任义春 on 16/5/18.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

/**
    查找内部的隐藏_变量：需要用到运行时（Runtime）: 需要导入#import <objc/runtime.h>
    * 苹果官方一套C语言库
    * 能做很多底层操作（比如访问隐藏的一些成员变量、成员方法...）
 
 */
#import "YCTextField.h"
#import <objc/runtime.h>



static NSString *const YCPlaceholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation YCTextField

+ (void)initialize {
    
   
    
 
    
    
}

/**
 *  获取一个类的属性
 */
- (void)getProperties {
    //2. 获取类中的属性
        unsigned int count = 0;
    
        objc_property_t *properties = class_copyPropertyList([UITextField class], &count);
    
        for (int i = 0;i < count ; i++) {
    
            // 取出属性
            objc_property_t property = properties[i];
    
            // 打印
            YCLog(@"%s",property_getName(property));
    
        }
        
        // 释放
        free(properties);
}


/**
 *  获取一个类的成员变量
 */
- (void)getIvars {
    // 1. 获取一个类中的成员变量
        unsigned int count = 0;
        // 访问类成员变量列表 --第二个参数：返回多少个（所以需要定义一个变量，将变量地址给它，作为记录）
        Ivar *ivars = class_copyIvarList([UITextField class], &count);
    
        for (int i = 0; i < count; i ++) {
            // 取出成员变量
            Ivar ivar = *(ivars + i);// 或者
    //        Ivar ivar = ivars[i];
    
            // 打印成员变量名字
            YCLog(@"%s  <---- >  %s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    
        }
        
        // 释放
        free(ivars);
}
- (void)awakeFromNib {

//    UILabel *placeholderLabel = [self valueForKeyPath:@"_placeholderLabel"];
//    placeholderLabel.textColor = [UIColor grayColor]; //或者下面的方法
//
    // 修改占位文字颜色
//    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    // 设置光标颜色
    self.tintColor = self.textColor;
    
    // 不成为第一响应者
    [self resignFirstResponder];
    
    // 设置输入框右边的清除文本按钮 -- 通过runtime找到隐藏的属性，然后利用KVC就行赋值设置
    /*
    UIButton *button = [self valueForKey:@"_clearButton"];

    [button setImage:[UIImage imageNamed:@"cellFollowDisableIcon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"cellFollowDisableIcon"] forState:UIControlStateHighlighted];
    button.contentMode = UIViewContentModeScaleAspectFill;
    button.frame = CGRectMake(0, 0, 30, 30);
    button.backgroundColor = [UIColor redColor];
     */
    
    
    
    
    

}

// 设置聚焦时，文字为白色，不聚焦时为亮灰色
/**
 *  当文本框聚焦时就会调用
 *
 */
- (BOOL)becomeFirstResponder {
    [self setValue:self.textColor forKeyPath:YCPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}
/**
 *  当文本框失去焦点时就会调用
 *
 */
- (BOOL)resignFirstResponder {
    [self setValue:[UIColor grayColor] forKeyPath:YCPlaceholderColorKeyPath];

   
    return [super resignFirstResponder];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setValue:placeholderColor forKeyPath:YCPlaceholderColorKeyPath];
}

@end
