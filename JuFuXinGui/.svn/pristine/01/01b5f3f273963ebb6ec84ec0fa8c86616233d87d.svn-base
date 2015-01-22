//
//  NextViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "RecommendViewController.h"
#import "ShareSDKProcessor.h"
#import "ShareContent.h"
#import "RecommendDetailController.h"
#import "LoginViewController.h"
#import "InvestRecordCell.h"
#import "AccountViewController.h"
#import "ProjectViewController.h"

static NSString *identifier = @"recordCell";
@interface RecommendViewController ()

@end

@implementation RecommendViewController
-(instancetype)initWithProductId:(NSString *)productId investMenoy:(NSString *)allmoney interestrates:(NSString *)interestrates{
    self = [super init];
    if (self) {
        self.productId = productId;
        self.allmoney = allmoney;
        self.interestrates = interestrates;
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden = YES;
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
    
    self.productDetailDic = [NSDictionary new];
    self.centerViewDic = [NSDictionary new];
    self.centerViewCenterDic = [NSDictionary new];
    self.centerViewRightDic = [NSDictionary new];
    self.centerRightArray = [NSMutableArray new];
    [self setRightSwipeGesture];
    [self initHeader];
    [self initScrollView];
    [self loadProductDeatilData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBACOLOR(240, 240, 240, 1);
   
    
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
    [shareBtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
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
#pragma mark - 数据处理
-(void)loadProductDeatilData{
    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:30 show:YES];
    NSString *url = URL_Product_Detail(self.productId);
    JSHttpRequest *requset = [[JSHttpRequest alloc] init];
    [requset StartWorkWithUrlstr:url];
    requset.successGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
        NSString *code = [obj valueForKey:@"code"];
        if ([code isEqualToString:@"01"]) {
            NSArray *array = [obj valueForKey:@"result"];
            self.productDetailDic = [array objectAtIndex:0];
            [self initTopView];
            [self initItemDetailView];
            [self initCenterView];
            [self initBottomView];
            [self initAmountProcessor];
            [self initExceptIncomeView];
            [self initBottomBtn];
        }
    };
    requset.failureGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
    };
}

//初始化black view
-(void)initTopView{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 30)];
    self.topView.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:self.topView];
    
    self.markImgView = [[UIImageView alloc] initWithFrame:CGRectMake(general_margin, 0, 20, 45)];
    self.markImgView.image = [UIImage imageNamed:@"ben_xi_bao_zhang"];
    [self.topView addSubview:self.markImgView];

    
    self.qiLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 30)];
    [self.qiLabel setTextColor:[UIColor whiteColor]];
    self.qiLabel.font = [UIFont systemFontOfSize:16];
    self.qiLabel.textAlignment = NSTextAlignmentCenter;
    
    self.qiLabel.text = [self.productDetailDic valueForKey:@"month"];
    [self.topView addSubview:self.qiLabel];
    
    self.detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.detailBtn.frame = CGRectMake(screen_width-200, 0,200, 30);
    self.detailBtn.titleEdgeInsets = UIEdgeInsetsMake(0,150, 0, 0);
    [self.detailBtn setTitle:@"详情" forState:UIControlStateNormal];
    [self.detailBtn setTintColor:[UIColor whiteColor]];
    self.detailBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.detailBtn addTarget:self action:@selector(detailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.detailBtn];
    
}

//初始化项目详情view
-(void)initItemDetailView{
    self.itemDetailView = [[ItemDetailView alloc] init];
    self.itemDetailView.backgroundColor = [UIColor whiteColor];
    [self.itemDetailView renderItemViewWithDic:self.productDetailDic];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [self.itemDetailView addGestureRecognizer:tap];
    [self.scrollView addSubview:self.itemDetailView];
}

//初始化centerView
-(void)initCenterView{
    self.centerView = [[CenterView alloc] init];
    self.centerView.backgroundColor = [UIColor whiteColor];
    self.centerView.delegate = self;
    [self.scrollView addSubview:self.centerView];
}

-(void)didClassifyBtn:(UIButton *)aSender{
    NSLog(@">>>>>>>>>>>>>>点击 sender tag:%ld", aSender.tag);
    [self.bottomView removeFromSuperview];
    float y = self.centerView.frame.origin.y + self.centerView.frame.size.height + general_padding;
    if (aSender.tag == 900) {
        [self removeTableViewSubViews];
        [self.tableView removeFromSuperview];
        [self.roundImgView removeFromSuperview];
        [self.centerTitleLabel removeFromSuperview];
        [self.centerContent removeFromSuperview];
        [self loadCenterViewLeftData:aSender.tag];
        
        CGRect frame = CGRectMake(general_margin, y+general_padding, general_padding, general_padding);
        self.roundImgView = [[UIImageView alloc] initWithFrame:frame];
        self.roundImgView.image = [UIImage imageNamed:@"round_icon"];
        [self.scrollView addSubview:self.roundImgView];
        
        self.centerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(general_margin+general_padding+4, y, screen_width-2*general_margin, 30)];
        self.centerTitleLabel.text = @"简介";
        self.centerTitleLabel.textAlignment = NSTextAlignmentLeft;
        self.centerTitleLabel.font = [UIFont systemFontOfSize:14];
        [self.scrollView addSubview:self.centerTitleLabel];
    }else if (aSender.tag == 901){
        [self removeTableViewSubViews];
        [self.tableView removeFromSuperview];
        [self.roundImgView removeFromSuperview];
        [self.centerTitleLabel removeFromSuperview];
        [self.content removeFromSuperview];
        [self loadCenterViewCenterData:aSender.tag];

        CGRect frame = CGRectMake(general_margin, y+general_padding, general_padding, general_padding);
        self.roundImgView = [[UIImageView alloc] initWithFrame:frame];
        self.roundImgView.image = [UIImage imageNamed:@"round_icon"];
        [self.scrollView addSubview:self.roundImgView];
        
        self.centerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(general_margin+general_padding+4, y, screen_width-2*general_margin, 30)];
        self.centerTitleLabel.text = @"保障方式";
        self.centerTitleLabel.textAlignment = NSTextAlignmentLeft;
        self.centerTitleLabel.font = [UIFont systemFontOfSize:14];
        [self.scrollView addSubview:self.centerTitleLabel];
    }else if (aSender.tag == 902){
        self.roundImgView.hidden = YES;
        [self.roundImgView removeFromSuperview];
        [self.centerTitleLabel removeFromSuperview];
        [self.centerContent removeFromSuperview];
        [self.content removeFromSuperview];
        [self loadCenterRightData];
    }
}

-(void)removeTableViewSubViews{
    for (UIView *view in self.tableView.subviews) {
        [view removeFromSuperview];
    }
}


#pragma mark - 渲染centerView数据数据
//渲染centerView数据
-(void)loadCenterViewLeftData:(NSInteger)tag{
    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:30 show:YES];
    NSString *url  = URL_Product_Details_info(self.productId);
    JSHttpRequest *request = [[JSHttpRequest alloc] init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
        NSString *code = [obj valueForKey:@"code"];
        if ([code isEqualToString:@"01"]) {
            NSArray *array = [obj valueForKey:@"result"];
            self.centerViewDic = [array objectAtIndex:0];
            [self initCenterViewLeft];
        }
    };
}

-(void)loadCenterViewCenterData:(NSInteger)tag{
    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:30 show:YES];
    NSString *url  = URL_Product_Detailss_info(self.productId);
    JSHttpRequest *request = [[JSHttpRequest alloc] init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
        NSString *code = [obj valueForKey:@"code"];
        if ([code isEqualToString:@"01"]) {
            NSArray *array = [obj valueForKey:@"result"];
            self.centerViewCenterDic = [array objectAtIndex:0];
            [self initCenterViewCenter];
        }
    };
}

-(void)loadCenterRightData{
    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:30 show:YES];
    NSString *url  = URL_Product_allinvest_info(self.productId);
    JSHttpRequest *request = [[JSHttpRequest alloc] init];
    [request StartWorkWithUrlstr:url];
    request.successGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
        NSString *code = [obj valueForKey:@"code"];
        if ([code isEqualToString:@"01"]) {
            self.centerRightArray = [obj valueForKey:@"result"];
            [self initInvestRecord];
        }
    };
}

-(void)initCenterViewLeft{
    float y = self.centerView.frame.origin.y + self.centerView.frame.size.height + general_padding+35;
    self.content = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];//这个frame是初设的，没关系，后面还会重新设置其size。
    self.content.backgroundColor = [UIColor purpleColor];
    
    self.content.text = [self.centerViewDic valueForKey:@"infor"];
    self.content.font = [UIFont systemFontOfSize:14];
    self.content.textColor = [UIColor lightGrayColor];
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self.content.text];
    self.content.attributedText = attrStr;
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    CGSize size = [self.content.text boundingRectWithSize:CGSizeMake(screen_width-30,20000.0f) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil].size;
    [self.content setFrame:CGRectMake(15,y, screen_width-30, size.height)];
    
    [self.content setNumberOfLines:0];
    
    //设置content的行间距
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.content.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:5];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.content.text length])];
    [self.content setAttributedText:attributedString1];
    [self.content sizeToFit];
    [self.scrollView addSubview:self.content];
}

-(void)initCenterViewCenter{
    float y = self.centerView.frame.origin.y + self.centerView.frame.size.height + general_padding+35;
    self.centerContent = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];//这个frame是初设的，没关系，后面还会重新设置其size。
    self.centerContent.backgroundColor = [UIColor purpleColor];
    self.centerContent.font = [UIFont systemFontOfSize:14];
    self.centerContent.text = [self.centerViewCenterDic valueForKey:@"safeinfor"];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.centerContent.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:5];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.centerContent.text length])];
    self.centerContent.attributedText = attrStr;
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    CGSize size = [self.centerContent.text boundingRectWithSize:CGSizeMake(screen_width,5000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:dic context:nil].size;
    [self.centerContent setFrame:CGRectMake(15, y, screen_width-30, size.height)];
    [self.centerContent setNumberOfLines:0];
    [self.centerContent sizeToFit];
    [self.scrollView addSubview:self.centerContent];
}

-(void)initInvestRecord{
    float y = self.centerView.frame.origin.y + self.centerView.frame.size.height;
    CGRect frame = CGRectMake(general_margin, y, screen_width-general_margin*2, 300);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = view_bg_color;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINib *nib = [UINib nibWithNibName:@"InvestRecordCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
    [self.scrollView addSubview:self.tableView];
}

#pragma mark - 渲染bottom
-(void)initBottomView{
    CGRect bottomViewFrame = self.bottomView.frame;
    bottomViewFrame.origin.y = self.centerView.frame.origin.y + self.centerView.frame.size.height + general_padding;
    bottomViewFrame.size.width = screen_width;
    bottomViewFrame.origin.x = 0;
    bottomViewFrame.size.height = VIEW_HEIGHT-self.header.frame.size.height-self.centerView.frame.origin.y - self.centerView.frame.size.height;
    self.bottomView = [[UIView alloc] initWithFrame:bottomViewFrame];
    self.bottomView.backgroundColor = view_bg_color;
    [self.scrollView addSubview:self.bottomView];
}

//选择金额处理器
-(void)initAmountProcessor{
    
    CGRect amountProcessorFrame = self.amountProcessorView.frame;
    amountProcessorFrame.origin.y = 0;
    amountProcessorFrame.size.width = screen_width-50;
    amountProcessorFrame.origin.x = 25;
    amountProcessorFrame.size.height = 40;
    self.amountProcessorView = [[UIView alloc] initWithFrame:amountProcessorFrame];
    self.amountProcessorView.backgroundColor = [UIColor whiteColor];
    CALayer *layer = self.amountProcessorView.layer;
    [layer setBorderWidth:0.5];
    [layer setBorderColor:splite_line_color.CGColor];
    [self.bottomView addSubview:self.amountProcessorView];
    
    UILabel *remindLab = [[UILabel alloc] initWithFrame:CGRectMake(0, amountProcessorFrame.origin.y+amountProcessorFrame.size.height, screen_width, 30)];
    remindLab.text = @"购买金额（元）";
    remindLab.textAlignment = NSTextAlignmentCenter;
    remindLab.font = [UIFont systemFontOfSize:12];
    remindLab.textColor = [UIColor lightGrayColor];
    [self.bottomView addSubview:remindLab];
    
    self.subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.subBtn.frame = CGRectMake(0, 0, 60, 40);
    [self.subBtn setImage:[UIImage imageNamed:@"sub_icon"] forState:UIControlStateNormal];
    [self.subBtn addTarget:self action:@selector(amountBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.subBtn.tag = 100;
    [self.amountProcessorView addSubview:self.subBtn];

    self.amountField = [[UITextField alloc] initWithFrame:CGRectMake(60, 0, amountProcessorFrame.size.width-120, 40)];
    layer = self.amountField.layer;
    [layer setBorderWidth:0.5];
    [layer setBorderColor:splite_line_color.CGColor];
    self.amountField.textAlignment = NSTextAlignmentCenter;
    self.amountField.text = [self.productDetailDic valueForKey:@"minmoney"];
    [self.amountProcessorView addSubview:self.amountField];

    self.plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.plusBtn.frame = CGRectMake(amountProcessorFrame.size.width-60, 0, 60, 40);
    [self.plusBtn setImage:[UIImage imageNamed:@"plus_icon"] forState:UIControlStateNormal];
    [self.plusBtn addTarget:self action:@selector(amountBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.plusBtn.tag = 101;
    [self.amountProcessorView addSubview:self.plusBtn];
}

-(void)initExceptIncomeView{
    
    CGRect incomeViewFrame = self.exceptIncomeView.frame;
    incomeViewFrame.origin.y = self.amountProcessorView.frame.origin.y + self.amountProcessorView.frame.size.height+30;
    incomeViewFrame.size.width = screen_width;
    incomeViewFrame.size.height = 45;
    
    self.exceptIncomeView = [[UIView alloc] initWithFrame:incomeViewFrame];
    self.exceptIncomeView.backgroundColor = [UIColor whiteColor];
    CALayer *layer = self.exceptIncomeView.layer;
    [layer setBorderWidth:0.5];
    [layer setBorderColor:splite_line_color.CGColor];
    [self.bottomView addSubview:self.exceptIncomeView];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(general_margin, 0, 80, 45)];
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.text = @"预计收益：";
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.textAlignment = NSTextAlignmentLeft;
    [self.exceptIncomeView addSubview:titleLab];
    
    self.incomeLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, screen_width-90, 45)];
    self.incomeLab.backgroundColor = [UIColor clearColor];
    
    float income = [[self.productDetailDic valueForKey:@"interestrates"] floatValue]*0.01*[self.amountField.text floatValue];
    self.incomeLab.text = [NSString stringWithFormat:@"¥%f",income];
    self.incomeLab.textColor = [UIColor redColor];
    self.incomeLab.font = [UIFont systemFontOfSize:16];
    self.incomeLab.textAlignment = NSTextAlignmentRight;
    [self.exceptIncomeView addSubview:self.incomeLab];
    
    UILabel *remindLab = [[UILabel alloc] initWithFrame:CGRectMake(0, incomeViewFrame.origin.y+incomeViewFrame.size.height, screen_width, 30)];
    remindLab.text = @"账户资金安全由担保公司全额本息担保";
    remindLab.textAlignment = NSTextAlignmentCenter;
    remindLab.font = [UIFont systemFontOfSize:12];
    remindLab.textColor = [UIColor lightGrayColor];
    [self.bottomView addSubview:remindLab];
}

-(void)initBottomBtn{
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = CGRectMake(30, self.exceptIncomeView.frame.origin.y+self.exceptIncomeView.frame.size.height+30, screen_width-60, 40);
    buyBtn.backgroundColor = [UIColor redColor];
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(buyBtnClcik) forControlEvents:UIControlEventTouchUpInside];
    CALayer *layer = buyBtn.layer;
    [layer setCornerRadius:5];
    [layer setMasksToBounds:YES];
    [self.bottomView addSubview:buyBtn];
}

#pragma mark - UIBUtton 方法
//处理加减金额
-(void)amountBtnClick:(UIButton *)sender{
    int amount =  self.amountField.text.intValue;
    int amountMin = [[self.productDetailDic valueForKey:@"minmoney"] intValue];
    int amountMax = [[self.productDetailDic valueForKey:@"maxmoney"] intValue];
    if (sender.tag == 100) {
        amount = (amount-amountMin<amountMin ) ? amountMin : (amount-amountMin) ;
    }else if (sender.tag == 101 && amount < amountMax && amountMax-amount>=amountMin){
        amount =+ amount+amountMin;
    }
    self.amountField.text = [NSString stringWithFormat:@"%d",amount];
    
    float income = [[self.productDetailDic valueForKey:@"interestrates"] floatValue]*0.01*[self.amountField.text floatValue];
    self.incomeLab.text = [NSString stringWithFormat:@"¥%f",income];
    // 处理修改数量的按钮
    if (amount == amountMin && sender.tag == 100) {
        self.subBtn.enabled = NO;
        self.plusBtn.enabled = YES;
    }else if (amount == amountMax && sender.tag == 101){
        self.subBtn.enabled = YES;
        self.plusBtn.enabled = NO;
    }
    else{
        self.subBtn.enabled = YES;
        self.plusBtn.enabled = YES;
    }
}

//详情按钮
-(void)detailBtnClick:(UIButton *)sender{
    RecommendDetailController *rdvc = [[RecommendDetailController alloc] initWithProductId:self.productId];
    [self.navigationController pushViewController:rdvc animated:YES];
}

#pragma mark - 实现分享
// -----------------ShareSDK实现分享功能------------------
-(void)shareBtnPress:(id)sender{
    ShareContent *shareContent = [self collectionShareContent];
    ShareSDKProcessor *shareSDKProcessor = [ShareSDKProcessor new];
    [shareSDKProcessor share:shareContent shareViewDelegate:self sender:sender shareSuccessBlock:^{
    }];
}

-(ShareContent *) collectionShareContent{
    
    NSString *title = @"赚乐宝";
    NSString *content = @"做投资的最佳选择！";
    
    ShareContent *shareContent = [[ShareContent alloc] initWithTitle:title
                                                             content:content
                                                    sinaWeiBoContent:content
                                                                 url:@"www.baidu.com"
                                                               image:[UIImage imageNamed:@"108.png"]
                                                            imageUrl:nil];
    return shareContent;
}

- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType
{
    [ShareSDKProcessor customShareView:viewController shareType:shareType];
}

//立即购买按钮
-(void)buyBtnClcik{
    
    if (![UserModel shareuser].isLoad) {
        LoginViewController *lvc = [[LoginViewController alloc] init];
        [self.navigationController presentViewController:lvc animated:YES completion:^{
        }];
    }else{
        [self loadBuyNow];
    }
}

-(void)loadBuyNow{
    NSError *error = nil;
    NSLog(@">>>>>self.productId>>>>>>>:%@",self.productId);
    NSLog(@">>>>>[self.amountField.text floatValue]>>>>>>>:%d",[self.amountField.text intValue]);
    NSLog(@">>>>>interestrates>>>>>>>:%@",self.interestrates);
    NSLog(@">>>>>[UserModel shareuser].token>>>>>>>:%@",[UserModel shareuser].token);
    NSLog(@">>>>>[UserModel shareuser].userid>>>>>>>:%@",[UserModel shareuser].userid);
    [MBHUDView hudWithBody:@"正在提交..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:1000 show:YES];
    NSDictionary *postDic = [NSDictionary dictionaryWithObjectsAndKeys:[UserModel shareuser].token,@"token",self.productId,@"id",[UserModel shareuser].userid,@"uid",self.amountField.text,@"moneys",self.interestrates,@"interestrates", nil];
    NSString *url = URL_Buy_Now;
    JSHttpRequest *request = [[JSHttpRequest alloc] init];
    [request StartWorkPostWithurlstr:url pragma:postDic ImageData:nil];
    request.successGetData = ^(id obj){
        [MBHUDView dismissCurrentHUD];
        NSLog(@">>>>>>立即购买>>>>>>>%@",obj);
        AccountViewController *avc = [[AccountViewController alloc] initWithType:type_from_buy];
        [self.navigationController pushViewController:avc animated:YES];
    };
    request.failureGetData = ^(id obj){
    
        NSLog(@">>>>>>>>>>error:%@",[error description]);
    };
}

#pragma mark - tap click

-(void)tapClick:(UITapGestureRecognizer *)tap{
    [self.tableView removeFromSuperview];
    [self.scrollView addSubview:self.bottomView];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.centerRightArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InvestRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell renderCellWithDic:[self.centerRightArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(general_margin, 0, screen_width-2*general_margin, 30)];
    view.backgroundColor = view_bg_color;
    float width = (view.frame.size.width)/3;
    UILabel *leftLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    leftLab.text = @"名称";
    leftLab.textAlignment = NSTextAlignmentLeft;
    leftLab.font = [UIFont systemFontOfSize:16];
    [view addSubview:leftLab];
    
    UILabel *centerLab = [[UILabel alloc] initWithFrame:CGRectMake(width, 0, width, 30)];
    centerLab.text = @"金额";
    centerLab.textAlignment = NSTextAlignmentCenter;
    centerLab.font = [UIFont systemFontOfSize:16];
    [view addSubview:centerLab];
    
    UILabel *rightLab = [[UILabel alloc] initWithFrame:CGRectMake(width*2, 0, width, 30)];
    rightLab.text = @"时间";
    rightLab.textAlignment = NSTextAlignmentRight;
    rightLab.font = [UIFont systemFontOfSize:16];
    [view addSubview:rightLab];
    
    return view;

}

@end
