//
//  ViewController.m
//  24Architecture
//
//  Created by ZhouYuan on 17/10/15.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import "ViewController.h"
#import "Manager.h"
#import "MVPController.h"
#import "MVVMController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [[Manager shareInstance] beginPrintTask];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        [self showMVP];
        [self showMVVM];
    });
    
}

//Presenter
- (void)showMVP
{
    MVPController *vc = [[MVPController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

//MVVMViewModel
- (void)showMVVM
{
    MVVMController *vc = [[MVVMController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
