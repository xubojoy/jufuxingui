//
//  InvestRecordCell.m
//  JuFuXinGui
//
//  Created by myStyle on 15-1-12.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "InvestRecordCell.h"

@implementation InvestRecordCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, screen_width-2*general_margin, 44);
    self.nameLab.textColor = [UIColor lightGrayColor];
    self.amountLab.textColor = [UIColor lightGrayColor];
    self.timeLab.textColor = [UIColor lightGrayColor];
    self.nameLab.backgroundColor = view_bg_color;
    self.amountLab.backgroundColor = view_bg_color;
    self.timeLab.backgroundColor = view_bg_color;

    CGRect nameLabFrame = self.nameLab.frame;
    CGRect amountLabFrame = self.amountLab.frame;
    CGRect timeLabFrame = self.timeLab.frame;
    
    nameLabFrame.origin.x = 0;
    nameLabFrame.size.width = self.frame.size.width/3;
    amountLabFrame.origin.x = self.frame.size.width/3;
    amountLabFrame.size.width = self.frame.size.width/3;
    timeLabFrame.origin.x = (self.frame.size.width/3)*2;
    timeLabFrame.size.width = self.frame.size.width/3;
    self.nameLab.frame = nameLabFrame;
    self.amountLab.frame = amountLabFrame;
    self.timeLab.frame = timeLabFrame;
    
    self.nameLab.textAlignment = NSTextAlignmentLeft;
    self.amountLab.textAlignment = NSTextAlignmentCenter;
    self.timeLab.textAlignment = NSTextAlignmentRight;
    
    self.nameLab.text = @"名称";
    self.amountLab.text = @"金额";
    self.timeLab.text = @"时间";

}

-(void)renderCellWithDic:(NSDictionary *)dic{
    NSLog(@">>>>>>dicdicdicdic投资记录>>>>>>>>>>>>%@",dic);
    self.nameLab.text = [dic valueForKey:@"username"];
    self.amountLab.text = [dic valueForKey:@"moneys"];
    long long int addtime = [[dic valueForKey:@"addtime"] longLongValue];
    self.timeLab.text = [self addTimeString:addtime];
}

-(NSString *)addTimeString:(long long int)startTime
{
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:startTime/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-M-d";
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
