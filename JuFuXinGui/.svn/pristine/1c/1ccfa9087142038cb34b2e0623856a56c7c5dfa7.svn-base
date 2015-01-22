//
//  HAN_HttpRequest.m
//  JuFuXinGui
//
//  Created by mac on 14/12/31.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "HAN_HttpRequest.h"
#import "AFNetworking.h"
#import "SNY_Toast.h"
#import "JSHttpRequest.h"
#import "HAN_Constants.h"
@implementation HAN_HttpRequest
static HAN_HttpRequest * request=nil;
-(instancetype)init{
    if (self=[super init]) {
        _requestDict=[[NSMutableDictionary alloc]initWithDictionary:0];
       
        
    }
    return self;
}
+(instancetype)defaultRequest
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request=[[HAN_HttpRequest alloc] init];
    });
    return request;
}
-(void)cannelAllRequest
{
    
    for (AFHTTPRequestOperation * requestOperation in [_requestDict allValues])
    {
        [requestOperation cancel];
    }
    [_requestDict removeAllObjects];
}

//注册接口
-(void)getRegistWithNSDictionary:(NSDictionary *)postdic andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    
    NSString * url=[NSString stringWithFormat:@"%@%@",BAES_URL,REGISET_URL];
   
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkPostWithurlstr:url pragma:postdic ImageData:nil];
    request.successGetData = ^(id obj){
    if ([obj isKindOfClass:[NSDictionary class]]) {
            successBlock(obj);
        }else{
            
        }
        
    };
    request.failureGetData = ^(void){
        
    };

}
//登陆接口
-(void)getLoginWithName:(NSString *)name pwd:(NSString *)pwd SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
  
    
    NSString * url=[NSString stringWithFormat:@"%@%@",BAES_URL,LOGIN_URL(name, pwd)];
    NSLog(@"*****%@",url);
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
   [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        NSLog(@"我哦%@",obj);
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
    };
}
/*
 获取验证吗
 */
-(void)getPhoneCode:(NSString *)phone WithSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    NSString * url=[NSString stringWithFormat:@"%@%@",BAES_URL,VALIDATE_URL];
    //NSString * jiami=[self md5:@"gmtxmd5"];
    NSDictionary * postDict = [NSDictionary dictionaryWithObjectsAndKeys:phone,@"phone",nil];
    //NSString * url = URL_Login;
    NSLog(@"*****%@",url);
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkPostWithurlstr:url pragma:postDict ImageData:nil];
    request.successGetData = ^(id obj){
        NSLog(@"我哦%@",obj);
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
    };
}
/*
 意见反馈
 */
-(void)getfeedbackWithNSDictionary:(NSDictionary *)postdic andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    NSString * url=@"http://www.gmtxw06.com/index.php?g=home&m=credinfo&a=add_advice";
//http://www.gmtxw06.com/index.php?&m=credinfo&a=add_advice&g=home
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkPostWithurlstr:url pragma:postdic ImageData:nil];
    request.successGetData = ^(id obj){
        NSLog(@"意见反馈%@",obj);
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
        
    };

    
}
/*
 获取文章
 */
-(void)getlistWith:(int)page andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    
    NSString * url=@"http://www.gmtxw06.com/index.php?m=Article&a=intro_list";
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    NSDictionary * postdic=[[NSDictionary alloc]initWithObjectsAndKeys:[NSNumber numberWithInt:page],@"id" ,nil];
  [request StartWorkPostWithurlstr:url pragma:postdic ImageData:nil];
    //[request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        
        successBlock(obj);
        NSLog(@"%@",obj);
    };
    request.failureGetData = ^(void){
        
        
    };
    
}
/*
 修改个人信息
 */
-(void)PersonalDataWithNSDictionary:(NSDictionary *)postdic andSuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    NSString * url=@"http://www.gmtxw06.com/index.php?g=home&m=credinfo&a=edit_inves_info";
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkPostWithurlstr:url pragma:postdic ImageData:nil];
    request.successGetData = ^(id obj){
        NSLog(@"obj%@",obj);
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
        
    };
    
}
/*
 已投项目
 */
-(void)getDataWithpage:(int)start endpage:(int)end token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    
   // token=@"dc3fd5bfe86cb3e48e034e1a74015284";
    NSString * url=[NSString stringWithFormat:@"http://www.gmtxw06.com/index.php?m=Product&a=invst&start=%d&eve=%d&token=%@",start,end,token];
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        
        successBlock(obj);
        NSLog(@"%@",obj);
    };
    request.failureGetData = ^(void){
        
        
    };
}
/*
 汇款计划
 */
-(void)getjihuaDataWithpage:(int)start end:(int)endpage token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
   // token=@"dc3fd5bfe86cb3e48e034e1a74015284";
    NSString * url=[NSString stringWithFormat:@"http://www.gmtxw06.com/index.php?m=Product&a=receivable&start=%d&eve=%d&token=%@",start,endpage,token];
    ///index.php?m=Product&a=receivable&page=1&token=dc3fd5bfe86cb3e48e034e1a74015284
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        
        successBlock(obj);
        NSLog(@"%@",obj);
    };
    request.failureGetData = ^(void){
        
        
    };
}
/*
 我的收益
 */
-(void)getincomeDataWithpage:(int)page end:(int)end token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
   // token=@"dc3fd5bfe86cb3e48e034e1a74015284";
    NSString * url=[NSString stringWithFormat:@"http://www.gmtxw06.com/index.php?m=Product&a=myget&start=%d&eve=%d&token=%@",page,end,token];
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
        
    };
}
/*
 资金纪录
 */
-(void)getmoneyDataWithpage:(int)page token:(NSString *)token SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    ///index.php?m=Product&a=addrecord&token=dc3fd5bfe86cb3e48e034e1a74015284
    NSString * url=[NSString stringWithFormat:@"http://www.gmtxw06.com/index.php?m=Product&a=addrecord&page=%d&token=%@",page,token];
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        successBlock(obj);
        NSLog(@"%@",obj);
    };
    request.failureGetData = ^(void){
        
        
    };
    
}
/*
 上传头像
 */
-(void)upDataWithpage:(NSDictionary *)postdic nsdata:(NSData *) data SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    //NSData *data = UIImagePNGRepresentation(self.imageView.image);
    NSString * url=@"http://www.gmtxw06.com/index.php?g=home&m=credinfo&a=user_img";
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkPostWithurlstr:url pragma:postdic ImageData:data];
    request.successGetData = ^(id obj){
        NSLog(@"obj%@",obj);
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
        
    };
}


/*
 获取性别
 */
-(void)getcex:(NSDictionary *)postdic SuccessBlock:(void(^)(id data))successBlock WithFailBlock:(void(^)(NSError * error))failBlock{
    
    NSString * url=@"http://www.gmtxw06.com/index.php?&m=credinfo&a=edit_inves_info&g=home";
    JSHttpRequest * request = [[JSHttpRequest alloc]init];
    [request StartWorkPostWithurlstr:url pragma:postdic ImageData:nil];
    request.successGetData = ^(id obj){
        NSLog(@"obj%@",obj);
        successBlock(obj);
        
    };
    request.failureGetData = ^(void){
        
        
    };
    
}
#pragma mark 获取失败
-(void)getfailalert{
    
}
+(void)listenNetworkChange
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
            {
                [SNY_Toast showMsg:@"未知连接" WithDuration:3 WithStyle:showStyleFlip];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                [SNY_Toast showMsg:@"当前无连接" WithDuration:4 WithStyle:showStyleFlip];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                [SNY_Toast showMsg:@"当前使用3G网络,请注意你的流量." WithDuration:4 WithStyle:showStyleFlip];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                [SNY_Toast showMsg:@"当前使用WiFi网络." WithDuration:4 WithStyle:showStyleFlip];
            }
                break;
                
            default:
                break;
        }
    }];
}
@end
