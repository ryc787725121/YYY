//
//  XMGTopicCell.m
//  01-百思不得姐
//
//  Created by xiaomage on 15/7/27.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGTopicCell.h"
#import "XMGTopic.h"
#import "UIImageView+WebCache.h"
#import "YCPoticPictureView.h"
@interface XMGTopicCell()
/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
/** 顶 */
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
/** 踩 */
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
/** 分享 */
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
/** 评论 */
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/** 新浪加v用户 */
@property (weak, nonatomic) IBOutlet UIImageView *sinaVViem;

/**  帖子的文字内容 */
@property (weak, nonatomic) IBOutlet UILabel *text_label;

/** 图片帖子中间的内容 */
@property (nonatomic, strong) YCPoticPictureView *pictureView;


@end

@implementation XMGTopicCell
/** 图片帖子中间的内容 */
- (YCPoticPictureView *)pictureView {
    if (!_pictureView) {
        _pictureView = [YCPoticPictureView pictureView];
        [self.contentView addSubview:_pictureView];
    }

    return _pictureView;
}


- (void)awakeFromNib
{
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}

/**
 今年
 今天
 1分钟内
 刚刚
 1小时内
 xx分钟前
 其他
 xx小时前
 昨天
 昨天 18:56:34
 其他
 06-23 19:56:23
 
 非今年
 2014-05-08 18:45:30
 */

- (void)setTopic:(XMGTopic *)topic
{
    _topic = topic;
    
    // 随机产生0或1
//    topic.sina_v = arc4random_uniform(100) % 2;
    
     // 新浪加V
    self.sinaVViem.hidden = !topic.sina_v;
    
    
    // 设置头像
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    // 设置名字
    self.nameLabel.text = topic.name;
    
    
   // 设置贴的的发布时间
    self.createTimeLabel.text = topic.create_time;
    // 设置按钮文字
    [self setupButtonTitle:self.dingButton count:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiButton count:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.shareButton count:topic.repost placeholder:@"分享"];
    [self setupButtonTitle:self.commentButton count:topic.comment placeholder:@"评论"];
    
    
    // 设置帖子的文字内容
    self.text_label.text = topic.text;
    
    
    // 根据帖子类型，添加对应的内容到cell的中间
    if (topic.type == YCTopicTypePicture) { // 图片帖子
        
        self.pictureView.topic = topic;
        self.pictureView.frame = topic.pictureViewFrame;
    }
    
    
    
}

/**
 * 设置底部按钮文字
 */
- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder
{
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame
{ 
    
    frame.origin.x = YCTopicCellMargin;
    frame.size.width -= 2 * YCTopicCellMargin;
    frame.size.height -= YCTopicCellMargin;
    frame.origin.y += YCTopicCellMargin;
    
    [super setFrame:frame];
}




@end
