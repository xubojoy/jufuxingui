//
//  SNY_Toast.m
//  YiChat
//
//  Created by 宋乃银 on 14-9-13.
//  Copyright (c) 2014年 zhiyou. All rights reserved.
//

#import "SNY_Toast.h"

#define T_SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define T_SCREEN_CENTER CGPointMake(T_SCREEN_BOUNDS.size.width/2.0, T_SCREEN_BOUNDS.size.height/2.0)
#define T_IOS_VERSION_7_OR_ABOVE [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0

@implementation SNY_Toast
-(void)dealloc
{
    [super dealloc];
}
+(void)showMsg:(NSString *)str WithDuration:(CGFloat)duration WithStyle:(ShowStyle)style
{
   
    CGSize size=[str getSizeWithMaxSize:CGSizeMake(300, T_SCREEN_BOUNDS.size.height-80) WithFontSize:21];
    UILabel * label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.text=str;
    label.backgroundColor=[UIColor colorWithWhite:0.2 alpha:1];
    label.textAlignment=1;
    label.font=[UIFont boldSystemFontOfSize:18];
    label.layer.cornerRadius=3;
    label.layer.masksToBounds=YES;
    label.textColor=[UIColor whiteColor];
    label.numberOfLines=0;
    label.text=str;
    if (style==showStyleWear)
    {
        label.center=CGPointMake(T_SCREEN_CENTER.x, T_SCREEN_BOUNDS.size.height-80-label.frame.size.height/2);
        label.transform=CGAffineTransformMakeScale(0.1, 0.1);
        
    }
    else
    {
        label.center=CGPointMake(T_SCREEN_CENTER.x, T_SCREEN_BOUNDS.size.height+label.frame.size.height/2);
       
    }
    [self show:label WithDuration:duration WithStyle:style];
}

+(void)show:(UILabel *)label WithDuration:(CGFloat)duration WithStyle:(ShowStyle)style
{
    UIWindow * win=[UIApplication sharedApplication].delegate.window;
    [win addSubview:label];
    CGFloat d=style?0.2:0.3;
    
    [UIView animateWithDuration:d animations:^{
        if (style==showStyleWear) {
            
            label.transform=CGAffineTransformMakeScale(1.3, 1.3);
        }
        else
        {
            label.center=CGPointMake(T_SCREEN_CENTER.x, T_SCREEN_BOUNDS.size.height-100-label.frame.size.height/2);
            label.transform=CGAffineTransformMakeScale(1.2, 1.2);
        }
    } completion:^(BOOL finished)
     {
         [UIView animateWithDuration:0.1 animations:^{
             label.center=CGPointMake(T_SCREEN_CENTER.x, T_SCREEN_BOUNDS.size.height-80-label.frame.size.height/2);
             label.transform=CGAffineTransformMakeScale(1.0, 1.0);
         } completion:^(BOOL finished)
          {
              [UIView animateWithDuration:0.5 delay:duration options:UIViewAnimationOptionLayoutSubviews animations:^{
                  label.alpha=0;
              } completion:^(BOOL finished) {
                  [label removeFromSuperview];
                  [label release];
              }];
          }];
         
     }];
}
@end


@implementation NSString (Frame)

-(CGSize)getSizeWithMaxSize:(CGSize)maxSize WithFontSize:(int)fontSize
{
    CGSize size;
    if (T_IOS_VERSION_7_OR_ABOVE)
    {
        size=[self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;

    }
    else
    {
        size=[self sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
   }
    return size;
}

@end
