//
//  YCRecommendCategory.h
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  推荐关注左边的数据模型

#import <Foundation/Foundation.h>

@interface YCRecommendCategory : NSObject

/*
 "id": "9",
 "name": "电台",
 "count": "78"
 */

/** id*/
@property (nonatomic, assign) NSInteger ID;
/** 名字 */
@property (nonatomic, copy) NSString *name;
/** 总数 */
@property (nonatomic, assign) NSInteger count;



/** 这个类别对应的用户数据 */
@property (nonatomic, strong) NSMutableArray *users;

/** 总数 */
@property (nonatomic, assign) NSInteger total;

/** 当前页码   */
@property (nonatomic, assign) NSInteger currentPage;

@end
