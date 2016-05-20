//
//  YCRecommendTagCell.m
//  YC百思
//
//  Created by 任任义春 on 16/5/15.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCRecommendTagCell.h"
#import "YCRecommendTag.h"
#import "UIImageView+WebCache.h"
@interface YCRecommendTagCell ()
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
/** 名字 */
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
/** 订阅数 */
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;


@end

@implementation YCRecommendTagCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setRecommendTag:(YCRecommendTag *)recommendTag {
    
    _recommendTag = recommendTag;
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.themeNameLabel.text = recommendTag.theme_name;
    
    NSString *subNumber = nil;
    
    if (recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    }else { // 大于等于一万
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅",recommendTag.sub_number / 10000.0];
    }
    
    self.subNumberLabel.text = subNumber;

}

// 调整cell 左下右，间距
- (void)setFrame:(CGRect)frame {
    frame.origin.x = 5;
    frame.size.width -= 2* frame.origin.x;
    frame.size.height -=1;
    [super setFrame:frame];
}

@end
