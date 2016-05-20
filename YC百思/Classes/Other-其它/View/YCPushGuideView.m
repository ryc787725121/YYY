//
//  YCPushGuideView.m
//  YC百思
//
//  Created by 任任义春 on 16/5/20.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCPushGuideView.h"

@implementation YCPushGuideView

+ (instancetype)guideView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject ];
}


/**
 *  关闭引导图 
 */
- (IBAction)close {
    
    [self removeFromSuperview];
}

@end
