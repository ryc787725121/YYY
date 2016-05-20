//
//  YCRecommendUserCell.h
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  推荐右侧的cell

#import <UIKit/UIKit.h>

@class YCRecommendUser;
@interface YCRecommendUserCell : UITableViewCell

/** 用户模型 */
@property (nonatomic, strong) YCRecommendUser *user;

@end
