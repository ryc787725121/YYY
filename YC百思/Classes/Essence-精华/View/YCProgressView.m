//
//  YCProgressView.m
//  YC百思
//
//  Created by 任任义春 on 16/5/28.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCProgressView.h"

@implementation YCProgressView

- (void)awakeFromNib
{        // 设置圆角
        self.roundedCorners = 5;
        self.progressLabel.textColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {

    [super setProgress:progress animated:animated];

    NSString *text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
    self.progressLabel.text = text;

}
@end
