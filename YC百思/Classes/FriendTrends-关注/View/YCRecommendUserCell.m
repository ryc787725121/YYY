
//
//  YCRecommendUserCell.m
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCRecommendUserCell.h"
#import "YCRecommendUser.h"
#import "UIImageView+WebCache.h"
@interface YCRecommendUserCell ()
/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
/** 粉丝数（有多少人关注这个用户） */
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end


@implementation YCRecommendUserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(YCRecommendUser *)user {
    _user = user;
    self.screenNameLabel.text = user.screen_name;
    
    NSString *fansCount = nil;
    
    if (user.fans_count < 10000) {
        fansCount = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    }else { // 大于等于一万
        fansCount = [NSString stringWithFormat:@"%.1ld万人关注",user.fans_count / 10000];
    }

    
    self.fansCountLabel.text = fansCount;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    

}

@end
