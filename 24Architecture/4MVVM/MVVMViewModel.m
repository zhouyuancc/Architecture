//
//  MVVMViewModel.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//  业务逻辑写在MVVMViewModel中, Controller与业务逻辑解耦

/**
 MVVM: 双向绑定
 MVVMViewModel: 集中写业务逻辑
 */
#import "MVVMViewModel.h"
#import "KVOController.h"

@interface MVVMViewModel ()

@property (nonatomic,strong) MVVMPaper *paperModel;

@end

@implementation MVVMViewModel

- (instancetype)init
{
    NSLog(@"%s",__func__);

    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setWithModel:(MVVMPaper *)paper
{
    NSLog(@"%s",__func__);

    if (paper != nil&&paper.content != nil) {
        self.paperModel = paper;
        self.contentStr = paper.content;
    }
}

- (void)onPrintClickInMVVMViewModel
{
    NSLog(@"%s",__func__);

    int random = arc4random()%10;
    self.paperModel.content = [NSString stringWithFormat:@"content %d", random];
    
    self.contentStr = self.paperModel.content;
}

@end
