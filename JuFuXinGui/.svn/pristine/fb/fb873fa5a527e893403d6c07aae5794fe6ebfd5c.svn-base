//
//  ShareSDKProcessor.m
//  styler
//
//  Created by wangwanggy820 on 14-8-8.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "ShareSDKProcessor.h"
#import "WeiboSDK.h"
#import "WXApi.h"

@implementation ShareSDKProcessor


- (void)share:(ShareContent *)shareContent shareViewDelegate:(id)shareViewDelegate sender:(id)sender shareSuccessBlock:(void (^)())shareSuccessBlock{
    if(shareContent == nil){
        return ;
    }
    
    [self convertSpecialSymbol:shareContent];
   
    id<ISSCAttachment> shareImg;
    id<ISSCAttachment> wxShareImg;


    if (shareContent.image) {
        shareImg = [ShareSDK imageWithData:UIImagePNGRepresentation(shareContent.image) fileName:shareContent.title mimeType:@"image/png"];
        UIImage *cropedImg = [self imageWithImage:shareContent.image];
        wxShareImg = [ShareSDK imageWithData:UIImagePNGRepresentation(cropedImg) fileName:shareContent.title mimeType:@"image/png"];
    }else{
        shareImg = [ShareSDK imageWithUrl:shareContent.imageUrl];
    }

   
    
        id<ISSContent> publishContent = [ShareSDK content:shareContent.content
                            defaultContent:nil
                                     image:shareImg
                                     title:shareContent.title
                                       url:shareContent.url
                               description:nil
                                 mediaType:SSPublishContentMediaTypeNews];
        [publishContent addSinaWeiboUnitWithContent:shareContent.sinaWeiBoContent image:shareImg];

    
        [publishContent addSMSUnitWithContent:shareContent.sinaWeiBoContent];
        //        [publishContent addTencentWeiboUnitWithContent:[self getShareWithUrlContent] image:[self getShareIamge]];
        //定制微信好友信息
        [publishContent addWeixinSessionUnitWithType:@(SSPublishContentMediaTypeNews)
                                             content:shareContent.content
                                               title:shareContent.title
                                                 url:shareContent.url
                                          thumbImage:wxShareImg
                                               image:wxShareImg
                                        musicFileUrl:nil
                                             extInfo:nil
                                            fileData:nil
                                        emoticonData:nil];
        
        //定制微信朋友圈信息
        [publishContent addWeixinTimelineUnitWithType:[[NSNumber alloc] initWithInt:SSPublishContentMediaTypeApp]
                                              content:nil
                                                title:shareContent.content
                                                  url:shareContent.url
                                           thumbImage:wxShareImg
                                                image:wxShareImg
                                         musicFileUrl:nil
                                              extInfo:shareContent.content
                                             fileData:nil
                                         emoticonData:nil];
    [publishContent addCopyUnitWithContent:shareContent.content image:shareImg];
    
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                         viewDelegate:nil
                                               authManagerViewDelegate:nil];
    
    //在授权页面中添加关注官方微博
    [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"xubojoy"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    nil]];
    id<ISSShareOptions> shareOptions = [ShareSDK defaultShareOptionsWithTitle:@"内容分享"
                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                               qqButtonHidden:YES
                                                        wxSessionButtonHidden:YES
                                                       wxTimelineButtonHidden:YES
                                                         showKeyboardOnAppear:NO
                                                            shareViewDelegate:shareViewDelegate
                                                          friendsViewDelegate:nil
                                                        picViewerViewDelegate:nil];
    
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:NO
                       authOptions:authOptions
                      shareOptions:shareOptions
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
    }];
}

+(void)customShareView:(UIViewController *)viewController{
//    NSLog(@">>> view on will display");
    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    //修改左右按钮的文字颜色
    UIBarButtonItem *leftBtn = viewController.navigationItem.leftBarButtonItem;
    [leftBtn setTitle:@"取消"];
    [leftBtn setTintColor:[UIColor blackColor]];
    
    UIBarButtonItem *rightBtn = viewController.navigationItem.rightBarButtonItem;
    [rightBtn setTitle:@"发布"];
    [rightBtn setTintColor:[UIColor blackColor]];
    
    //修改标题颜色和文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.text = viewController.title;
    
    label.font = [UIFont boldSystemFontOfSize:15];
    [label sizeToFit];
    viewController.navigationItem.titleView = label;
}

//对图片尺寸进行压缩--
-(UIImage*)imageWithImage:(UIImage*)image
{
    if (image.size.width == image.size.height) {
        return image;
    }
    CGSize size = image.size;
    float ratio = size.width/size.height;
    float newRatio = 1;
    float x = 0;
    float y = 0;
    float cropedWidth = 0;
    float cropedHeight = 0;
    if (ratio > newRatio) {
        cropedHeight = size.height;
        cropedWidth = cropedHeight*newRatio;
        x = (size.width - cropedWidth)/2;
    }else{
        cropedWidth = size.width;
        cropedHeight = cropedWidth/newRatio;
        y = (size.height - cropedHeight)/2;
    }
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, cropedWidth, cropedHeight));
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    
    CGSize newSize = CGSizeMake(200, 200);
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [smallImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

-(void)followWeiXinTimeLine:(id)sender
               shareContent:(ShareContent *)shareContent
          shareSuccessBlock:(void(^)())shareSuccessBlock{
    
    id<ISSCAttachment> shareImg;
    id<ISSCAttachment> wxShareImg;
    
    
    if (shareContent.image) {
        shareImg = [ShareSDK imageWithData:UIImagePNGRepresentation(shareContent.image) fileName:shareContent.title mimeType:@"image/png"];
        UIImage *cropedImg = [self imageWithImage:shareContent.image];
        wxShareImg = [ShareSDK imageWithData:UIImagePNGRepresentation(cropedImg) fileName:shareContent.title mimeType:@"image/png"];
    }else if (shareContent.imageUrl){
        wxShareImg = [ShareSDK imageWithPath:shareContent.imageUrl];
    }
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@""
                                       defaultContent:nil
                                                image:wxShareImg
                                                title:shareContent.content
                                                  url:shareContent.url
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeNews];
    
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    [ShareSDK showShareViewWithType:ShareTypeWeixiTimeline
                          container:container
                            content:publishContent
                      statusBarTips:NO
                        authOptions:nil
                       shareOptions:nil
                             result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                 if (state == SSPublishContentStateSuccess) {
                                     NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                     shareSuccessBlock();
                                 }else if (state == SSPublishContentStateFail){
                                     NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                     shareSuccessBlock();
                                 }
                             }];
}

-(void) convertSpecialSymbol:(ShareContent *)shareContent{
    shareContent.title = [shareContent.title stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    shareContent.content = [shareContent.content stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    shareContent.sinaWeiBoContent = [shareContent.sinaWeiBoContent stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
}

+(void) initShareSDK{
    [ShareSDK registerApp:@"4ca37e0a4194"];
    
    //添加新浪微博应用 注册网址 http://open.weibo.com
    [ShareSDK connectSinaWeiboWithAppKey:@"2860426114"
                               appSecret:@"daf0c4b56c6529c59f5fa7f81ee4a728"
                             redirectUri:@"http://www.sharesdk.cn"];
    
    //添加微信应用 注册网址 http://open.weixin.qq.com
    [ShareSDK connectWeChatWithAppId:@"wx8216675fb452a3d6"
                           wechatCls:[WXApi class]];
    
    [ShareSDK connectSMS];
    [ShareSDK connectCopy];
    //激活SSO
    [ShareSDK ssoEnabled:YES];
}
@end
