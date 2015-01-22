//
//  HAN_HttpRequest.h
//  JuFuXinGui
//
//  Created by mac on 14/12/31.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSHttpRequest.h"
@interface HAN_HttpRequest : NSObject{
    NSMutableDictionary *_requestDict;
    JSHttpRequest * _jsquest;
}
+(instancetype)defaultRequest;
+(void)listenNetworkChange;
-(void)cannelAllRequest;
/*
 注册接口
 */
-(void)getRegistWithNSDictionary:(NSDictionary *)postdic andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 登陆接口
 */
-(void)getLoginWithName:(NSString *)name pwd:(NSString *)pwd SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 获取验证吗
 */
-(void)getPhoneCode:(NSString *)phone WithSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 意见反馈
 */
-(void)getfeedbackWithNSDictionary:(NSDictionary *)postdic andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 获取文章
 */
-(void)getlistWith:(int)page andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 修改个人信息
 */
-(void)PersonalDataWithNSDictionary:(NSDictionary *)postdic andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 已投项目
 */
-(void)getDataWithpage:(int)start endpage:(int)end token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 汇款计划
 */
-(void)getjihuaDataWithpage:(int)start end:(int)endpage token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 我的收益
 */
-(void)getincomeDataWithpage:(int)page end:(int)end token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 资金纪录
 */
-(void)getmoneyDataWithpage:(int)page token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 上传头像
 */
-(void)upDataWithpage:(NSDictionary *)postdic nsdata:(NSData *) data SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
/*
 
 */
-(void)getcex:(NSDictionary *)postdic SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock;
@end
