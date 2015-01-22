//
//  NTViewController.m
//  tabbarDemo
//
//  Created by MD101 on 14-10-8.
//  Copyright (c) 2014年 TabBarDemo. All rights reserved.
//

#import "NTViewController.h"
#import "NTButton.h"
#import "RecomIndexViewController.h"
#import "InvestmentViewController.h"
#import "UserCenterController.h"
#import "AboutUsViewController.h"
#import "LoginViewController.h"
#import "UserModel.h"
#define kTabBarHeight 49
static NTViewController *controller = nil;
@interface NTViewController (){

    UIView *_tabBarView;//自定义的覆盖原先的tarbar的控件
    
    NTButton * _previousBtn;//记录前一次选中的按钮

}

@end

@implementation NTViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor grayColor];
        // Custom initialization
    }
    return self;
}

//单例
+(NTViewController *)sharedController{
    @synchronized(self){
        if(controller == nil){
            controller = [[self alloc] init];
           
        }
    }
    return controller;
}

+(instancetype)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (controller == nil) {
            controller = [super allocWithZone:zone];
            return  controller;
        }
    }
    return nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTabbar];
    
}

-(void)initTabbar{
    
    self.tabBar.hidden = YES;
    CGFloat tabBarViewY = self.view.frame.size.height - 49;
    
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, tabBarViewY, VIEW_WEIGHT, 49)];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_tabBarView];
    
    UIImageView *tabbarImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 49)];
    
    tabbarImg.image = [UIImage imageNamed:@"tabbar_bg_icon"];
    [_tabBarView addSubview:tabbarImg];
    
    RecomIndexViewController * first = [[RecomIndexViewController alloc]init];
    UINavigationController * navi1 = [[UINavigationController alloc]initWithRootViewController:first];
    
    InvestmentViewController * second = [[InvestmentViewController alloc]init];
    UINavigationController * navi2 = [[UINavigationController alloc]initWithRootViewController:second];
    
    UserCenterController * third = [[UserCenterController alloc]init];
    UINavigationController * navi3 = [[UINavigationController alloc]initWithRootViewController:third];
    
    AboutUsViewController * fourth = [[AboutUsViewController alloc]init];
    UINavigationController * navi4 = [[UINavigationController alloc]initWithRootViewController:fourth];
    
    self.viewControllers = [NSArray arrayWithObjects:navi1,navi2,navi3,navi4, nil];
    
    [self creatButtonWithNormalName:@"recommend_icon" andSelectName:@"recommend_selected" andTitle:nil andIndex:0];
    [self creatButtonWithNormalName:@"invest_icon" andSelectName:@"invest_selected" andTitle:nil andIndex:1];
    [self creatButtonWithNormalName:@"user_center" andSelectName:@"user_center_selected" andTitle:nil andIndex:2];
    [self creatButtonWithNormalName:@"about_us" andSelectName:@"about_us_selected" andTitle:nil andIndex:3];
    NTButton * button =(NTButton *) _tabBarView.subviews[1];
    [self changeViewController:button];
}

#pragma mark 创建一个按钮

- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    
    NTButton * customButton = [NTButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = index;
    
    CGFloat buttonW = _tabBarView.frame.size.width / 4;
    CGFloat buttonH = _tabBarView.frame.size.height;
    
    customButton.frame = CGRectMake(buttonW * index, 0, buttonW, buttonH);
    [customButton setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [customButton setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateDisabled];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    customButton.imageView.contentMode = UIViewContentModeCenter;
    [_tabBarView addSubview:customButton];
}

#pragma mark 按钮被点击时调用
- (void)changeViewController:(NTButton *)sender
 {
     
     if (sender.tag==2) {
         self.user =[UserModel shareuser];
         if (self.user.isLoad==YES) {
             sender.enabled = NO;
             if (_previousBtn != sender) {
                 _previousBtn.enabled = YES;
             }
             _previousBtn = sender;
             
             self.selectedViewController = self.viewControllers[sender.tag];
         }else{
             LoginViewController * longvc=[[LoginViewController alloc]init];
             [self presentViewController:longvc animated:YES completion:nil];
         }
        
     }else{
         sender.enabled = NO;
         if (_previousBtn != sender) {
             _previousBtn.enabled = YES;
         }
         _previousBtn = sender;

         self.selectedViewController = self.viewControllers[sender.tag];
     }
    
}

#pragma mark 是否隐藏tabBar

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated
{
    self.tabBarHidden = yesOrNO;
    if (yesOrNO == YES)
    {
        if (_tabBarView.frame.origin.y == self.view.frame.size.height)
        {
            return;
        }
    }
    else
    {
        if (_tabBarView.frame.origin.y == self.view.frame.size.height - kTabBarHeight)
        {
            return;
        }
    }
    if (animated == YES)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        if (yesOrNO == YES)
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y + kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        else
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y - kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        if (yesOrNO == YES)
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y + kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        else 
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y - kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        [UIView commitAnimations];
    }
}

@end