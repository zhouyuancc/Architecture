//
//  MVPController.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "MVPController.h"
#import "Presenter.h"
#import "MVPView.h"
#import "MVPModel.h"

#import "ServiceFactory.h"

@interface MVPController ()

@property (nonatomic,strong) Presenter *presenter;
@property (nonatomic,strong) MVPView *mvpView;
@property (nonatomic,strong) MVPModel *mvpModel;

@end

@implementation MVPController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__func__);

    //1.创建MVP
    //创建Presenter
    self.presenter = [[Presenter alloc] init];
    
    //创建View
    self.mvpView = [[MVPView alloc] init];
    self.mvpView.frame = self.view.bounds;
    [self.view addSubview:self.mvpView];
    
    //创建Model 方法一
//    self.mvpModel = [[MVPModel alloc] init];
//    self.mvpModel.content = @"content";
    
    //创建Model 方法二
    //从serviceLayer获取Model
    self.mvpModel = [[ServiceFactory shareInstance].printService getPrintModel];
    
    //2.Presenter处理耦合的类
    self.presenter.mvpView = self.mvpView;
    self.presenter.mvpModel = self.mvpModel;
    
    //3.代理
    self.mvpView.delegate = self.presenter;
    
    //4.开始业务逻辑
    [self.presenter printTask];
}


@end
