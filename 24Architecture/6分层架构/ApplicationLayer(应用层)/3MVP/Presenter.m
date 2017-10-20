//
//  Presenter.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//  业务逻辑写在Presenter中, Controller与业务逻辑解耦
//  MVP和MVC属于应用层架构

/**
 Presenter: 集中写业务逻辑
 Controller: 
     1.创建MVP
     2.P与MV的关系
     3.代理
     4.开始业务逻辑
 */
#import "Presenter.h"

@interface Presenter()<MVPViewDelegate>

@end

@implementation Presenter

//4.开始业务逻辑
- (void)printTask
{
    NSLog(@"%s",__func__);
    
    NSString *printContent = self.mvpModel.content;
    [self.mvpView printOnView:printContent];
}

#pragma mark - 3.MVPViewDelegate
- (void)onPrintBtnClick
{
    NSLog(@"%s",__func__);

    int random = arc4random()%10;
    self.mvpModel.content = [NSString stringWithFormat:@"content %d", random];

    [self.mvpView printOnView:self.mvpModel.content];
}

@end
