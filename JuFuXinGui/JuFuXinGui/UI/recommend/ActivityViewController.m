//
//  ActivityViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>self.huodongdic :%@",self.huodongDic);
    self.activityDetailDic = [NSDictionary new];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initScrollView];
    
    [self loadActivityData];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = view_bg_color;
    
    
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"品牌活动介绍" navigationController:self.navigationController];
    [self.view addSubview:self.header];
}

-(void)loadActivityData{
    
    NSString *activityId = [self.huodongDic valueForKey:@"id"];
    
    NSString *url = URL_huodong_detail(activityId);
    JSHttpRequest *request = [[JSHttpRequest alloc] init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        NSLog(@">>>>活动详情>>>>>>>>%@",obj);
        NSString *code = [obj valueForKey:@"code"];
        if ([code isEqualToString:@"01"]) {
            self.activityDetailDic = [obj valueForKey:@"result"];
            [self initTopImgView];
            [self initFirstView];
            [self initSecondView];
        }
    };
}

-(void)initScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height, screen_width, VIEW_HEIGHT-self.header.frame.size.height)];
    self.scrollView.backgroundColor = RGBACOLOR(255, 255, 255, 1);
    self.scrollView.contentSize = CGSizeMake(screen_width, VIEW_HEIGHT);
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
}

-(void)initTopImgView{
    NSString *imgUrl = [self.activityDetailDic valueForKey:@"pic"];
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake((screen_width-100)/2, general_padding, 100, 100)];
    self.topImageView.backgroundColor = [UIColor purpleColor];
    [self.topImageView setImageWithURL:[NSURL URLWithString:imgUrl]];
    [self.scrollView addSubview:self.topImageView];
}

//渲染bottomView的SubViews
-(void)initFirstView{
    NSString *title = [self.activityDetailDic valueForKey:@"active_range"];
    NSString *content = [self.activityDetailDic valueForKey:@"active_content"];
    NSLog(@">>>>>>>>>>>>>>>>title----content--%@---%@",title,content);
    CommonItemTxt *item1 = [[CommonItemTxt alloc]init:0 title:title content:content];
    UIFont *font = [UIFont systemFontOfSize:14];
    NSArray *array = [NSArray arrayWithObjects:item1, nil];
    
   float height = [CommonItemTxtView judgeHeight:array font:font]+3*general_margin;
    
    CGRect frame = CGRectMake(0, self.topImageView.frame.origin.y+self.topImageView.frame.size.height+general_padding, screen_width, height);
    
    self.descriptionView = [[CommonItemTxtView alloc] initWithFrame:frame
                                                 commonItemTxtArray:array
                                                               font:font
                                                        showMarkImg:NO];
    self.descriptionView.backgroundColor = RGBACOLOR(255, 255, 255, 1);
    self.descriptionView.markImgView.hidden = YES;
    self.descriptionView.upLine.hidden = YES;
    self.descriptionView.downLine.hidden = YES;
    [self.scrollView addSubview:self.descriptionView];
}

-(void)initSecondView{
    float height = 0;
    NSString *title = [self.activityDetailDic valueForKey:@"require"];
    NSString *content = [self.activityDetailDic valueForKey:@"require_method"];    CommonItemTxt *item1 = [[CommonItemTxt alloc]init:0 title:title content:content];
    
    UIFont *font = [UIFont systemFontOfSize:14];
    NSArray *array = [NSArray arrayWithObjects:item1, nil];
    if (VIEW_HEIGHT > 568) {
        height = [CommonItemTxtView judgeHeight:array font:font]+3*general_margin;
    }else{
        height = [CommonItemTxtView judgeHeight:array font:font]+4*general_margin;
    }
    
    float descriptionViewY = self.descriptionView.frame.origin.y+self.descriptionView.frame.size.height+10;
    
    CGRect frame = CGRectMake(0, descriptionViewY, screen_width, height);
    
    self.descriptionView1 = [[CommonItemTxtView alloc] initWithFrame:frame
                                                  commonItemTxtArray:array
                                                                font:font
                                                         showMarkImg:NO];
    self.descriptionView1.backgroundColor = RGBACOLOR(255, 255, 255, 1);
    self.descriptionView1.markImgView.hidden = YES;
    self.descriptionView1.upLine.hidden = YES;
    self.descriptionView1.downLine.hidden = YES;
    [self.scrollView addSubview:self.descriptionView1];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
