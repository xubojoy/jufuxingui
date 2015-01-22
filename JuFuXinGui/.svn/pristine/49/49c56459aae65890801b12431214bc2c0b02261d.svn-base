//
//  ExceptYearRateCell.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-29.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "ExceptYearRateCell.h"
#import "Macro.h"

@implementation ExceptYearRateCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"ExceptYearRateCell" owner:self options:nil] lastObject];
        
        self.upLine.frame = CGRectMake(0, 0, screen_width, 0.5);
        self.upLine.backgroundColor = splite_line_color;
        self.centerLine.frame = CGRectMake(general_margin, 48, screen_width-general_margin, 0.5);
        self.centerLine.backgroundColor = splite_line_color;
        self.downLine.frame = CGRectMake(0, 94.5, screen_width, 0.5);
        self.downLine.backgroundColor = splite_line_color;
        
        self.yearRateLabel.textColor = [UIColor redColor];
        self.descriptionLabel.textColor = [UIColor lightGrayColor];
        
        CGRect yearRateLabelFrame = self.yearRateLabel.frame;
        CGRect descriptionLabelFrame = self.descriptionLabel.frame;
        CGRect moreBtnFrame = self.moreBtn.frame;
        yearRateLabelFrame.origin.x = screen_width-general_margin-100;
        descriptionLabelFrame.size.width = screen_width-30;
        moreBtnFrame.origin.x = screen_width-45;
        self.yearRateLabel.frame = yearRateLabelFrame;
        self.descriptionLabel.frame = descriptionLabelFrame;
        self.moreBtn.frame = moreBtnFrame;
        
        [self.descriptionLabel sizeToFit];
        
    }
    return self;
}

-(void)renderCellWithDic:(NSDictionary *)dic{

    self.yearRateLabel.text = [dic valueForKey:@"interestrates"];
    self.descriptionLabel.text = [dic valueForKey:@"infor1"];

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)moreBtnClick:(UIButton *)sender {
    
    
    NSLog(@">>>>>>>>>>>more btn 点击");
    
}
@end
