//
//  YCRecommendViewController.m
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCRecommendViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "YCRecommendCategory.h"
#import "MJExtension.h"
#import "YCRecommendCategoryCell.h"
#import "YCRecommendUserCell.h"
#import "YCRecommendUser.h"
#import "MJRefresh.h"

#define YCSelectedCategpry self.categorys[self.leftTableView.indexPathForSelectedRow.row]

@interface YCRecommendViewController () <UITableViewDataSource,UITableViewDelegate>

/** 左边类别数据 */
@property (nonatomic, strong) NSArray *categorys;


/** 左侧的类别tableView */
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
/** 右侧用户的tableView */
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

/** 请求参数 */
@property (nonatomic, strong) NSMutableDictionary *params;


/** AFN的请求管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;


@end

/*  存在的问题:一个控制器中有2个tableView表格、左侧是分类，右侧则显示分类对应的用户数，
 1.目前只能显示1页数据 --->
 2.重复发送请求  ---> 我们只需要将一个类别对应的用户数据（也就是右侧的用户数组）添加到我们分类模型类中的专门用来存右侧用户的数组中，然后，每次点击分类时，我们就先从分类中的用户数组是否有数据，有：刷新表格、 没：去请求数据在添加到分类中的用户数组中。
 3.如果网速慢带来的一些细节问题，显示的数据是上一次类型的的数据 --->
 */

@implementation YCRecommendViewController

static NSString *const YCCategoryId = @"category";
static NSString *const YCUserId = @"user";

#pragma mark --- 懒加载
- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }

    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控件的初始化
    [self setupTableView];
    
    // 集成刷新控件
    [self setupRefresh];
   
    // 加载左侧的类别数据
    [self loadCategories];
}

#pragma mark --- 加载左侧的分类数据
/**
 *  加载左侧的分类数据
 */
- (void)loadCategories {
    // 显示指示器
    [SVProgressHUD show];
    
    // 发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params  success:^(NSURLSessionDataTask *task, id responseObject) {
        // 隐藏指示器
        [SVProgressHUD dismiss];
        
        // 服务器返回的JSON数据
        //        YCLog(@"----%@",responseObject);
        self.categorys = [YCRecommendCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.leftTableView reloadData];
        
        // 默认选中首行
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        // 让用户表格进入下拉刷新状态
        [self.rightTableView.header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
    
}

#pragma mark --- 初始化TabelView
/**
 *  初始化控件
 */
- (void)setupTableView {
    // 设置标题
    self.title = @"推荐关注";
    
    // 注册cell
    [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YCRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:YCCategoryId];
    // 注册cell
    [self.rightTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YCRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:YCUserId];
    
    // 设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.rightTableView.contentInset = self.leftTableView.contentInset;
    self.rightTableView.rowHeight = 70;
    
    // 设置背景色
    self.view.backgroundColor = YCGlobalBg;
    
}
#pragma mark --- 集成刷新控件
/**
 *  集成刷新控件
 */
- (void)setupRefresh {
    
    self.rightTableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    
    self.rightTableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    self.rightTableView.footer.hidden = YES;
    
}
#pragma mark --- 下拉刷新数据
- (void)loadNewUsers {
    

    
    YCRecommendCategory *c = YCSelectedCategpry;
    // 设置当前页码等于1
    c.currentPage = 1;
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(c.ID);
    params[@"page"] = @(c.currentPage);
    self.params = params;

    
    // 发送请求加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
      
        
//        YCLog(@"---%@",responseObject);
        // 1.字典数组 -> 模型数组
        NSArray *users = [YCRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 1.1清楚以前的所有旧数据
        [c.users removeAllObjects];
        
        // 2.添加到当前类别对应的用户数组中
        [c.users addObjectsFromArray:users];
        
        
        // 3.保存总数
        c.total =  [responseObject[@"total"] integerValue];
        
        
        // 如果请求的参数不同，那么久直接返回,这里放在是将回来的数据都保存起来
        if (self.params != params) return ;
        
        // 4.刷新后侧表格
        [self.rightTableView reloadData];
        
        // 5.结束刷新
        [self.rightTableView.header endRefreshing];
        
        // 6.让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 如果请求的参数不同，那么久直接返回
        if (self.params != params) return ;
        
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        // .结束刷新
        [self.rightTableView.header endRefreshing];
    }];
    
        
}
#pragma mark --- 上啦加载更多数据
/**
 *  加载用户数据
 */
- (void)loadMoreUsers {
    
    YCRecommendCategory *category = YCSelectedCategpry;
    
    // 发送请求加载右侧的数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.ID);
    
    params[@"page"] = @(++category.currentPage);
    
    self.params = params;
    
    [self.manager  GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        

//        YCLog(@"-------%@",responseObject);
        // 1.字典数组 -> 模型数组
        NSArray *users = [YCRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 2.添加到当前类别对应的用户数组中
        [category.users addObjectsFromArray:users];
        
        // 如果请求的参数不同，那么久直接返回,这里放在是将回来的数据都保存起来
        if (self.params != params) return ;
        
        // 3.刷新后侧表格
        [self.rightTableView reloadData];
        
        // 4.让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        // 如果请求的参数不同，那么久直接返回
        if (self.params != params) return ;
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        // 让底部刷新控件结束
        [self.rightTableView.footer endRefreshing];
    }];
    
}

#pragma mark --- 查看底部刷新控件的状态
/**
 *  监测footer刷新控件的状态
 */
- (void)checkFooterState {
    YCRecommendCategory *category = YCSelectedCategpry;
    // 每次刷新右边数据时，都控制footer显示或者隐藏
    self.rightTableView.footer.hidden = (category.users.count  == 0 );
    if (category.users.count == category.total) { //全部加载完毕
        [self.rightTableView.footer noticeNoMoreData];
    }else {
        [self.rightTableView.footer endRefreshing];
    }
}

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 判断 左侧类别表格
    if (tableView == self.leftTableView) return self.categorys.count;
    
    // 右侧用户的表格
    // 左边被选中的类别模型
    //        YCRecommendCategory *category = self.categorys[self.leftTableView.indexPathForSelectedRow.row];
    // 让底部控件结束刷新 -- 监测footer的状态
    [self checkFooterState];
    
    return [YCSelectedCategpry users].count;
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) { // 左侧类别表格
        YCRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:YCCategoryId];
        
        cell.category = self.categorys[indexPath.row];
        return cell;
        
    }else { // 右侧用户的表格
        YCRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:YCUserId];
        
        cell.user = [YCSelectedCategpry users][indexPath.row];
        return cell;
        
    }
    
}

#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 结束刷新
    [self.rightTableView.header endRefreshing];
     [self.rightTableView.footer endRefreshing];
    
    YCRecommendCategory *c = self.categorys[indexPath.row];
    YCLog(@"%@",c.name);
    
    if (c.users.count) { // 显示曾经的数据
        
        [self.rightTableView reloadData];
        
        
    }else { // 请求新的数据
        // 赶紧刷新表格的目的：马上显示当前的category的用户数据，不让用户看见上一个category的残留数据
        [self.rightTableView reloadData];
        
        // 进入下拉刷新状态
        [self.rightTableView.header beginRefreshing];
    }
    
}

#pragma mark --- 控制器的销毁
- (void)dealloc {
    // 停止所有的操作
    [self.manager.operationQueue cancelAllOperations];

}




@end
