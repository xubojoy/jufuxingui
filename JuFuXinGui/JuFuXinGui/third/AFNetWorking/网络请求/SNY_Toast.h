//
//  SNY_Toast.h
//  YiChat
//
//  Created by 宋乃银 on 14-9-13.
//  Copyright (c) 2014年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    showStyleFlip,
    showStyleWear
    
}ShowStyle;

@interface SNY_Toast : NSObject
/*
    用法:[SNY_Toast showMsg:@"你好!" WithDuration:2 WithStyle:showStyleFlip];
 */
+(void)showMsg:(NSString *)str WithDuration:(CGFloat)duration WithStyle:(ShowStyle)style;
@end


@interface NSString (Size)

-(CGSize)getSizeWithMaxSize:(CGSize)maxSize WithFontSize:(int)fontSize;

@end