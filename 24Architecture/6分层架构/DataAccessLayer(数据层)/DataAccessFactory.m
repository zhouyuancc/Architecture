//
//  DataAccessFactory.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/20.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "DataAccessFactory.h"

@implementation DataAccessFactory

+ (instancetype)shareInstance
{
    static DataAccessFactory *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataAccessFactory alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.printDAO = [[PrintDataAccessObject alloc] init];
    }
    
    return self;
}

@end
