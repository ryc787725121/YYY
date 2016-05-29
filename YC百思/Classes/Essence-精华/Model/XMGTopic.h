//
//  XMGTopic.h
//  01-百思不得姐
//
//  Created by xiaomage on 15/7/27.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//  帖子

#import <UIKit/UIKit.h>

@interface XMGTopic : NSObject
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 头像的URL */
@property (nonatomic, copy) NSString *profile_image;
/** 发帖时间 */
@property (nonatomic, copy) NSString *create_time;
/** 文字内容 */
@property (nonatomic, copy) NSString *text;
/** 顶的数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩的数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发的数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论的数量 */
@property (nonatomic, assign) NSInteger comment;

/** 是否为新浪加v用户 */
@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;

/** 图片的宽度 */
@property (nonatomic, assign) CGFloat width;
/** 图片的高度 */
@property (nonatomic, assign) CGFloat height;
/** 小图片的URL */
@property (nonatomic, copy) NSString *small_image;
/** 大图片的URL */
@property (nonatomic, copy) NSString *large_image;
/** 中图片的URL */
@property (nonatomic, copy) NSString *middle_image;

/** 帖子的类型 */
@property (nonatomic, assign) YCTopicType type;

/******* 额外的属性 *******/
/** cell 的高度 */
/** 这里写了readonly，也就意味着系统不会给你生成_的成员变量了，所以在get方法中的_的成员变量我们自己要写了一个 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/** 图片控件的frame */
@property (nonatomic, assign, readonly) CGRect  pictureViewFrame;

/** 图片是否太大 */
@property (nonatomic, assign,getter=isBigPicture) BOOL bigPicture;


@end
