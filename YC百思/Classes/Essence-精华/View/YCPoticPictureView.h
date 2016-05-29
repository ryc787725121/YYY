//
//  YCPoticPictureView.h
//  YC百思
//
//  Created by 任任义春 on 16/5/26.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  图片帖子中间的那块view

#import <UIKit/UIKit.h>

@class XMGTopic; 
@interface YCPoticPictureView : UIView

/**
 *  封装view
 */
+ (instancetype)pictureView;

/** 帖子数据 */
@property (nonatomic, strong) XMGTopic *topic;

@end
