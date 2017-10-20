//
//  PrintDataAccessObject.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/20.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "PrintDataAccessObject.h"

@implementation PrintDataAccessObject

- (MVPModel *)getPrintModel
{
    //创建Model
    MVPModel *model = [[MVPModel alloc] init];
    model.content = @"content";
    
    return model;
}

@end
