//
//  YCRecommendCategory.m
//  YC百思
//
//  Created by 任任义春 on 16/5/14.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCRecommendCategory.h"
#import "MJExtension.h"
@implementation YCRecommendCategory

+ (NSDictionary *)replacedKeyFromPropertyName {


    return @{@"ID" : @"id"};

}

- (NSMutableArray *)users {
    if (_users == nil) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
