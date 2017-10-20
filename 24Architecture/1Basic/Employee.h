//
//  Employee.h
//  24Architecture
//
//  Created by ZhouYuan on 17/10/15.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EmployeeDelegate <NSObject>

@optional
- (void)printJobDone;

@end

@interface Employee : NSObject

+ (instancetype)shareInstance;

- (void)doPrintJob;

@property (nonatomic,weak) id<EmployeeDelegate> delegate;

@end
