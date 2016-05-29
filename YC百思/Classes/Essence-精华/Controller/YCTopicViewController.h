//
//  YCTopicViewController.h
//  YC百思
//
//  Created by 任任义春 on 16/5/23.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  最基本的控制器

#import <UIKit/UIKit.h>
//typedef enum {
//    YCTopicTypeAll = 1,
//    YCTopicTypePicture = 10,
//    YCTopicTypeWord = 29,
//    YCTopicTypeVoice = 31,
//    YCTopicTypeVideo = 41
//} YCTopicType;  ------>放在了常量类里面了


@interface YCTopicViewController : UITableViewController
/** 帖子类型 ---子类直接去实现就行了*/
//- (NSString *)type;

/** 帖子类型 */
@property (nonatomic, assign) YCTopicType type;
@end
