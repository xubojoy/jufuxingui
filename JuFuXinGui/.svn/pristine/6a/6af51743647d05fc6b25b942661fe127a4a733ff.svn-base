//
//  JSHttpRequest.h
//  TeachThin
//
//  Created by 王园园 on 14-11-26.
//  Copyright (c) 2014年 巩鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface JSHttpRequest : NSObject

-(void)StartWorkWithUrlstr:(NSString *)str;

-(void)StartWorkPostWithurlstr:(NSString *)str pragma:(NSDictionary *)dict ImageData:(NSData *)data;
+(void)listenNetworkChange;
@property(nonatomic,copy)void(^successGetData)(id);
@property(nonatomic,copy)void(^failureGetData)();

@end
