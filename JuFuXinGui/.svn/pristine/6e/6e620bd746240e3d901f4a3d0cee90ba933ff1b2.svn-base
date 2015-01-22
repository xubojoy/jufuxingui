//
//  UIViewController+GestureRecognizer.m
//
//  Created by wangwanggy820 on 14-4-17.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "UIViewController+Custom.h"

@implementation UIViewController (Custom)

-(void)setRightSwipeGestureAndAdaptive
{
    [self adaptive];
    [self setRightSwipeGesture];
}

-(void)setRightSwipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goback:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)adaptive{
    if (IOS7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.view.frame = [UIScreen mainScreen].bounds;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    else if(IOS6)
    {
        self.view.frame = [UIScreen mainScreen].applicationFrame;
    }
}

-(void)goback:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIViewController *)getLastViewController{
    NSArray *viewControllers = self.navigationController.viewControllers;
    return [viewControllers objectAtIndex:(viewControllers.count-2)];
}

-(NSString *)getPageName{
    return NSStringFromClass([self class]);
}

@end
