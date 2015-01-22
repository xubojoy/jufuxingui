//
//  CenterView.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "CenterView.h"

@implementation CenterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle]loadNibNamed:@"CenterView" owner:self options:nil] objectAtIndex:0];
        
        self.frame = CGRectMake(0, 204, screen_width, 65);
        self.upLine.backgroundColor = splite_line_color;
        self.upLine.frame = CGRectMake(0, 0, screen_width, splite_line_height);
        self.downLine.backgroundColor = splite_line_color;
        self.downLine.frame = CGRectMake(0, 64.5, screen_width, splite_line_height);
        
        CGRect centerLeftBtn = self.centerLeftClassifyBtn.frame;
        CGRect centerBtn = self.centerClassifyBtn.frame;
        CGRect centerRightBtn = self.centerRightClassifyBtn.frame;
        centerLeftBtn.size.width = screen_width/3;
        centerLeftBtn.origin.x = 0;
        centerBtn.size.width = screen_width/3;
        centerBtn.origin.x = screen_width/3;
        centerRightBtn.size.width = screen_width/3;
        centerRightBtn.origin.x = 2*(screen_width/3);
        self.centerLeftClassifyBtn.frame = centerLeftBtn;
        self.centerClassifyBtn.frame = centerBtn;
        self.centerRightClassifyBtn.frame = centerRightBtn;
        
        CGRect img1Frame = self.img1.frame;
        CGRect img2Frame = self.img2.frame;
        CGRect img3Frame = self.img3.frame;
        img1Frame.origin.x = ((screen_width/3)-25)/2;
        img2Frame.origin.x = ((screen_width/3)-25)/2+(screen_width/3);
        img3Frame.origin.x = ((screen_width/3)-25)/2+(screen_width/3)*2;
        self.img1.frame = img1Frame;
        self.img2.frame = img2Frame;
        self.img3.frame = img3Frame;
        
        CGRect titlelab1Frame = self.titleLab1.frame;
        CGRect titlelab2Frame = self.titleLab2.frame;
        CGRect titlelab3Frame = self.titleLab3.frame;
        titlelab1Frame.size.width = screen_width/3;
        titlelab1Frame.origin.x = 0;
        titlelab2Frame.size.width = screen_width/3;
        titlelab2Frame.origin.x = screen_width/3;
        titlelab3Frame.size.width = screen_width/3;
        titlelab3Frame.origin.x = 2*(screen_width/3);
        self.titleLab1.frame = titlelab1Frame;
        self.titleLab2.frame = titlelab2Frame;
        self.titleLab3.frame = titlelab3Frame;
        self.titleLab1.textAlignment = NSTextAlignmentCenter;
        self.titleLab2.textAlignment = NSTextAlignmentCenter;
        self.titleLab3.textAlignment = NSTextAlignmentCenter;
        
        self.centerLeftLine = [[UIView alloc] initWithFrame:CGRectMake(screen_width/3, 0, splite_line_height, 65)];
        self.centerLeftLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.centerLeftLine];
        
        self.centerRightLine = [[UIView alloc] initWithFrame:CGRectMake((screen_width/3)*2, 0, splite_line_height, 65)];
        self.centerRightLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.centerRightLine];
    }
    return self;
}

- (IBAction)centerClassifyBtnClick:(UIButton *)sender {
    
    NSLog(@">>>>>>>>>>>>>>点击");
    if ([self.delegate respondsToSelector:@selector(didClassifyBtn:)]) {
        [self.delegate didClassifyBtn:sender];
    }
    
}
@end
