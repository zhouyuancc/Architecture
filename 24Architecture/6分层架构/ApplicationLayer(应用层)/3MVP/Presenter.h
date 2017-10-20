//
//  Presenter.h
//  24Architecture
//
//  Created by ZhouYuan on 17/10/18.
//  Copyright © 2017年 ZhouYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPView.h"
#import "MVPModel.h"

@interface Presenter : NSObject

@property (nonatomic,strong) MVPView *mvpView;
@property (nonatomic,strong) MVPModel *mvpModel;

- (void)printTask;

@end
