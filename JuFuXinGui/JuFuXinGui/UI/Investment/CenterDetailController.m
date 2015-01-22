//
//  InvestDetailController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "CenterDetailController.h"
#import "ShareSDKProcessor.h"
#import "ShareContent.h"
#import "RecommendDetailController.h"
@interface CenterDetailController ()

@end

@implementation CenterDetailController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(240, 240, 240, 1);
    [self setRightSwipeGesture];
    [self initHeader];
    [self initScrollView];
    [self initTopView];
    [self initItemDetailView];
    [self initCenterView];
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"推荐项目" navigationController:self.navigationController];
    self.header.backBut.hidden = NO;
    [self.view addSubview:self.header];
    [self initShareBtn];
}

-(void)initShareBtn{
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = commonFrame;
    [shareBtn addTarget:self action:@selector(shareBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self.header addSubview:shareBtn];
}

//初始化scrollVIew
-(void)initScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height, screen_width, VIEW_HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(screen_width, VIEW_HEIGHT+self.header.frame.size.height);
    self.scrollView.backgroundColor = RGBACOLOR(240, 240, 240, 1);
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
}

//初始化black view
-(void)initTopView{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 30)];
    self.topView.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:self.topView];
    
    self.markImgView = [[UIImageView alloc] initWithFrame:CGRectMake(general_margin, 0, 20, 45)];
    self.markImgView.backgroundColor = [UIColor redColor];
    [self.topView addSubview:self.markImgView];
    
    self.qiLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 30)];
    [self.qiLabel setTextColor:[UIColor whiteColor]];
    self.qiLabel.font = [UIFont systemFontOfSize:14];
    self.qiLabel.textAlignment = NSTextAlignmentCenter;
    self.qiLabel.text = @"3月期";
    [self.topView addSubview:self.qiLabel];
    
    self.detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.detailBtn.frame = CGRectMake(screen_width-50, 0, 50, 30);
    [self.detailBtn setTitle:@"详情" forState:UIControlStateNormal];
    [self.detailBtn setTintColor:[UIColor whiteColor]];
    self.detailBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.detailBtn addTarget:self action:@selector(detailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.detailBtn];
    
}

//初始化项目详情view
-(void)initItemDetailView{
    self.itemDetailView = [[ItemDetailView alloc] init];
    self.itemDetailView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.itemDetailView];
}

//详情按钮
-(void)detailBtnClick:(UIButton *)sender{
    RecommendDetailController *rdvc = [[RecommendDetailController alloc] init];
    [self.navigationController pushViewController:rdvc animated:YES];
    
    
}


//初始化centerView

-(void)initCenterView{
    self.centerView = [[CenterView alloc] init];
    self.centerView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.centerView];
    
    NSLog(@">>>>>>>>>>>>>>self.centerView:%@",NSStringFromCGRect(self.centerView.frame));
    
}

#pragma mark - -----------------ShareSDK实现分享功能------------------
-(void)shareBtnPress:(id)sender{
    ShareContent *shareContent = [self collectionShareContent];
    ShareSDKProcessor *shareSDKProcessor = [ShareSDKProcessor new];
    [shareSDKProcessor share:shareContent shareViewDelegate:self sender:sender shareSuccessBlock:^{
        
    }];
}

-(ShareContent *) collectionShareContent{
    
    ShareContent *shareContent = [[ShareContent alloc] initWithTitle:nil
                                                             content:nil
                                                    sinaWeiBoContent:nil
                                                                 url:nil
                                                               image:nil
                                                            imageUrl:nil];
    return shareContent;
}

- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType
{
    [ShareSDKProcessor customShareView:viewController];
}






@end
