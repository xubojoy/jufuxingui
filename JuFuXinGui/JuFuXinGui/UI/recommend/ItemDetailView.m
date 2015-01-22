//
//  ItemDetailView.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "ItemDetailView.h"

@implementation ItemDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle]loadNibNamed:@"ItemDetailView" owner:self options:nil] objectAtIndex:0];
    
        self.frame = CGRectMake(0, 50, screen_width, 144);
        
        
        self.upLine.frame = CGRectMake(0, 0, screen_width, splite_line_height);
        self.midLine.frame = CGRectMake(general_margin, 48, screen_width-general_margin, splite_line_height);
        self.midLine2.frame = CGRectMake(general_margin, 96, screen_width-general_margin, splite_line_height);
        self.downLine.frame = CGRectMake(0, 143.5, screen_width, splite_line_height);
        
        CGRect expectStartTimeLab = self.expectStartTimeLab.frame;
        CGRect remianAmountLab = self.remianAmountLab.frame;
        CGRect singleMaxAmountLab = self.singleMaxAmountLab.frame;
        CGRect label1 = self.label1.frame;
        CGRect label2 = self.label2.frame;
        CGRect label3 = self.label3.frame;
        
        expectStartTimeLab.origin.x = screen_width-144-general_padding;
        remianAmountLab.origin.x = screen_width-144-general_padding;
        singleMaxAmountLab.origin.x = screen_width-144-general_padding;
        label1.origin.x = screen_width-120-general_padding;
        label2.origin.x = screen_width-120-general_padding;
        label3.origin.x = screen_width-139-general_padding;
        
        self.expectStartTimeLab.frame = expectStartTimeLab;
        self.remianAmountLab.frame = remianAmountLab;
        self.singleMaxAmountLab.frame = singleMaxAmountLab;
        self.label1.frame = label1;
        self.label2.frame = label2;
        self.label3.frame = label3;

        self.expectRateLab.textColor = [UIColor redColor];
        self.expectStartTimeLab.textColor = [UIColor redColor];
        self.closedPeriodLab.textColor = [UIColor redColor];
        self.remianAmountLab.textColor = [UIColor redColor];
        self.minInvestLab.textColor = [UIColor redColor];
        self.singleMaxAmountLab.textColor = [UIColor redColor];
        self.label1.textColor = [UIColor lightGrayColor];
        self.label2.textColor = [UIColor lightGrayColor];
        self.label3.textColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)renderItemViewWithDic:(NSDictionary *)dic{
    NSLog(@">>>>dic >>>>>>>>>%@",dic);
    self.expectRateLab.text = [dic valueForKey:@"interestrates"];
    long long int startTime = [[dic valueForKey:@"sarttime"] longLongValue];
    self.expectStartTimeLab.text = [self expiredTimeString:startTime];
    self.closedPeriodLab.text = [dic valueForKey:@"timelong"];
    self.remianAmountLab.text = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"remaining"] intValue]];
    self.minInvestLab.text = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"minmoney"] intValue]];
    self.singleMaxAmountLab.text = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"maxmoney"] intValue]];
}

-(NSString *)expiredTimeString:(long long int)startTime
{
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:startTime/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-M-d";
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
    
}



@end