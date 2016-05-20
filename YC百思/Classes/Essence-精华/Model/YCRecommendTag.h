//
//  YCRecommendTag.h
//  YC百思
//
//  Created by 任任义春 on 16/5/15.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  推荐标签模型

#import <Foundation/Foundation.h>

@interface YCRecommendTag : NSObject

/**
 image_list = http://img.spriteapp.cn/ugc/2016/03/10/092924_69853.jpg,
	theme_id = 3096,
	theme_name = 百思红人,
	is_sub = 0,
	is_default = 0,
	sub_number = 112463
 
 */


/** 图片 */
@property (nonatomic, copy) NSString *image_list;

/** 名字 */
@property (nonatomic, copy) NSString *theme_name;

/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;


@end
