//
//  MVVMView.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "MVVMView.h"
#import "KVOController.h"
#import "MVVMViewModel.h"

@interface MVVMView ()

@property (nonatomic,strong) UILabel *lblContent;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) MVVMViewModel *mvvmViewModel;

@end

@implementation MVVMView

- (instancetype)init
{
    NSLog(@"%s",__func__);
    
    self = [super init];
    if (self) {
                
        //label
        self.lblContent = [[UILabel alloc] init];
        [self addSubview:self.lblContent];
        self.lblContent.frame = CGRectMake(0, 100, 100, 30);
        self.lblContent.textAlignment = NSTextAlignmentCenter;
        self.lblContent.textColor = [UIColor whiteColor];
        
        //button
        self.button = [[UIButton alloc] init];
        self.button.frame = CGRectMake(100, 100, 100, 100);
        self.button.backgroundColor = [UIColor redColor];
        [self.button setTitle:@"Print" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button];
    }
    return self;
}

- (void)onPrintClick
{
    NSLog(@"%s",__func__);
    
    [self.mvvmViewModel onPrintClickInMVVMViewModel];
}

- (void)setWithViewModel:(MVVMViewModel *)mvvmViewModel
{
    NSLog(@"%s",__func__);

    if (mvvmViewModel != nil) {
        
        self.mvvmViewModel = mvvmViewModel;
        
        [self.KVOController observe:mvvmViewModel keyPath:@"contentStr" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
            
            NSString *newContent = change[NSKeyValueChangeNewKey];
            NSLog(@"KVO newContent %@",newContent);
            
            if(![newContent isEqual:[NSNull null]])
            {
                self.lblContent.text = newContent;
                NSLog(@"self.lblContent.text %@",self.lblContent.text);
            }
        }];
    }
}

@end
