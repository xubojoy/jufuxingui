//
//  LLLockPassword.h
//  LockSample
//
//  Created by Lugede on 14/11/12.
//  Copyright (c) 2014年 lugede.cn. All rights reserved.
//
//  密码保存模块

#import <Foundation/Foundation.h>

@interface LLLockPassword : NSObject

#pragma mark - 锁屏密码读写
+ (NSString*)loadLockPassword;
+ (NSString*)loadLockPasswordwithusername:(NSString *)username;
+ (void)saveLockPassword:(NSString*)pswd;
+ (void)saveLockPassword:(NSString*)pswd andusername:(NSString *)username;
+ (BOOL)isAlreadyAskedCreateLockPassword;
+ (void)setAlreadyAskedCreateLockPassword;

@end
