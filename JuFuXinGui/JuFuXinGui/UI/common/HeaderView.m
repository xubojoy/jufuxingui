//
//  HeaderView.m
//
//  Created by System Administrator on 14-1-16.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "HeaderView.h"


@implementation HeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
    }
    return self;
}

-(id)initWithTitle:(NSString *)titleStr navigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];
        self.backgroundColor = RGBACOLOR(41, 127, 255, 1);
        self.nc = navigationController;
        [self.title setFont:[UIFont boldSystemFontOfSize:20]];
        [self.title setTextColor:[UIColor whiteColor]];
        [self.title setText:[titleStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
  
        [self.backBut setImage:[UIImage imageNamed:@"top_return"] forState:UIControlStateNormal];
        [self.backBut addTarget:self action:@selector(popToFrontViewController:) forControlEvents:UIControlEventTouchUpInside];
        self.bgImg.hidden = YES;
        
        self.line.backgroundColor = RGBACOLOR(204, 204, 204, 1);
        self.line.frame = CGRectMake(self.line.frame.origin.x, self.line.frame.origin.y, screen_width,  splite_line_height);
        
        CGRect titleFrame = self.title.frame;
        CGRect bgImgFrame = self.bgImg.frame;
        CGRect backButFrame = self.backBut.frame;
        CGRect linFrame = self.line.frame;
        
        titleFrame.size.width = 200;
        titleFrame.origin.x = (screen_width-titleFrame.size.width)/2;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
            bgImgFrame.size.height = navigation_height + status_bar_height;
            bgImgFrame.size.width = screen_width;
            titleFrame.origin.y = status_bar_height + ((navigation_height-titleFrame.size.height)/2);
            backButFrame.origin.y = status_bar_height+((navigation_height-backButFrame.size.height)/2) ;
            linFrame.origin.y = status_bar_height + navigation_height-splite_line_height;
        }else
        {
            bgImgFrame.size.height = navigation_height;
            bgImgFrame.size.width = screen_width;
            titleFrame.origin.y = (navigation_height-titleFrame.size.height)/2;
            backButFrame.origin.y = ((navigation_height-backButFrame.size.height)/2) ;
            linFrame.origin.y = navigation_height-splite_line_height;
        }
        self.title.frame = titleFrame;
        self.bgImg.frame = bgImgFrame;
        self.backBut.frame = backButFrame;
        self.line.frame = linFrame;
        self.frame = CGRectMake(0, 0, screen_width, bgImgFrame.size.height);
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)popToFrontViewController:(id)sender
{
    [self.nc popViewControllerAnimated:YES];
}

@end
