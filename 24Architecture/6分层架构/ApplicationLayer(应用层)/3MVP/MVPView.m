//
//  MVPView.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "MVPView.h"

@interface MVPView ()

@property (nonatomic,strong) UILabel *lblContent;
@property (nonatomic,strong) UIButton *button;

@end

@implementation MVPView

- (instancetype)init
{
    NSLog(@"%s",__func__);

    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        
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

    if ([self.delegate respondsToSelector:@selector(onPrintBtnClick)]) {
        [self.delegate onPrintBtnClick];
    }
}

- (void)printOnView:(NSString *)content
{
    NSLog(@"%s",__func__);
    
    self.lblContent.text = content;
}

@end
