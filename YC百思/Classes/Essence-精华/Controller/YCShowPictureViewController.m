//
//  YCShowPictureViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/28.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCShowPictureViewController.h"
#import "UIImageView+WebCache.h"
#import "XMGTopic.h"
#import "SVProgressHUD.h"
@interface YCShowPictureViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic)  UIImageView *imageView;

@end

@implementation YCShowPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    // 屏幕尺寸
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    
    // 分情况设置图片的大小
    // 屏幕的宽度  xx  图片的宽度 图片的高度
    CGFloat pictureW = screenW;
    CGFloat pictureH = pictureW * self.topic.height / self.topic.width;
    
    
    if (pictureH > screenH) { // 图片显示高度超过一个屏幕
         // 需要滚动查看
        imageView.frame = CGRectMake(0, 0, pictureW, pictureH);
        self.scrollView.contentSize = CGSizeMake(0, pictureH);
    }else {
        imageView.size = CGSizeMake(pictureW, pictureH);
        imageView.centerY = screenH * 0.5;
    }
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image]];
    
    
}

/**
 *  返回
 */
- (IBAction)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  保存
 */
- (IBAction)save:(id)sender {
    
    // 将图片写入相册
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {

    if (!error) {
        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }else {
    
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }
    
}


/**
 *  转发
 */
- (IBAction)share:(id)sender {
    
    YCLogFunc;
}

@end
