//
//  Employee.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/15.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "Employee.h"
//#import "Manager.h"
#import "PrintNotification.h"

@implementation Employee

+ (instancetype)shareInstance
{
    static Employee *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Employee alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPrintJob) name:Notif_BeginPrintTask object:nil];
    }
    return self;
}

- (void)doPrintJob
{
    NSLog(@"%s do Print Job",__func__);
    
    //第一种耦合方式
    //Manager与Employee互相都知道对方的存在
//    [[Manager shareInstance] celebratePrintDone];
    
    //第二种耦合方式:代理
    //Manager知道Employee, 但Employee不知道Manager的存在
//    if ([self.delegate respondsToSelector:@selector(printJobDone)]) {
//        [self.delegate printJobDone];
//    }
    
    //第三种耦合方式:通知
    //Manager与Employee互相不知道对方的存在,耦合都在PrintNotification.h中
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_PrintTaskDone object:nil];

}


@end
