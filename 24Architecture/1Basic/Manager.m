//
//  Manager.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/15.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "Manager.h"
#import "Employee.h"
#import "PrintNotification.h"

@interface Manager()<EmployeeDelegate>

@end

@implementation Manager

+ (instancetype)shareInstance
{
    static Manager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Manager alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(celebratePrintDone) name:Notif_PrintTaskDone object:nil];
    }
    return self;
}

- (void)celebratePrintDone
{
    NSLog(@"%s celebrate Print Done",__func__);
}

- (void)beginPrintTask
{
    NSLog(@"%s begin Print Task",__func__);
    
    //第一种耦合方式
    //Manager与Employee互相都知道对方的存在
//    [[Employee shareInstance] doPrintJob];
    
    //第二种耦合方式:代理
    //Manager知道Employee, 但Employee不知道Manager的存在
//    [Employee shareInstance].delegate = self;
//    [[Employee shareInstance] doPrintJob];
    
    //第三种耦合方式:通知
    //Manager与Employee互相不知道对方的存在,耦合都在PrintNotification.h中
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_BeginPrintTask object:nil];    
}

@end
