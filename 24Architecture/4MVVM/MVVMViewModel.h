//
//  MVVMViewModel.h
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMPaper.h"

@interface MVVMViewModel : NSObject

@property (nonatomic,copy) NSString *contentStr;

- (void)setWithModel:(MVVMPaper *)paper;

- (void)onPrintClickInMVVMViewModel;

@end
