//
//  AboutUsCell.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AboutUsCell.h"

@implementation AboutUsCell

- (void)awakeFromNib {
    // Initialization code
    self.upLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 0.5)];
    self.upLine.backgroundColor = splite_line_color;
    [self.contentView addSubview:self.upLine];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5,screen_width,0.5)];
    self.lineView.backgroundColor = splite_line_color;
    [self.contentView addSubview:self.lineView];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
