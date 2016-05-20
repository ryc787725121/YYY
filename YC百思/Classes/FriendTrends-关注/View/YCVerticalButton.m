//
//  YCVerticalButton.m
//  YC百思
//
//  Created by 任任义春 on 16/5/18.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCVerticalButton.h"

@implementation YCVerticalButton

// 代码创建加载
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
// xib 创建加载
- (void)awakeFromNib {
    [self setup];
}

- (void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews]; 

    // 调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.imageView.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
}

@end
