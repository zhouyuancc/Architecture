//
//  ServiceFactory.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/20.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "ServiceFactory.h"

@implementation ServiceFactory

+ (instancetype)shareInstance
{
    static ServiceFactory *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ServiceFactory alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.printService = [[PrintService alloc] init];
    }
    
    return self;
}

@end
