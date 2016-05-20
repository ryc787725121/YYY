//
//  YCRecommendUser.h
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
// 推荐右侧用户的模型

#import <Foundation/Foundation.h>

@interface YCRecommendUser : NSObject
/**
 header = http://wimg.spriteapp.cn/profile/large/2016/01/29/56aad58c6472c_mini.jpg,
	gender = 1,
	is_vip = 0,
	fans_count = 5210,
	tiezi_count = 37,
	is_follow = 0,
	screen_name = 一和一传媒
 */

/** 头像 */
@property (nonatomic, copy) NSString *header;

/** 粉丝数（有多少人关注这个用户） */
@property (nonatomic, assign) NSInteger fans_count;

/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;

@end
