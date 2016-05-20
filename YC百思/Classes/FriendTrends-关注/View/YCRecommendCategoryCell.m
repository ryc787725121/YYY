//
//  YCRecommendCategoryCell.m
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCRecommendCategoryCell.h"
#import "YCRecommendCategory.h"

@interface YCRecommendCategoryCell ()
/**
 *  选中时左侧的指示器
 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation YCRecommendCategoryCell

- (void)awakeFromNib {
    self.backgroundColor = YCRGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = YCRGBColor(219, 21, 26);    
}

- (void)setCategory:(YCRecommendCategory *)category {
    _category = category;
    self.textLabel.text = category.name;

}
- (void)layoutSubviews {
    [super layoutSubviews];

    // 重新调整内部textLabel的frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
    
}


/**
 * 可以在这个方法中监听cell的选中和取消选中
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
//    YCLog(@"---%@---%d",self.category.name,selected);
    
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor :YCRGBColor(78, 78, 78) ;
    
}

@end
