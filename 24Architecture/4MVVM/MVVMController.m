//
//  MVVMController.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "MVVMController.h"
#import "MVVMPaper.h"
#import "MVVMView.h"
#import "MVVMViewModel.h"

@interface MVVMController ()

@property (nonatomic,strong) MVVMPaper *paper;
@property (nonatomic,strong) MVVMView *mvvmView;
@property (nonatomic,strong) MVVMViewModel *mvvmViewModel;

@end

@implementation MVVMController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__func__);
    
    self.view.backgroundColor = [UIColor yellowColor];

    //1.创建M VM V 
    //1.1.创建Model
    self.paper = [[MVVMPaper alloc] init];
    self.paper.content = @"content";
    
    //1.2.创建VM
    self.mvvmViewModel = [[MVVMViewModel alloc] init];
    
    //3.按钮点击事件
    //1.3.创建View, 其中有view上的按钮点击事件, 点击修改
    //MVVMViewModel的NSString *contentStr属性, view上的label修改文字
    self.mvvmView = [[MVVMView alloc] init];
    self.mvvmView.frame = self.view.bounds;
    [self.view addSubview:self.mvvmView];
    
    //2.绑定
    //2.1.KVO监听VM里的属性值
    //MVVMViewModel的NSString *contentStr属性, view上的label修改文字
    [self.mvvmView setWithViewModel:self.mvvmViewModel];
    
    //2.2.KVO将 VM里的属性值 回调给V
    //把Model的content值 赋给
    //MVVMViewModel的NSString *contentStr属性, view上的label修改文字
    [self.mvvmViewModel setWithModel:self.paper];
}

@end
