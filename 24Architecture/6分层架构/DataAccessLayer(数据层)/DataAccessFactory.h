//
//  DataAccessFactory.h
//  24Architecture
//
//  Created by ZhouYuan on 17/10/20.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrintDataAccessObject.h"

@interface DataAccessFactory : NSObject

+ (instancetype)shareInstance;

@property (nonatomic,strong) PrintDataAccessObject *printDAO;

@end
