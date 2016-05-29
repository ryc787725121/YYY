//
//  YCPoticPictureView.m
//  YC百思
//
//  Created by 任任义春 on 16/5/26.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCPoticPictureView.h"
#import "XMGTopic.h"
#import "UIImageView+WebCache.h"
#import "YCProgressView.h"
#import "YCShowPictureViewController.h"
@interface YCPoticPictureView ()

/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/**
 *  gif标识
 */
@property (weak, nonatomic) IBOutlet UIImageView *gifView;

/**
 *  点击查看全图按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
/**
 *  进度条控件
 */
@property (weak, nonatomic) IBOutlet YCProgressView *progressView;

@end

@implementation YCPoticPictureView

/**
 *  封装view
 */
+ (instancetype)pictureView {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    
    self.autoresizingMask = UIViewAutoresizingNone;    
    // 给图片添加监听器
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPicture)]];
}

- (void)showPicture {
    YCLogFunc;
    
    YCShowPictureViewController *showPicture = [[YCShowPictureViewController alloc] init];
    
    showPicture.topic = self.topic;
    // 这里直接self.presentViewController 是点出不来的，因为这个属性是控制器的，这时，需要拿到窗口的根控制器
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicture animated:YES completion:nil];
    
    
}



/**
 *  重写模型set方法
 */
- (void)setTopic:(XMGTopic *)topic {
    
    _topic = topic;
    
    
    /** 这种判断是最准确的
     在不知道图片的拓展名的情况下，如何知道图片的真实类型？
     1.取出图片数据的第一个字节，就可以判断出图片的真实类型:SDWebImage 就是这样判断的
     */
    
    
    

    
    
    // 设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = NO;
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        
        [self.progressView setProgress:progress animated:NO];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 下载完后进度条隐藏
        self.progressView.hidden = YES;
    }];

    
    // 判断是否为gif
    NSString *extension = topic.large_image.pathExtension; // 直接获取文件的拓展名
    self.gifView.hidden = [extension.lowercaseString isEqualToString:@"gif"];// 先转成小写字母，在进行判断，相等就隐藏
    
    // 判断是否显示“点击查看全图”
    // 当不显示大图的时候，这时要显示图片中的最上部，不能显示全图，否则压缩很难看
    if (topic.bigPicture) { // 大图
        self.seeBigButton.hidden = NO;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        
    }else { // 非大图
    
        self.seeBigButton.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    
    }
    
}

@end
