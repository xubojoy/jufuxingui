//
//  Macro.h
//  TeachThin
//
//  Created by 巩鑫 on 14-11-19.
//  Copyright (c) 2014年 巩鑫. All rights reserved.
//

#ifndef TeachThin_Macro_h
#define TeachThin_Macro_h
//判断程序的版本
#define IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)


#define commonFrame  CGRectMake(screen_width-50, 20, 44, 43.5)

#define splite_line_height 0.5

#define splite_line_color  RGBACOLOR(204, 204, 204, 1)

#define navigation_height     44
#define status_bar_height     20
#define tabbar_height         51
#define general_margin        15
#define general_cell_height   44
#define general_padding       10
#define general_space         20
#define general_height        40
#define splite_line_height    0.5
#define screen_width          [UIScreen mainScreen].bounds.size.width
#define main_content_height   [UIScreen mainScreen].bounds.size.height - self.header.frame.size.height
#define bottomY(view)         view.frame.size.height + view.frame.origin.y
#define leftX(view)           view.frame.size.width + view.frame.origin.x
#define IOS6                  ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)?YES:NO
#define IOS7                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)?YES:NO
#define IOS8                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)?YES:NO


//整个屏幕的宽和高
#define VIEW_WEIGHT [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT (IOS_7 ?[UIScreen mainScreen].bounds.size.height :([UIScreen mainScreen].bounds.size.height-64))
#define VIEW_HEIGHT_TAB ([UIScreen mainScreen].bounds.size.height-113)

//控件的尺寸
#define WIDTH_VIEW(view) CGRectGetWidth(view.frame)
#define HEIGHT_VIEW(view) CGRectGetHeight(view.frame)
#define VIEW_MAXX(view) CGRectGetMaxX(view.frame)
#define VIEW_MAXY(view) CGRectGetMaxY(view.frame)

#define VIEW_oringeY  (IOS_7 ? 64:0)


#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define GXRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

//接口
#define MAINURL @"http://www.gmtxw01.com/index.php?"

//拍一拍接口http://www.gmtxw01.com/index.php?m=product&c=index&a=food_decription&foodname=aaaa
#define URL_PhotoData(name)  [MAINURL stringByAppendingString:[NSString stringWithFormat:@"m=product&c=index&a=food_decription&foodname=%@",name]]

#endif
