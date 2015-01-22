//
//  RecommendDetailController.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopViewCell.h"
#import "ExceptYearRateCell.h"
#import "CommonItemTxt.h"
#import "CommonItemTxtView.h"
#import "InsetsLabel.h"
@interface RecommendDetailController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) CommonItemTxtView *descriptionView;
@property (strong, nonatomic) CommonItemTxtView *descriptionView1;
@property (strong, nonatomic) CommonItemTxtView *descriptionView2;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *bottomView;
//@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) InsetsLabel * content;

@property (nonatomic, copy) NSString *productId;
@property (nonatomic, strong) NSDictionary *detailDict;

@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UILabel *thirdLabel;



-(instancetype)initWithProductId:(NSString *)productId;

@end