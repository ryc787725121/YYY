//
//  YCRecommendCategoryCell.h
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
// 推荐左侧的cell

#import <UIKit/UIKit.h>

@class YCRecommendCategory;
@interface YCRecommendCategoryCell : UITableViewCell

/** 分类模型数据 */
@property (nonatomic, strong) YCRecommendCategory *category;

@end
