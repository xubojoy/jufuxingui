//
//  AppDelegate.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTViewController.h"
#import "LLLockViewController.h"
#import "UserModel.h"
#import "LocalCache.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong ,nonatomic) NTViewController * viewController;
@property (strong,nonatomic) LocalCache * localcache;
@property (strong, nonatomic) UserModel * user;
// 手势解锁相关
@property (strong, nonatomic) LLLockViewController* lockVc; // 添加解锁界面
- (void)showLLLockViewController:(LLLockViewType)type;
@end

