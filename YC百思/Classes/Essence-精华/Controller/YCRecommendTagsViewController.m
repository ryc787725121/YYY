//
//  YCRecommendTagsViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/15.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCRecommendTagsViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "YCRecommendTag.h"
#import "YCRecommendTagCell.h"
@interface YCRecommendTagsViewController ()

/** 标签数据 */
@property (nonatomic, strong) NSArray *tags;

@end

@implementation YCRecommendTagsViewController

static NSString *const YCTagsId = @"tag";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化控件
    [self setupTableView];
    
    // 加载标签数据
    [self loadTags];
    
}

#pragma mark --- 初始化TableView
- (void)setupTableView {
    self.title = @"推荐标签";
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"YCRecommendTagCell" bundle:nil] forCellReuseIdentifier:YCTagsId];
    
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = YCGlobalBg;

}
#pragma mark --- 加载标签数据
- (void)loadTags {

    // 显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"c"] = @"topic";
    params[@"action"] = @"sub";
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        self.tags = [YCRecommendTag objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
    }];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:YCTagsId forIndexPath:indexPath];

    cell.recommendTag = self.tags[indexPath.row];
    
    return cell;
}

@end
