//
//  TopViewCell.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *exceptYearRateLab;
@property (weak, nonatomic) IBOutlet UILabel *minInvestLab;
@property (weak, nonatomic) IBOutlet UILabel *fengBiQiLab;

@property (weak, nonatomic) IBOutlet UILabel *exceptLab;
@property (weak, nonatomic) IBOutlet UILabel *minInvestLabel;
@property (weak, nonatomic) IBOutlet UILabel *fengBiLabel;


@property (weak, nonatomic) IBOutlet UIView *midLine;

@property (weak, nonatomic) IBOutlet UIView *downLine;

-(void)renderCellWithDic:(NSDictionary *)dic;




@end