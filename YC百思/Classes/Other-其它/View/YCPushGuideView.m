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

+ (void)show
{
    NSString *key = @"CFBundleShortVersionString";
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        YCPushGuideView *guideView = [YCPushGuideView guideView];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
