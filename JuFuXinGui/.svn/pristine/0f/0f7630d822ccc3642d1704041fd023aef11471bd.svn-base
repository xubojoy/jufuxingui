//
//  InvestmentCell.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    HotSale  = 0,
    SaleOver  = 1,
    WaitingSale  = 2,
} SaleState;

@interface InvestmentCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleClassify;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (weak, nonatomic) IBOutlet UILabel *exceptYearRateTitle;

@property (weak, nonatomic) IBOutlet UILabel *exceptYearRate;

@property (weak, nonatomic) IBOutlet UILabel *fengBIQiTitle;
@property (weak, nonatomic) IBOutlet UILabel *fenBiLab;
@property (weak, nonatomic) IBOutlet UILabel *qiTouZiJinTitle;
@property (weak, nonatomic) IBOutlet UILabel *qiTouAmountLab;

@property (weak, nonatomic) IBOutlet UIView *downLine;


- (IBAction)moreBtnClick:(UIButton *)sender;

-(void)renderInvestMentWithDict:(NSDictionary *)dic;

@end
