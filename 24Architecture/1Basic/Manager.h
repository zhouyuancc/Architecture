//
//  Manager.h
//  24Architecture
//
//  Created by ZhouYuan on 17/10/15.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

+ (instancetype)shareInstance;

- (void)celebratePrintDone;

- (void)beginPrintTask;

@end
