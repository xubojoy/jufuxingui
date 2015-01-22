//
//  UIViewController+GestureRecognizer.h
//
//  Created by wangwanggy820 on 14-4-17.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Custom)

-(void)setRightSwipeGestureAndAdaptive;
-(void)setRightSwipeGesture;
-(void)adaptive;
-(void)goback:(id)sender;

-(NSString *)getPageName;
-(UIViewController *)getLastViewController;
@end
