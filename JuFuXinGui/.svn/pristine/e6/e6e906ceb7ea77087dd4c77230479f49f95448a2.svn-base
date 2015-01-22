//
//  JSHttpRequest.m
//  TeachThin
//
//  Created by 王园园 on 14-11-26.
//  Copyright (c) 2014年 巩鑫. All rights reserved.
//

#import "JSHttpRequest.h"
#import "SNY_Toast.h"
#import "HAN_Constants.h"
@implementation JSHttpRequest

//将urlstr UTF8编码
-(NSString *)getEncodeurlStr:(NSString *)urlstr;
{
    NSString *encodeurlstr =  [urlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return encodeurlstr;
}

-(void)StartWorkWithUrlstr:(NSString *)str;
{
    //状态栏旁边的菊花指示器转动
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPRequestOperationManager *manager =  [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:[self getEncodeurlStr:str] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(_successGetData){
            self.successGetData(responseObject);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_failureGetData){
            self.failureGetData();
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

-(void)StartWorkPostWithurlstr:(NSString *)str pragma:(NSDictionary *)dict ImageData:(NSData *)data;
{
    //状态栏旁边的菊花指示器转动
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:str  parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if(data==nil) ;else{
            [formData appendPartWithFileData:data name:@"picurl" fileName:@"defult_placeImage.png" mimeType:@"png"];
        }
    }success:^(AFHTTPRequestOperation *operation, id responseObject){
        if(_successGetData){
            self.successGetData(responseObject);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_failureGetData){
            self.failureGetData();
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}
+(void)listenNetworkChange
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
            {
                [SNY_Toast showMsg:@"未知连接" WithDuration:2 WithStyle:showStyleFlip];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                [SNY_Toast showMsg:@"当前无连接" WithDuration:2 WithStyle:showStyleFlip];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                [SNY_Toast showMsg:@"当前使用3G网络,请注意你的流量." WithDuration:2 WithStyle:showStyleFlip];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                [SNY_Toast showMsg:@"当前使用WiFi网络." WithDuration:2 WithStyle:showStyleWear];
            }
                break;
                
            default:
                break;
        }
    }];
}


@end
