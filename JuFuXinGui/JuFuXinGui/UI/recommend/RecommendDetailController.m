//
//  RecommendDetailController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "RecommendDetailController.h"

@interface RecommendDetailController ()
{
    float height;
    BOOL isOpen;
}
@end

@implementation RecommendDetailController

-(instancetype)initWithProductId:(NSString *)productId{
    self = [super init];
    if (self) {
        self.productId = productId;
    }
    return self;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initScrollView];
    [self loadDetailData];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(240, 240, 240, 1);
    isOpen = YES;
    height = 0;
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"推荐项目详情" navigationController:self.navigationController];
    self.header.backBut.hidden = NO;
    [self.view addSubview:self.header];
}


-(void)initScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height, screen_width, VIEW_HEIGHT-self.header.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(screen_width, VIEW_HEIGHT+20);
    self.scrollView.backgroundColor = view_bg_color;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];

}

#pragma mark - 处理数据
-(void)loadDetailData{
    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:30 show:YES];
    NSString *url = URL_Product_Detail_info(self.productId);
    JSHttpRequest *requset = [[JSHttpRequest alloc] init];
    [requset StartWorkWithUrlstr:url];
    requset.successGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
        NSLog(@">>>>产品详情>>>>>>>>>%@",obj);
        NSString *code = [obj valueForKey:@"code"];
        if ([code isEqualToString:@"01"]) {
            NSArray *array = [obj valueForKey:@"result"];
            self.detailDict = [array objectAtIndex:0];
            NSLog(@">>>>self.detailDict>>>>>>>>>%@",self.detailDict);
            [self initTableView];
            [self initBottomView];
            [self initFirstView];
            [self initSecondView];
            [self initThirdView];
            [self.tableView reloadData];
        }
    };
}

//初始化tableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 60+95+10) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = RGBACOLOR(240, 240, 240, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    [self.scrollView addSubview:self.tableView];
}
//初始化底部视图
-(void)initBottomView{
    CGRect frame = self.bottomView.frame;
    frame.origin.x = 0;
    frame.origin.y = self.tableView.frame.size.height+10;
    frame.size.width = screen_width;
    frame.size.height = VIEW_HEIGHT-self.header.frame.size.height-self.tableView.frame.size.height-10;
    self.bottomView = [[UIView alloc] initWithFrame:frame];
    self.bottomView.backgroundColor = view_bg_color;
    [self.scrollView addSubview:self.bottomView];
}

#pragma mark - UITbaleViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString *topIdentifier = @"topCell";
        TopViewCell *cell = [tableView dequeueReusableCellWithIdentifier:topIdentifier];
        if (!cell) {
            cell = [[TopViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topIdentifier];
        }
        [cell renderCellWithDic:self.detailDict];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        static NSString *exceptIdentifier = @"exceptCell";
        ExceptYearRateCell *cell = [tableView dequeueReusableCellWithIdentifier:exceptIdentifier];
        if (!cell) {
            cell = [[ExceptYearRateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:exceptIdentifier];
        }
        [cell renderCellWithDic:self.detailDict];
        [cell.moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else {
        return 95;
    }
}

//控制底部开合
-(void)moreBtnClick:(UIButton *)sender{
    isOpen =! isOpen;
    // 设置按钮内容的对齐方式
    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    // 设置btn中的imageview不拉伸
    sender.imageView.contentMode = UIViewContentModeCenter;
    // 设置btn中的imageview超出部分不剪切
    sender.imageView.clipsToBounds = NO;
    CGRect descriptionView1Frame = self.descriptionView1.frame;
    CGRect descriptionView2Frame = self.descriptionView2.frame;
    if (isOpen) {
        [self.bottomView addSubview:self.descriptionView];
        descriptionView1Frame.origin.y = self.descriptionView.frame.size.height+10;
        descriptionView2Frame.origin.y = self.descriptionView1.frame.size.height+10+self.descriptionView.frame.size.height+10;
        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI*2);
    }else{
        [self.descriptionView removeFromSuperview];
        descriptionView1Frame.origin.y = 0;
        descriptionView2Frame.origin.y = self.descriptionView1.frame.size.height+10;
        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    self.descriptionView1.frame = descriptionView1Frame;
    self.descriptionView2.frame = descriptionView2Frame;
}

//渲染bottomView的SubViews
-(void)initFirstView{
//    NSMutableString *contentStr = [[NSMutableString alloc] initWithString:[self.detailDict valueForKey:@"interestrates"]];
    NSString *content = [self.detailDict valueForKey:@"infor2"];
//    [contentStr appendString:content];
    CommonItemTxt *item1 = [[CommonItemTxt alloc]init:1 title:nil content:content];
    UIFont *font = [UIFont systemFontOfSize:14];
    NSArray *array = [NSArray arrayWithObjects:item1, nil];
    
    height = [CommonItemTxtView judgeHeight:array font:font]+3*general_margin;
    
    CGRect frame = CGRectMake(0, 0, screen_width, height);
    
    self.descriptionView = [[CommonItemTxtView alloc] initWithFrame:frame
                                                 commonItemTxtArray:array
                                                               font:font
                                                        showMarkImg:NO];
    self.descriptionView.backgroundColor = [UIColor whiteColor];
    self.descriptionView.markImgView.hidden = YES;
    [self.bottomView addSubview:self.descriptionView];
}

-(void)initSecondView{
    NSString *content = [self.detailDict valueForKey:@"infor3"];
    CommonItemTxt *item1 = [[CommonItemTxt alloc]init:0 title:@"服务介绍" content:content];

    UIFont *font = [UIFont systemFontOfSize:14];
    NSArray *array = [NSArray arrayWithObjects:item1, nil];
    if (VIEW_HEIGHT > 568) {
        height = [CommonItemTxtView judgeHeight:array font:font]+3*general_margin;
    }else{
        height = [CommonItemTxtView judgeHeight:array font:font]+4*general_margin;
    }
    
    float descriptionViewY = self.descriptionView.frame.size.height+10;
    
    CGRect frame = CGRectMake(0, descriptionViewY, screen_width, height);
    
    self.descriptionView1 = [[CommonItemTxtView alloc] initWithFrame:frame
                                                 commonItemTxtArray:array
                                                               font:font
                                                         showMarkImg:NO];
    self.descriptionView1.backgroundColor = [UIColor whiteColor];
    self.descriptionView1.markImgView.hidden = YES;
    [self.bottomView addSubview:self.descriptionView1];
}

-(void)initThirdView{
    NSString *content = [self.detailDict valueForKey:@"infor4"];
    CommonItemTxt *item1 = [[CommonItemTxt alloc]init:0 title:@"封闭期，开放期和退出费用" content:content];
    UIFont *font = [UIFont systemFontOfSize:14];
    NSArray *array = [NSArray arrayWithObjects:item1, nil];
    
    height = [CommonItemTxtView judgeHeight:array font:font]+7*general_margin;
    float descriptionViewY = self.descriptionView.frame.size.height+10+self.descriptionView1.frame.size.height+10;
    CGRect frame = CGRectMake(0, descriptionViewY, screen_width, height);
    
    self.descriptionView2 = [[CommonItemTxtView alloc] initWithFrame:frame
                                                 commonItemTxtArray:array
                                                               font:font
                                                         showMarkImg:NO];
    self.descriptionView2.backgroundColor = [UIColor whiteColor];
    self.descriptionView2.markImgView.hidden = YES;
    [self.bottomView addSubview:self.descriptionView2];
}
@end
