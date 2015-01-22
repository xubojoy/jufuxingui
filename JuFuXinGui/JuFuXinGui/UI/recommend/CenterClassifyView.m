//
//  CenterClassifyView.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-30.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "CenterClassifyView.h"

@implementation CenterClassifyView

- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle]loadNibNamed:@"CenterClassifyView" owner:self options:nil] objectAtIndex:0];
        self.frame = frame;
        
        CGRect bgImgFrame = self.bgImg.frame;
        CGRect classifyContentFrame = self.classifyContent.frame;
        CGRect titleLabFrame = self.titleLab.frame;
        bgImgFrame.size.width = (screen_width-60)/3;
        classifyContentFrame.size.width = (screen_width-60)/3;
        titleLabFrame.size.width = (screen_width-60)/3;
        self.bgImg.frame = bgImgFrame;
        self.classifyContent.frame = classifyContentFrame;
        self.titleLab.frame = titleLabFrame;
    }
    return self;
}

- (IBAction)tapBtnClick:(id)sender{
}
@end
