//
//  InvestmentCell.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "InvestmentCell.h"

@implementation InvestmentCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"InvestmentCell" owner:self options:nil] lastObject];
        self.statusLabel.frame = CGRectMake(screen_width-55, 6, 40, 16);
        self.statusLabel.backgroundColor = RGBACOLOR(244, 66, 71, 1);
        CALayer *layer = self.statusLabel.layer;
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:2];

        self.downLine.frame = CGRectMake(general_margin, 79.5, screen_width-general_margin, splite_line_height);
        self.downLine.backgroundColor = splite_line_color;
        
        CGRect moreBtnFrame = self.moreBtn.frame;
        CGRect fengBIQiLabelFrame = self.fengBIQiTitle.frame;
        CGRect qiTouZiJinLabelFrame = self.qiTouZiJinTitle.frame;
        CGRect fenBiLabFrame = self.fenBiLab.frame;
        CGRect qiTouAmountLabFrame = self.qiTouAmountLab.frame;
        
        
        moreBtnFrame.origin.x = (screen_width-30)/2;
        fengBIQiLabelFrame.origin.x = (screen_width-100)/2;
        qiTouZiJinLabelFrame.origin.x = screen_width-general_margin-100;
        fenBiLabFrame.origin.x = (screen_width-100)/2;
        qiTouAmountLabFrame.origin.x = screen_width-general_margin-100;
        
        self.moreBtn.frame = moreBtnFrame;
        self.fengBIQiTitle.frame = fengBIQiLabelFrame;
        self.qiTouZiJinTitle.frame = qiTouZiJinLabelFrame;
        self.fenBiLab.frame = fenBiLabFrame;
        self.qiTouAmountLab.frame = qiTouAmountLabFrame;
        
        self.exceptYearRate.textColor = [UIColor redColor];
        self.fenBiLab.textColor = [UIColor redColor];
        self.qiTouAmountLab.textColor = [UIColor redColor];
        self.statusLabel.textColor = [UIColor whiteColor];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
 
}

-(void)renderInvestMentWithDict:(NSDictionary *)dic{
    self.titleClassify.text = [dic valueForKey:@"month"];
    self.exceptYearRate.text = [dic valueForKey:@"interestrates"];
    self.fenBiLab.text = [dic valueForKey:@"timelong"];
    self.qiTouAmountLab.text = [dic valueForKey:@"minmoney"];
    NSInteger ishot = [[dic valueForKey:@"ishot"] integerValue];
    self.statusLabel.text = [self isHot:ishot];
    if (ishot == 0) {
        self.statusLabel.backgroundColor = [UIColor lightGrayColor];
        self.exceptYearRateTitle.textColor = [UIColor redColor];
        self.fengBIQiTitle.textColor = [UIColor redColor];
        self.qiTouZiJinTitle.textColor = [UIColor redColor];
    }else{
        self.statusLabel.backgroundColor = [UIColor redColor];
        self.exceptYearRateTitle.textColor = [UIColor lightGrayColor];
        self.fengBIQiTitle.textColor = [UIColor lightGrayColor];
        self.qiTouZiJinTitle.textColor = [UIColor lightGrayColor];
    }
}

-(NSString *)isHot:(NSInteger)ishot{
    
    NSString *isHotStr;
    if (ishot == 1) {
        isHotStr = @"热销";
    }else if(ishot == 2){
        isHotStr = @"售罄";
    }else if(ishot == 0){
        isHotStr = @"待售";
    }
    return isHotStr;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)moreBtnClick:(UIButton *)sender {
    
    
}
@end
