//
//  PrintService.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/20.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "PrintService.h"
#import "DataAccessFactory.h"

@implementation PrintService

- (MVPModel *)getPrintModel
{
    //创建Model
    MVPModel *model = [[DataAccessFactory shareInstance].printDAO getPrintModel];
    
    return model;
}

@end
