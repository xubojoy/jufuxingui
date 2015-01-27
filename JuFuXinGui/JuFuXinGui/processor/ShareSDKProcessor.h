//
//  ShareSDKProcessor.h
//  styler
//
//  Created by wangwanggy820 on 14-8-8.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareContent.h"
#import <ShareSDK/ShareSDK.h>
#import <RennSDK/RennSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboApi.h"

@interface ShareSDKProcessor : NSObject<ISSShareViewDelegate>

- (void)share:(ShareContent *)shareContent shareViewDelegate:(id)shareViewDelegate sender:(id)sender shareSuccessBlock:(void(^)())shareSuccessBlock;

+(void)customShareView:(UIViewController *)viewController shareType:(ShareType)shareType;

+(void)initShareSDK;

-(void)followWeiXinTimeLine:(id)sender
               shareContent:(ShareContent *)shareContent
          shareSuccessBlock:(void(^)())shareSuccessBlock;

@end
