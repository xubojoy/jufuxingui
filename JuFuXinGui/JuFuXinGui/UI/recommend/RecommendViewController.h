//
//  NextViewController.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailView.h"
#import "CenterView.h"
#import "UserModel.h"
#import "InsetsLabel.h"
@interface RecommendViewController : UIViewController<CenterViewDelegate,UITableViewDataSource,UITableViewDelegate,ISSShareViewDelegate,ISSViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) UserModel *user;
@property (nonatomic, strong) ItemDetailView *itemDetailView;
@property (nonatomic, strong) CenterView *centerView;
@property (strong, nonatomic) CommonItemTxtView *descriptionView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *amountProcessorView;
@property (nonatomic, strong) UILabel *qiLabel;
@property (nonatomic, strong) UIButton *detailBtn;
@property (nonatomic, strong) UIImageView *markImgView;
@property (nonatomic, strong) UIImageView *roundImgView;
@property (nonatomic, strong) UITableView *tableView;

//处理centerView
@property (nonatomic, strong) UILabel *centerTitleLabel;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UILabel *centerContent;
@property (nonatomic, strong) NSDictionary *centerViewDic;
@property (nonatomic, strong) NSDictionary *centerViewCenterDic;
@property (nonatomic, strong) NSDictionary *centerViewRightDic;
@property (nonatomic, strong) NSMutableArray *centerRightArray;

//处理加减
@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UITextField *amountField;
@property (nonatomic, strong) UIButton *plusBtn;

@property (nonatomic, strong) UILabel *incomeLab;

@property (nonatomic, strong) UIView *exceptIncomeView;

//处理数据
@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *allmoney;
@property (nonatomic, strong) NSDictionary *productDetailDic;
@property (nonatomic, copy) NSString *interestrates;



-(instancetype)initWithProductId:(NSString *)productId investMenoy:(NSString *)allmoney interestrates:(NSString *)interestrates;

@end
