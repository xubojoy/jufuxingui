//
//  HAN_UIConstants.h
//  JuFuXinGui
//
//  Created by mac on 14/12/26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#ifndef JuFuXinGui_HAN_UIConstants_h
#define JuFuXinGui_HAN_UIConstants_h
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//判断程序的版本
#define IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)

//#define IOS6_7_DELTA(V,X,Y,W,H) if(IOS_7) {CGRect f = V.frame;f.origin.x += X;f.origin.y += Y;f.size.width +=W;f.size.height += H;V.frame=f;}



//整个屏幕的宽和高
#define VIEW_WEIGHT [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT (IOS_7 ?[UIScreen mainScreen].bounds.size.height :([UIScreen mainScreen].bounds.size.height-64))
#define VIEW_HEIGHT_TAB ([UIScreen mainScreen].bounds.size.height-113)

#define Screen_weight [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height
#define Screen_weightScale(weight) weight/320.0
#define Screen_heightScale(high) high/568.0
//控件的尺寸
#define WIDTH_VIEW(view) CGRectGetWidth(view.frame)
#define HEIGHT_VIEW(view) CGRectGetHeight(view.frame)
#define VIEW_MAXX(view) CGRectGetMaxX(view.frame)
#define VIEW_MAXY(view) CGRectGetMaxY(view.frame)

#define View_SizeW(view) view.frame.size.width
#define View_SizeY(view) view.frame.size.height
#define View_OriginX(view) view.frame.origin.x
#define View_OriginY(view) view.frame.origin.y
#define VIEW_oringeY  (IOS_7 ? 64:0)
/*
 关于我们的ui坐标
 */
#define WebViewController_webview_width [UIScreen mainScreen].bounds.size.width
#define WebViewController_webview_height [UIScreen mainScreen].bounds.size.height
#define HAN_FeedBackViewController_textview_width [UIScreen mainScreen].bounds.size.width
#define HAN_FeedBackViewController_textview_heigh  [UIScreen mainScreen].bounds.size.width/2
#define HAN_FeedBackViewController_textViewLabel_width 30
/*
 个人中心的ui坐标
 */
/*
 DNEGLU
 */
#define LoginViewController_uerview_height 100
#define LoginViewController_logbtn_height   50
#endif
